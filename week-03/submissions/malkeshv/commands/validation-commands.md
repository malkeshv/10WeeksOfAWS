# Validation Commands – Week 3

## 1. Check VPC

```bash
aws ec2 describe-vpcs \
  --region ap-south-1 \
  --filters "Name=tag:Name,Values=vpc-a-devops-lab" \
  --query 'Vpcs[].{VpcId:VpcId,CIDR:CidrBlock,State:State}' \
  --output table
