# Architecture Decisions – Week 3

## 1. VPC CIDR Selection

### Decision

Use:

`10.10.0.0/20`

for VPC-A.

### Reason

The `/20` VPC provides the overall IPv4 address space required for the lab and leaves room for multiple subnet ranges.

The VPC is divided into smaller `/24` subnet ranges for the public and private network segments.

---

## 2. Two Availability Zones

### Decision

Use two Availability Zones:

- `ap-south-1a`
- `ap-south-1b`

### Reason

The VPC foundation is distributed across two Availability Zones.

Each Availability Zone contains:

- One public subnet
- One private subnet

This creates the following layout:

```text
ap-south-1a
├── Public-A
└── Private-A

ap-south-1b
├── Public-B
└── Private-B
