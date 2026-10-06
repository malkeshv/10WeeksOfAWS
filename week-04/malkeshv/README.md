# Week 4 - EC2 Essentials, EBS, and Pricing

## Learner

- Name: Malkesh Vaghela
- GitHub: malkeshv
- LinkedIn:
- Region: ap-south-1

## Day 7

- Instance selection: Amazon Linux 2023, t3.micro, `malkesh-ec2-ami-builder`
- User Data result: Installed nginx, enabled nginx at boot, and created a custom HTML page. Cloud-init completed successfully.
- IMDSv1 expected-deny: Tokenless metadata request returned HTTP 401 as expected.
- IMDSv2 result: Generated an IMDSv2 token and successfully retrieved the EC2 instance ID and Availability Zone.
- Golden AMI validation: Created `malkesh-ami-nginx-golden-v1` (`ami-0d3db13e19dc1ac76`). Launched `malkesh-ec2-ami-test` without User Data and verified nginx was enabled, active, and returned HTTP 200.
- Pricing decisions: Used t3.micro for the lab to keep the practice environment low-cost.

## Day 8

- Instance and volume AZ:
- Filesystem and mount:
- Stop/start persistence:
- Resize and XFS growth:
- Snapshot recovery:
- Cross-Region encrypted copy:
- DLM policy or review:
- EFS clients and shared-file proof:
- Storage decisions:
- Placement decisions:

## Architecture Decision

Write 200-300 words.

## Cleanup

Document the resources deleted after completing the labs.
