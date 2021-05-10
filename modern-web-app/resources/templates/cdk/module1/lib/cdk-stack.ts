import * as cdk from '@aws-cdk/core';
import * as Network from '../src/network';
import * as Windows from '../src/Windows';

export class CdkStack extends cdk.Stack {
  constructor(scope: cdk.Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);
    

    // Parameter setup
    const EEKeyPair = new cdk.CfnParameter(this, "EEKeyPair", {
      type: 'AWS::EC2::KeyPair::KeyName',
      default: 'EEKeyPair',
      description: 'Event Engine Name of the EC2 KeyPair generated for the Team'
    });

    const {vpc} = Network.Networking(this);

    // EC2 Instance machine
    // @ts-ignore
    const windowsInstance = new Windows.WindowsInstance(this, 'WindowsInstance', vpc, EEKeyPair);
    // // EC2 Instance machine
  }
}



