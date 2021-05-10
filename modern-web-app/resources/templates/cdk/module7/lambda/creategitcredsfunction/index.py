import boto3
import cfnresponse
import os

awsstudent = os.environ['awsstudent']

def lambda_handler(event, context):
    print(event)
    response = {}
    try:
        if event['RequestType'] == 'Delete':
            iam = boto3.client('iam')
            credentials = iam.list_service_specific_credentials(
                UserName=awsstudent, ServiceName='codecommit.amazonaws.com')
            serviceSpecificCredentialId = credentials['ServiceSpecificCredentials'][0]['ServiceSpecificCredentialId']
            delete = iam.delete_service_specific_credential(
                UserName=awsstudent, ServiceSpecificCredentialId=serviceSpecificCredentialId)
            cfnresponse.send(event, context, cfnresponse.SUCCESS, response)
        else:
            iam = boto3.client('iam')
            gitcreds = iam.create_service_specific_credential(
                UserName=awsstudent, ServiceName='codecommit.amazonaws.com')
            response['GitUserName'] = gitcreds['ServiceSpecificCredential']['ServiceUserName']
            response['GitPassword'] = gitcreds['ServiceSpecificCredential']['ServicePassword']
            cfnresponse.send(event, context, cfnresponse.SUCCESS, response)
    except Exception as e:
        print(e)
        response['Status'] = 'FAILED'
        response['Reason'] = 'Git failed, see log for details'
        cfnresponse.send(event, context, cfnresponse.FAILED, response)
