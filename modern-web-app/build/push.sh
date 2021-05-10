#!/bin/bash
BASEDIR=$(dirname $0)

PRODUCTION_BUCKET_NAME=workshops.devax.academy
PRODUCTION_DISTRIBUTION_ID="E3281KDMCWNDNC"
STAGING_BUCKET_NAME=workshops-staging.devax.academy
STAGING_DISTRIBUTION_ID="EV77K0T6FDFD9"
AWS_ACCOUNT_PROFILE=alarter+devax-workshops1-admin
WORKSHOP_NAME=monoliths-to-microservices
INVALIDATE_CACHE=true

BUCKET_NAME=$STAGING_BUCKET_NAME
DISTRIBUTION_ID=$STAGING_DISTRIBUTION_ID

while getopts b:a:w:spi:d: option
do
    case "${option}"
        in
        b)  BUCKET_NAME=${OPTARG};;
        a)  AWS_ACCOUNT_PROFILE=${OPTARG};;
        w)  WORKSHOP_NAME=${OPTARG};;
        p)  BUCKET_NAME=${PRODUCTION_BUCKET_NAME}
            DISTRIBUTION_ID=${PRODUCTION_DISTRIBUTION_ID}
        ;;
        s)  BUCKET_NAME=${STAGING_BUCKET_NAME}
            DISTRIBUTION_ID=${STAGING_DISTRIBUTION_ID}
        ;;
        i)  INVALIDATE_CACHE=${INVALIDATE_CACHE};;
        d)  DISTRIBUTION_ID=${OPTARG};;
    esac
done

echo "Running the script with the following parameter:"
echo "Bucket name: ${BUCKET_NAME}"
echo "AWS account profile: ${AWS_ACCOUNT_PROFILE}"
echo "Workshop name: ${WORKSHOP_NAME}"
echo "Invalidate cache: ${INVALIDATE_CACHE}"
echo "Distribution id: ${DISTRIBUTION_ID}"

pushd ${BASEDIR}/../workshop/public
aws s3 rm s3://${BUCKET_NAME}/${WORKSHOP_NAME} --recursive --profile ${AWS_ACCOUNT_PROFILE}
aws s3 sync . s3://${BUCKET_NAME}/${WORKSHOP_NAME}/ --profile ${AWS_ACCOUNT_PROFILE} --exclude "templates/cdk/*/node_modules/*"
popd

if [ $INVALIDATE_CACHE = true ] ; then
    aws cloudfront create-invalidation --profile ${AWS_ACCOUNT_PROFILE} --distribution-id ${DISTRIBUTION_ID} --paths "/*"
fi