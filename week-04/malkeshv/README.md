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

For this lab, I used Amazon EC2 with Amazon Linux 2023 to build and validate a reusable Golden AMI.

The lab started with a builder EC2 instance named `malkesh-ec2-ami-builder`. An IAM role with the `AmazonSSMManagedInstanceCore` policy was attached to the instance so that I could access it using AWS Systems Manager Session Manager without relying on SSH.

Nginx was installed and configured on the builder instance using EC2 User Data. I verified that the nginx service was enabled and active and that the custom HTML page was returning HTTP 200.

I also practiced EC2 Instance Metadata Service Version 2 (IMDSv2). A metadata request without a token returned HTTP 401 as expected, while a request using an IMDSv2 token successfully returned instance metadata such as the instance ID and Availability Zone.

After configuring and validating the builder instance, I created a private Golden AMI named `malkesh-ami-nginx-golden-v1`. I then launched a new test EC2 instance named `malkesh-ec2-ami-test` from this AMI without using User Data.

The final validation confirmed that nginx was already installed, enabled, active, and serving the custom page with HTTP 200. This demonstrated how a Golden AMI can provide a standardized and reusable base image for future EC2 instances.

## Cleanup

Document the resources deleted after completing the labs.
