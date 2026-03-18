# Day 15: VPC and Peering (Mini Project 2)

## Overview
This demo showcases **AWS VPC Peering** by creating two VPCs in different AWS regions and establishing a peering connection between them. This allows resources in both VPCs to communicate with each other using private IP addresses.

## Architecture
```
┌─────────────────────────────────────┐       ┌─────────────────────────────────────┐
│     Primary VPC (us-east-1)         │       │    Secondary VPC (us-west-2)        │
│     CIDR: 10.0.0.0/16               │       │    CIDR: 10.1.0.0/16                │
│                                     │       │                                     │
│  ┌───────────────────────────────┐  │       │  ┌───────────────────────────────┐  │
│  │  Subnet: 10.0.1.0/24          │  │       │  │  Subnet: 10.1.1.0/24          │  │
│  │  ┌─────────────────────────┐  │  │       │  │  ┌─────────────────────────┐  │  │
│  │  │  EC2 Instance           │  │  │       │  │  │  EC2 Instance           │  │  │
│  │  │  Private IP: 10.0.1.x   │  │  │       │  │  │  Private IP: 10.1.1.x   │  │  │
│  │  └─────────────────────────┘  │  │       │  │  └─────────────────────────┘  │  │
│  └───────────────────────────────┘  │       │  └───────────────────────────────┘  │
│                                     │       │                                     │
│  Internet Gateway                   │       │  Internet Gateway                   │
└─────────────────┬───────────────────┘       └─────────────────┬───────────────────┘
                  │                                             │
                  └───────────────VPC Peering──────────────────┘
```
## What This Demo Creates

### Networking Components
1. **Two VPCs**:
   - Primary VPC in us-east-1 (10.0.0.0/16)
   - Secondary VPC in us-west-2 (10.1.0.0/16)

2. **Subnets**:
   - One public subnet in each VPC
   - Configured with auto-assign public IP

3. **Internet Gateways**:
   - One for each VPC to allow internet access

4. **Route Tables**:
   - Custom route tables with routes to internet and peered VPC
   - Routes for VPC peering traffic

5. **VPC Peering Connection**:
   - Cross-region peering between the two VPCs
   - Automatic acceptance configured

### Compute Resources
1. **EC2 Instances**:
   - One t2.micro instance in each VPC
   - Running Amazon Linux 2
   - Apache web server installed
   - Custom web page showing VPC information
