import * as cdk from "@aws-cdk/core";
import * as ec2 from "@aws-cdk/aws-ec2";
import * as fs from "fs";
import * as path from "path";
import { Construct, Resource } from "@aws-cdk/core";
import { CfnInstance } from "@aws-cdk/aws-ec2";

const setupHostScript = fs.readFileSync(
  path.resolve(__dirname, "../scripts/setuphost.ps1")
);

export class WindowsInstance extends Resource {

  public instance: CfnInstance

  constructor(
    scope: any,
    id: string,
    vpc: ec2.Vpc,
    EEKeyPair: cdk.CfnParameter,
  ) {
    super(scope, id);
    // EC2 Instance machine
    const DevAxWorkspaceWindowsAMI = new cdk.CfnMapping(
      scope,
      "DevAxWindowsAMI",
      {
        mapping: {
          "ap-northeast-1": { Windows2019: "ami-0f1d9d91c16265769" },
          "ap-northeast-2": { Windows2019: "ami-049e67b9661b9ee3e" },
          "ap-south-1": { Windows2019: "ami-03dbf9550d4620230" },
          "ap-southeast-1": { Windows2019: "ami-003ad59a0b2b3c98f" },
          "ap-southeast-2": { Windows2019: "ami-09a17b63e7283d6a2" },
          "ca-central-1": { Windows2019: "ami-0df364e027762ec43" },
          "eu-central-1": { Windows2019: "ami-0075ac87f3bb991bc" },
          "eu-north-1": { Windows2019: "ami-092287cf5a11bfb9e" },
          "eu-west-1": { Windows2019: "ami-0753ddff1a67fca78" },
          "eu-west-2": { Windows2019: "ami-0c80f4021417f8488" },
          "eu-west-3": { Windows2019: "ami-0ace5ff23b1a4725d" },
          "sa-east-1": { Windows2019: "ami-066d7f29fb6c7b3bb" },
          "us-east-1": { Windows2019: "ami-0f38562b9d4de0dfe" },
          "us-east-2": { Windows2019: "ami-066a1a3fa81bfbd00" },
          "us-west-1": { Windows2019: "ami-0d1b8b740ddc3b78d" },
          "us-west-2": { Windows2019: "ami-09fa39d0afa9024db" },
        },
      }
    );

    const DevAxWorkspaceSecurityGroup = new ec2.SecurityGroup(
      scope,
      "DevAxWindowsSecurityGroup",
      {
        allowAllOutbound: true,
        vpc,
        securityGroupName: "WorkspaceSecurityGroup",
      }
    );
    DevAxWorkspaceSecurityGroup.addIngressRule(
      ec2.Peer.anyIpv4(),
      ec2.Port.tcp(3389)
    );

    const DevAxWorkspaceCF = new ec2.CfnInstance(scope, "DevAxWindowsHost", {
      userData: cdk.Fn.base64(
        cdk.Fn.sub(
          `<script>
            cfn-init.exe -v -s \${AWS::StackId} -r DevAxWindowsHost --configsets ascending --region \${AWS::Region}
            </script>`
        )
      ),
      keyName: cdk.Fn.ref(EEKeyPair.logicalId),
      networkInterfaces: [
        {
          deviceIndex: "0",
          associatePublicIpAddress: true,
          subnetId: vpc.publicSubnets[0].subnetId,
          groupSet: [DevAxWorkspaceSecurityGroup.securityGroupId],
        },
      ],
      instanceType: ec2.InstanceType.of(
        ec2.InstanceClass.M5,
        ec2.InstanceSize.XLARGE
      ).toString(),
      imageId: DevAxWorkspaceWindowsAMI.findInMap(
        cdk.Aws.REGION,
        "Windows2019"
      ),
      sourceDestCheck: true,
      tags: [{ key: "Name", value: "DevAxWindowsHost" }],
    });
    this.instance = DevAxWorkspaceCF;

    DevAxWorkspaceCF.cfnOptions.metadata = {
      "AWS::CloudFormation::Init": {
        configSets: {
          ascending: ["setup", "install", "finalise"],
        },
        setup: {
          files: {
            "C:\\setup\\setenvironment.ps1": {
              content: setupHostScript.toString("utf-8"),
            }
          },
        },
        install: {
          commands: {
            runsetup: {
              command:
                "powershell.exe -ExecutionPolicy Unrestricted C:\\setup\\setenvironment.ps1",
              waitAfterCompletion: "0",
            }
          },
        },
        finalise: {
          commands: {
            cleanup: {
              command: "rmdir C:\\setup /s /q",
              waitAfterCompletion: "0",
            },
            signal: {
              command: cdk.Fn.sub(
                "cfn-signal.exe -e %ERRORLEVEL% --resource DevAxWindowsHost --stack ${AWS::StackName} --region ${AWS::Region}"
              ),
            },
          },
        },
      },
    };

    DevAxWorkspaceCF.cfnOptions.creationPolicy = {
      resourceSignal: {
        count: 1,
        timeout: "PT60M",
      },
    };
  }
}
