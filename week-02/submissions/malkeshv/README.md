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

## Day 4 - AWS Organizations, SCPs & IAM Identity Center

This submission documents my hands-on practice with AWS Organizations,
Organizational Units (OUs), Service Control Policies (SCPs), IAM Identity
Center, temporary STS sessions, and consolidated billing.

### What I Practiced

- Created an AWS Organization with a management account and member account
- Created a `Dev-Env` Organizational Unit
- Created and attached the `Deny-S3-Bucket-Creation` SCP
- Enabled AWS IAM Identity Center in Mumbai (`ap-south-1`)
- Created the `malkesh-demo` Identity Center user
- Created the `CloudAdhar-Admin` permission set using `AdministratorAccess`
- Assigned the permission set to the member account
- Configured AWS Access Portal authentication and MFA
- Verified the Identity Center session using AWS STS
- Tested S3 bucket creation before the SCP was applied
- Moved the member account into the `Dev-Env` OU
- Tested S3 bucket creation after the SCP was applied
- Confirmed the SCP explicit deny using `AccessDenied`
- Deleted the temporary S3 test bucket
- Moved the member account back to Root after the lab

### Key Learning

The practical demonstrated that an IAM permission or permission set can allow
an action, but an applicable SCP can still explicitly deny that action.

```text
Identity Center Permission Set: Allow
                +
Dev-Env SCP: Explicit Deny
                =
Final Result: Deny
