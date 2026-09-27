# CIDR Plan – Week 3

## 1. VPC-A Network

| Parameter | Value |
|---|---|
| VPC Name | `vpc-a-devops-lab` |
| AWS Region | `ap-south-1` |
| Region Name | Asia Pacific (Mumbai) |
| VPC CIDR | `10.10.0.0/20` |

The VPC CIDR `10.10.0.0/20` provides the overall IPv4 address space for VPC-A.

---

## 2. Subnet CIDR Plan

| Subnet | CIDR | Availability Zone | Type |
|---|---|---|---|
| Public-A | `10.10.1.0/24` | `ap-south-1a` | Public |
| Public-B | `10.10.2.0/24` | `ap-south-1b` | Public |
| Private-A | `10.10.12.0/24` | `ap-south-1a` | Private |
| Private-B | `10.10.13.0/24` | `ap-south-1b` | Private |

All four subnet CIDRs are non-overlapping and are within the VPC CIDR `10.10.0.0/20`.

---

## 3. Availability Zone Distribution

### Availability Zone 1 – ap-south-1a

| Subnet | CIDR | Type |
|---|---|---|
| Public-A | `10.10.1.0/24` | Public |
| Private-A | `10.10.12.0/24` | Private |

### Availability Zone 2 – ap-south-1b

| Subnet | CIDR | Type |
|---|---|---|
| Public-B | `10.10.2.0/24` | Public |
| Private-B | `10.10.13.0/24` | Private |

The VPC foundation is distributed across two Availability Zones.

---

## 4. CIDR Relationship

```text
VPC-A
10.10.0.0/20
│
├── ap-south-1a
│   │
│   ├── Public-A
│   │   └── 10.10.1.0/24
│   │
│   └── Private-A
│       └── 10.10.12.0/24
│
└── ap-south-1b
    │
    ├── Public-B
    │   └── 10.10.2.0/24
    │
    └── Private-B
        └── 10.10.13.0/24
