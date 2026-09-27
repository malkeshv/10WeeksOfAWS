# Day 6 Design Decisions

- Used one NAT Gateway for the learner lab to control cost.
- Kept EC2 in a private subnet with no public IPv4 address.
- Used AWS Systems Manager Session Manager instead of SSH.
- Used VPC Flow Logs for traffic visibility and troubleshooting.
- Used a custom NACL to demonstrate traffic filtering.
- Used VPC Peering for private communication between VPC-A and VPC-B.
- Restricted VPC-B HTTP access to VPC-A CIDR only.
- Used an S3 Gateway Endpoint for private S3 access.
- Applied least-privilege IAM permissions for S3 read access.
