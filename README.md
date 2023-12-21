# aws_ec2_template_update

## Overview
Automatically update the AMI of the EC2 template.

## Requirement
You have aws-cli installed on your server.
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

## How to Use
1. Write environment information in aws_ec2_template_update.conf.
2. Deploy ec2_template_update.sh and ec2_template_update.conf on the server.
3. Give this script execution rights and execute it in the following format

```bash
$ ./aws_ec2_template_update.sh
```

## Logs

```bash
$ less aws_ec2_update_template.log
```

## Configuration

| Constant       | Example              | Description               |
| -------------- | -------------------- | ------------------------- |
| LOG_FILE       | aws_ec2_template.log | logfile directory         |
| AWS_ACCOUNT_ID | 01234567             | aws account ID            |
| ENV            | dev                  | environment identifier    |
| AMI_NAME       | ${ENV}-AMI_NAME-*    | ami name of target server |
| TEMPLATE_NAME  | ${ENV}-TEMPLATE_NAME | target ec2 template name  |
| REGION         | ap-northeast-1       | aws region settings       |

## Author

[Dillen H. Tomida](https://twitter.com/cafe_yuki)

## License

This software is licensed under the MIT license, see [LICENSE](./LICENSE) for more information.
