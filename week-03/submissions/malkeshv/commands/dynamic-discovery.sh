#!/bin/bash

set -euo pipefail

REGION="ap-south-1"
VPC_NAME="vpc-a-devops-lab"

echo "=== AWS VPC-A Dynamic Discovery ==="
echo "Region: $REGION"
echo

# Discover VPC ID dynamically using VPC Name tag
VPC_ID=$(aws ec2 describe-vpcs \
  --region "$REGION" \
  --filters "Name=tag:Name,Values=$VPC_NAME" \
  --query 'Vpcs[0].VpcId' \
  --output text)

echo "VPC ID: $VPC_ID"
echo

# Discover Internet Gateway
IGW_ID=$(aws ec2 describe-internet-gateways \
  --region "$REGION" \
  --filters "Name=attachment.vpc-id,Values=$VPC_ID" \
  --query 'InternetGateways[0].InternetGatewayId' \
  --output text)

echo "Internet Gateway: $IGW_ID"
echo

# Discover subnets
echo "=== Subnets ==="

aws ec2 describe-subnets \
  --region "$REGION" \
  --filters "Name=vpc-id,Values=$VPC_ID" \
  --query 'Subnets[].{Name:Tags[?Key==`Name`]|[0].Value,SubnetId:SubnetId,CIDR:CidrBlock,AZ:AvailabilityZone}' \
  --output table

echo

# Discover route tables
echo "=== Route Tables ==="

aws ec2 describe-route-tables \
  --region "$REGION" \
  --filters "Name=vpc-id,Values=$VPC_ID" \
  --query 'RouteTables[].{Name:Tags[?Key==`Name`]|[0].Value,RouteTableId:RouteTableId}' \
  --output table

echo

echo "=== Discovery Complete ==="
