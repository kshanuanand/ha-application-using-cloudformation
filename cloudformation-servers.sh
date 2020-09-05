#!/usr/bin/bash
command=""
if [[ $1 == "create" ]]
then
	command="create-stack"
elif [[ $1 == "update" ]]
then
	command="update-stack"
else
	echo ""
	echo "You forgot to pass a command"
	echo ""
	exit 30
fi
stackName="MyProject-Servers"
templateBody='server.yaml'
parameters='server-prop.json'
aws cloudformation ${command} \
--stack-name $stackName \
--template-body file://$templateBody \
--parameters file://$parameters \
--region=us-west-2 \
--capabilities CAPABILITY_NAMED_IAM
