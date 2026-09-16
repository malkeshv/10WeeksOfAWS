# Week 2 - IAM Roles & STS

## Day 3 - EC2 Reads S3 Using an IAM Role

This submission documents my hands-on practice with AWS IAM Roles, STS temporary credentials, EC2 and S3.

### Resources Used

- S3 Bucket: `aws-iam-role-demo-malkesh-2026`
- IAM Policy: `EC2-S3-Demo-ReadOnly-Policy`
- IAM Role: `EC2-S3-ReadOnly-Role`
- Test Object: `hello.txt`

### What I Practiced

- Created an S3 test bucket.
- Created a least-privilege S3 read-only IAM policy.
- Created an IAM role for EC2.
- Attached the IAM role to an EC2 instance.
- Verified the role using AWS STS.
- Read an object from S3 using the EC2 IAM role.
- Verified that S3 upload was denied because `s3:PutObject` permission was not granted.
- Verified temporary credentials through EC2 Instance Metadata Service (IMDSv2).

### Key Learning

The EC2 instance can access AWS services securely through an IAM role without storing permanent AWS access keys.

The role provides only the permissions required for the task, following the principle of least privilege.






---
