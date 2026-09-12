# Day 4 Learning Notes

## IAM Groups

IAM groups help manage permissions for multiple users by attaching policies to a group.

## IAM Policies

IAM policies define which AWS actions are allowed or denied.

## Read-Only Access

Read-only policies allow users to view resources without making changes.

## Least Privilege

The principle of least privilege means giving users only the permissions they need to perform their tasks.

## Hands-On Completed

- Created S3ReadOnlyGroup
- Attached AmazonS3ReadOnlyAccess
- Created learner-s3
- Added learner-s3 to S3ReadOnlyGroup
- Created EC2ReadOnlyGroup
- Attached AmazonEC2ReadOnlyAccess
- Created learner-ec2
- Created BillingViewGroup
- Attached AWSBillingReadOnlyAccess
- Created learner-billing
- Created a custom S3 read-only policy

## Key Takeaway

IAM helps control access to AWS resources. Using groups and read-only policies makes it easier to follow the principle of least privilege.
