#!/bin/bash
BASEDIR=$(dirname $0)
WORKSHOP_BASEDIR=${BASEDIR}/../workshop
WORKSHOP_PUBLIC_FOLDER=${BASEDIR}/../workshop/public
DELETE_PUBLIC_FOLDER=true
COMPILE_CDK=false
COMPILE_CDK_MODULES="module1 module2 module3 module4 module5 module6 module7"
CDK_MODULE_FOLDER=${BASEDIR}/../resources/templates/cdk

echo ${BASEDIR}

delete_public_folder() {
    rm -rf ${WORKSHOP_PUBLIC_FOLDER}
}

compile_cdk() {
    pushd $CDK_MODULE_FOLDER/common
    if [ $COMPILE_DELETE_NODE_MODULES = true ] ; then
        rm -rf './node_modules'
        rm package-lock.json
        npm install
    fi
    npm run build
    npm link
    popd
    for i in $COMPILE_CDK_MODULES
    do
        pushd $CDK_MODULE_FOLDER/$i
        npm link devaxcommon
        npm run build
        popd
        pushd $CDK_MODULE_FOLDER/../
        TEMPLATE="$(tr '[:lower:]' '[:upper:]' <<< ${i:0:1})${i:1}.template.yaml"
        pwd
        echo "copying $TEMPLATE to ../../workshop/content/$i/files/"
        cp $TEMPLATE ../../workshop/content/$i/files/
        popd
    done
}

while getopts dcfm: option
do
    case "${option}"
        in
        d) DELETE_PUBLIC_FOLDER=true;;
        c) COMPILE_CDK=true;;
        m) COMPILE_CDK_MODULES=${OPTARG};;
        f) COMPILE_DELETE_NODE_MODULES=true;;
    esac
done

echo "Running the script with the following parameter:"
echo "Delete public folder: $DELETE_PUBLIC_FOLDER"
echo "Compile CDK: $COMPILE_CDK"
echo "CDK Modules: $COMPILE_CDK_MODULES"
echo "Clear node modules and package-lock.json: $COMPILE_DELETE_NODE_MODULES"

if [ $DELETE_PUBLIC_FOLDER = true ] ; then
    delete_public_folder
fi

if [ $COMPILE_CDK = true ] ; then
    compile_cdk
fi


#echo ************************************************************
#echo **
#echo ** Building Lab Monoliths To Microservices
#echo **
#echo ************************************************************

#if [ "$#" -eq  "0" ]
# then
#    #zip up the bundles
#    pushd ${BASEDIR}/../resources/bundles
#    for i in */;
#        do
#            if [[ $i = \~* ]] ;
#            then
#                echo "======> SKIPPING ${i%/}";
#            else
#                echo "======> ${i%/}";
#                zip -qr "${i%/}.zip" "$i" -x */docs/\* -x *DS_Store* -x */.vs/\* -x */packages/\* -x */obj/\* -x */bin/\*;
#                mv ${i%/}.zip ../files/
#            fi
#    done
#    popd
# else
#     echo "Skipping bundle creation"
#fi

#
# Renumber all MD files
#
#pushd ${BASEDIR}/../workshop/content
#for i in *;
#    do
#        if [[ $i = \~* ]] ;
#        then
#            echo "======> SKIPPING ${i%/}";
#        else
#            echo "======> ${i%/}";
#            zip -qr "${i%/}.zip" "$i" -x */docs/\* -x *DS_Store* -x */.vs/\* -x */packages/\* -x */obj/\* -x */bin/\*;
#            mv ${i%/}.zip ../files/
#        fi
#done
#popd

#
# Run Hugo to build the site
#
pushd ${BASEDIR}/../workshop
hugo
popd
