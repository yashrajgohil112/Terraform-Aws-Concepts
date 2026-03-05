# Day 13: Terraform Data Sources with AWS

This lesson demonstrates how to use Terraform data sources to reference existing infrastructure in AWS. We will provision an EC2 instance into a pre-existing VPC and subnet.

## Scenario

We have a "shared" VPC and subnet that were created by another team or process. Our task is to launch a new EC2 instance into this existing network infrastructure without managing the VPC or subnet with our Terraform configuration.

### Pre-existing Infrastructure

The following resources are assumed to exist in your AWS account:

*   **VPC:** with the tag `Name` = `shared-network-vpc`
*   **Subnet:** with the tag `Name` = `shared-primary-subnet`
