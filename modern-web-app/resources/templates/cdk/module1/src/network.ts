import * as ec2 from '@aws-cdk/aws-ec2';
import { NatProvider, IVpc, ISecurityGroup } from '@aws-cdk/aws-ec2';
import { Stack } from '@aws-cdk/core';

type Networking = {
    vpc: any;
    securityGroup: any;
}

export function Networking(scope: any): Networking {
    const vpc = new ec2.Vpc(scope, "DevAxNetworkVPC", {
        cidr: '10.20.0.0/16',
        maxAzs: 2,
        natGatewayProvider: NatProvider.gateway(),
        subnetConfiguration: [{
            subnetType: ec2.SubnetType.PUBLIC,
            name: 'public',
            cidrMask: 24
        },
        {
            subnetType: ec2.SubnetType.PRIVATE,
            name: 'private',
            cidrMask: 24,
        }],
    });

    const securityGroup = new ec2.SecurityGroup(scope, "DevAxNetworkSG", {
        allowAllOutbound: true,
        vpc,
        securityGroupName: "DBSecurityGroup"
    });

    return {
        vpc,
        securityGroup
    }
}