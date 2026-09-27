# Week 3 – VPC Foundations, Security, NAT, and Endpoints

## Day 05 – VPC-A Foundation

### Objective

Build the VPC-A network foundation across two Availability Zones with public and private subnets, an Internet Gateway, and separate public and private route tables.

---

## 1. VPC Configuration

| Resource | Configuration |
|---|---|
| VPC Name | `vpc-a-devops-lab` |
| Region | `ap-south-1` (Mumbai) |
| VPC CIDR | `10.10.0.0/20` |

---

## 2. Subnet Design

### Availability Zone – ap-south-1a

| Subnet | CIDR | Type |
|---|---|---|
| Public-A | `10.10.1.0/24` | Public |
| Private-A | `10.10.12.0/24` | Private |

### Availability Zone – ap-south-1b

| Subnet | CIDR | Type |
|---|---|---|
| Public-B | `10.10.2.0/24` | Public |
| Private-B | `10.10.13.0/24` | Private |

All four subnet CIDRs are non-overlapping and are within the VPC CIDR `10.10.0.0/20`.

---

## 3. Internet Gateway

Created and attached the Internet Gateway:

`igw-vpc-a-lab`

The Internet Gateway is attached to:

`vpc-a-devops-lab`

---

## 4. Public Route Table

Created:

`rt-public-vpc-a`

### Routes

| Destination | Target |
|---|---|
| `10.10.0.0/20` | `local` |
| `0.0.0.0/0` | Internet Gateway |

### Subnet Associations

- Public-A
- Public-B

The `0.0.0.0/0` route provides a path from the public subnets toward the Internet Gateway.

---

## 5. Private Route Table

Created:

`rt-private-vpc-a`

### Routes

| Destination | Target |
|---|---|
| `10.10.0.0/20` | `local` |

### Subnet Associations

- Private-A
- Private-B

The private route table remains local-only during Day 05.

No direct `0.0.0.0/0 → Internet Gateway` route was added to the private route table.

---

## 6. Architecture

```text
                         Internet
                            |
                     Internet Gateway
                            |
                         VPC-A
                     10.10.0.0/20
                            |
             +--------------+--------------+
             |                             |
       ap-south-1a                   ap-south-1b
             |                             |
       +-----+-----+                 +-----+-----+
       |           |                 |           |
   Public-A    Private-A         Public-B    Private-B
   10.10.1/24 10.10.12/24       10.10.2/24 10.10.13/24
       |           |                 |           |
       +-----------+                 +-----------+
             |                             |
       Public RT                     Private RT
             |                             |
       0.0.0.0/0 → IGW               local only
