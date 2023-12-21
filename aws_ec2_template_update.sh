#!/bin/bash

# Import Config
cd $(dirname "$0")
. aws_ec2_template_update.conf
. functions.sh

# Redirect stdout, stderr
exec 1>  ${LOG_FILE}
exec 2>> ${LOG_FILE}

# get ami_id and ec2 template
ami_id=$(get_ami_id "${AMI_NAME}" "${AWS_ACCOUNT_ID}")
latest_version_number=$(get_template_latest_version "${TEMPLATE_NAME}" "${REGION}")

# ami_id update for ec2 template
update_template_ami "${TEMPLATE_NAME}" "${ami_id}" "${latest_version_number}" "${REGION}"

exit 0
