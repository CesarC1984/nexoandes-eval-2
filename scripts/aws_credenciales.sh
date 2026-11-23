#!/bin/bash
##Este script debe ejecutarse con source, de lo contrario no funcionara

read -rsp "AWS_ACCESS_KEY_ID: " AWS_ACCESS_KEY_ID
echo
export AWS_ACCESS_KEY_ID

read -rsp "AWS_SECRET_ACCESS_KEY: " AWS_SECRET_ACCESS_KEY
echo
export AWS_SECRET_ACCESS_KEY

read -rsp "AWS_SESSION_TOKEN: " AWS_SESSION_TOKEN
echo
export AWS_SESSION_TOKEN


export AWS_DEFAULT_REGION="us-east-1"
echo "Credenciales AWS configuradas."

echo "Revisando credenciales AWS"
aws sts get-caller-identity
