#!/bin/bash

#
# Copy files to S3
#

AWSEXEC=`which aws`
AWSPATH=~/.aws/
PIPEXEC=`which pip`

function InstallAWS(){
    if [ -a "$PIPEXEC" ]; then
        $PIPEXEC install awscli --user --upgrade
    else
        echo "You must install pip before continue"
        echo "Check https://docs.aws.amazon.com/pt_br/cli/latest/userguide/installing.html for further instructions"
    fi
}

function ConfigureAWS(){
. ~/.bashrc
. ~/.profile
mkdir $AWSPATH
touch $AWSPATH/credentials
    cat << EOF > $AWSPATH/credentials
[default]
aws_access_key_id = <insert key>
aws_secret_access_key = <insert secret key>
region = sa-east-1
EOF
}

function CopyJAR(){
    echo "Copying"
    aws s3 cp wololo.jar s3://wololo-bucket/
    # Loop it 
}

echo "Is awscli present?"
if [ -d "$AWSPATH" ]; then
    ConfigureAWS
    CopyJAR
else
    echo "Nope!"
    echo "Installing awscli"
    InstallAWS
    ConfigureAWS
    CopyJAR
fi
