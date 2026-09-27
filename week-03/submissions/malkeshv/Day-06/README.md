# Day 06 – Secure, Connect, and Observe Two VPCs

## Objective

Extended VPC-A with controlled private egress, observability, security controls, VPC Peering, and private S3 access.

Built VPC-B as a peering target and validated private connectivity between the two VPCs.

---

## Architecture

### VPC-A

- VPC CIDR: `10.10.0.0/20`
- Private-A subnet: `10.10.12.0/24`
- Private EC2: `10.10.12.125`
- NAT Gateway for private outbound access
- VPC Flow Logs
- Custom Network ACL
- S3 Gateway Endpoint

### VPC-B

- VPC CIDR: `10.20.0.0/20`
- Web subnet: `10.20.1.0/24`
- Nginx EC2: `10.20.1.94`

### Connectivity

```text
VPC-A Private EC2
10.10.12.125
       |
       | NAT Gateway
       |
    Internet


VPC-A
10.10.0.0/20
       |
       | VPC Peering
       |
       v
VPC-B
10.20.0.0/20
       |
       v
Nginx
10.20.1.94
