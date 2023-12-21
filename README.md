# aws_ec2_template_update

## Overview
Automatically update the AMI of the EC2 template.

## How to Use
1. Write environment information in aws_ec2_template_update.conf.
2. Deploy ec2_template_update.sh and ec2_template_update.conf on the server.
3. Give this script execution rights and execute it in the following format

```bash
$ ./aws_ec2_template_update.sh
```

## Logs

```bash
$ less aws_ec2_template_update.sh.log
```

## Configuration

| Constant       | Example              | Description               |
| -------------- | -------------------- | ------------------------- |
| AWS_ACCOUNT_ID | 01234567             | AWS Account ID            |
| ENV            | dev                  | environment identifier    |
| AMI_NAME       | ${ENV}-AMI_NAME-*    | AMI name of target server |
| TEMPLATE_NAME  | ${ENV}-TEMPLATE_NAME | Target EC2 Template Name  |
| REGION         | ap-northeast-1       | AWS Region Settings       |

## Author

[Dillen H. Tomida](https://twitter.com/cafe_yuki)

## License

This software is licensed under the MIT license, see [LICENSE](./LICENSE) for more information.