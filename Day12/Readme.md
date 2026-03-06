# Day 13: Terraform Data Sources with AWS

This lesson demonstrates how to use Terraform data sources to reference existing infrastructure in AWS. We will provision an EC2 instance into a pre-existing VPC and subnet.

## Scenario

We have a "shared" VPC and subnet that were created by another team or process. Our task is to launch a new EC2 instance into this existing network infrastructure without managing the VPC or subnet with our Terraform configuration.

### Pre-existing Infrastructure

The following resources are assumed to exist in your AWS account:

*   **VPC:** with the tag `Name` = `shared-network-vpc`
*   **Subnet:** with the tag `Name` = `shared-primary-subnet`

### Terraform Configuration (`main.tf`)

Our Terraform code will:

1.  **Define Data Sources:**
    *   `data "aws_vpc" "shared"`: This block tells Terraform to find a VPC with the tag `Name` set to `shared-network-vpc`.
    *   `data "aws_subnet" "shared"`: This block finds a subnet with the tag `Name` set to `shared-primary-subnet` within the VPC found by the previous data source.
    *   `data "aws_ami" "amazon_linux_2"`: This block finds the latest Amazon Linux 2 AMI to use for our EC2 instance.

2.  **Use Data Source Outputs:**
    *   The `aws_instance` resource uses `data.aws_subnet.shared.id` to launch into the existing subnet.
    *   The `aws_instance` resource also uses `data.aws_ami.amazon_linux_2.id` for the AMI.
