# Week 2 - Day 4
## AWS Organizations, SCPs & IAM Identity Center

### Objective

The objective of this practical was to understand how AWS Organizations,
Organizational Units (OUs), Service Control Policies (SCPs), IAM Identity
Center, and AWS STS work together to provide centralized governance and
temporary access across AWS accounts.

---

## What I Practiced

- Created an AWS Organization
- Created a member AWS account
- Created a `Dev-Env` Organizational Unit
- Created an SCP named `Deny-S3-Bucket-Creation`
- Attached the SCP to the `Dev-Env` OU
- Enabled AWS IAM Identity Center in Mumbai (`ap-south-1`)
- Created the `malkesh-demo` Identity Center user
- Created the `CloudAdhar-Admin` permission set using `AdministratorAccess`
- Assigned the permission set to the member account
- Configured AWS Access Portal access and MFA
- Verified the temporary STS session using `aws sts get-caller-identity`
- Tested S3 bucket creation before the SCP was applicable
- Moved the member account into the `Dev-Env` OU
- Tested S3 bucket creation after the SCP was applicable
- Confirmed the SCP explicit deny
- Deleted the temporary S3 test bucket
- Moved the member account back to Root after the lab

---

## Organization Structure

The practical used the following structure:

```text
AWS Organization
│
├── Root
│   ├── Management Account
│   └── Dev-Env Member Account
│
└── Dev-Env OU
    └── Deny-S3-Bucket-Creation SCP
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "DenyS3BucketCreation",
      "Effect": "Deny",
      "Action": "s3:CreateBucket",
      "Resource": "*"
    }
  ]
}
```
## IAM Identity Center
Identity Center was enabled in:

`ap-south-1 (Mumbai)`

### User

`malkesh-demo`

### Permission Set

`CloudAdhar-Admin`

### AWS Managed Policy

`AdministratorAccess`

### Session Duration

`1 hour`

The permission set was assigned to the member account and accessed through
the AWS Access Portal.

---

## STS Verification

I verified the active Identity Center session using:

```bash
aws sts get-caller-identity
```

The result showed an AWSReservedSSO role, confirming that the access was
through a temporary STS session created through IAM Identity Center.

---

## Before SCP Test

Before applying the SCP to the member account, the account was directly
under Root.

I attempted to create an S3 bucket in Mumbai:

```text
S3 CreateBucket
        ↓
Member Account under Root
        ↓
Creation Successful
```

The test bucket was successfully created and was deleted after verification.

Screenshot:

[Before SCP - S3 creation successful](./screenshots/05-before-scp-success.png)

---

## After SCP Test

The member account was then moved into the `Dev-Env` OU.

The same S3 bucket creation operation was attempted again:

```text
Identity Center Permission Set
          Allow
            +
Dev-Env SCP
          Explicit Deny
            ↓
       AccessDenied
```

The AWS CLI returned `AccessDenied` with an explicit deny in a Service
Control Policy.

Screenshot:

[After SCP - S3 creation denied](./screenshots/06-after-scp-denied.png)

---

## Key Learning

The practical demonstrated that an IAM permission or permission set can
allow an action, but an applicable SCP can still explicitly deny that action.

```text
Permission Set: Allow
        +
SCP: Explicit Deny
        =
Final Result: Deny
```

This helped me understand the difference between **permissions** and
**organizational guardrails**.

---

## Screenshots

| # | Screenshot | Description |
|---|---|---|
| 01 | [Organizations](./screenshots/01-organizations.png) | AWS Organization structure |
| 02 | [SCP Policy](./screenshots/02-scp-policy.png) | Deny S3 bucket creation SCP |
| 03 | [Identity Center](./screenshots/03-identity-center.png) | IAM Identity Center account assignment |
| 04 | [Access Portal](./screenshots/04-access-portal.png) | AWS Access Portal |
| 05 | [Before SCP](./screenshots/05-before-scp-success.png) | S3 creation successful |
| 06 | [After SCP](./screenshots/06-after-scp-denied.png) | S3 creation denied |
| 07 | [STS Verification](./screenshots/07-sts-verification.png) | Temporary STS session verification |

---

## Challenge Files

- [Organizations & IAM Identity Center](./07-organizations-identity-center.md)
- [Organizations SCP Lab](./09-organizations-scp-lab.md)

---
---

## Architecture Diagrams

- [AWS Organizations Architecture](./diagrams/aws-organizations-architecture.png)
- [SCP Permission Flow](./diagrams/permission-flow.png)

## Cleanup

After completing the practical:

- Deleted the temporary S3 test bucket
- Moved the member account back to Root
- Kept the `Dev-Env` OU and SCP for the learning environment
- Kept IAM Identity Center configuration for continued practice
- EC2 practice instance was stopped when not in use

> Sensitive information such as account IDs, email addresses, organization
> IDs, OU IDs, portal URLs, and full role ARNs should be masked before
> sharing screenshots publicly.
