#!/bin/bash

# log
# 説明：引数に渡した文字列をログ用に整形して標準出力する関数
function log() {
    PROCNAME=${0##*/}

    local fname=${BASH_SOURCE[1]##*/}
    echo -e "$(date '+%Y-%m-%dT%H:%M:%S') ${PROCNAME} (${fname}:${BASH_LINENO[0]}:${FUNCNAME[1]}) $*" >> "${LOG_FILE}"
}

# get_ami_id
# 説明：AMI名から最新のAMI_IDを取得する。
#
# 第一引数：AMI名
# 第二引数：アカウントID
function get_ami_id() {
    ami_name=$1
    aws_account_id=$2

    if ! aws ec2 describe-images \
        --owners "${aws_account_id}" \
        --filters "Name=name,Values=${ami_name}" \
        --query 'sort_by(Images, &CreationDate)[-1].[Name,ImageId]' \
        --region ap-northeast-1
    then
        log "ERROR: failed get_ami_id() ami_name:${ami_name} aws_account_id:${aws_account_id}"
    fi
}

# get_template_latest_version
# 説明：起動テンプレートの最新バージョンを取得する関数
#
# 第一引数：起動テンプレート名
# 第二引数：リージョン名
function get_template_latest_version() {
    template_name=$1
    region=$2

    if ! aws ec2 describe-launch-templates \
        --launch-template-names "${template_name}" \
        --region "${region}" |
        jq -r '.LaunchTemplates[].LatestVersionNumber'
    then
        log "ERROR: failed get_template_latest_version() template_name:${template_name} region:${region}"
    fi
}

# update_template_ami
# 説明：起動テンプレートのAMI_IDを更新する関数
#
# 第一引数：起動テンプレート名
# 第二引数：AMI_ID
# 第三引数：最終バージョン
# 第四引数：リージョン名
function update_template_ami() {
    template_name=$1
    ami_id=$2
    latest_version_number=$3
    region=$4

    if ! aws ec2 create-launch-template-version \
        --source-version "${latest_version_number}" \
        --launch-template-name "${template_name}" \
        --launch-template-data "ImageId=${ami_id}" \
        --region "${region}"
    then
        log "ERROR: failed update_template_ami() template_name:${template_name} ami_id:${ami_id} region:${region}"
    fi
}
