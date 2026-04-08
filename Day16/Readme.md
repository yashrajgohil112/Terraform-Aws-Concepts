# Day 16: AWS IAM User Management with Terraform

## Overview
This demo demonstrates how to manage AWS IAM users, groups, and group memberships using Terraform and a CSV file as the data source. It's an AWS equivalent of Azure AD user management.

## What Gets Created

- **26 IAM Users** with console access
- **3 IAM Groups** (Education, Managers, Engineers)
- **Group Memberships** based on user attributes
- **User Tags** with metadata (DisplayName, Department, JobTitle)

## Prerequisites

1. **AWS CLI** configured with credentials
2. **Terraform** v1.0 or later
3. **AWS Permissions**: IAM user creation and management permissions
4. **S3 Bucket** for Terraform state (see setup below)

## Quick Start

### 1. Create S3 Backend Bucket

```powershell
aws s3 mb s3://my-terraform-state-bucket-piyushsachdeva --region us-east-1
aws s3api put-bucket-versioning --bucket my-terraform-state-bucket-piyushsachdeva --versioning-configuration Status=Enabled
```
### 2. Initialize Terraform

```powershell
terraform init
```

### 3. Review Changes

```powershell
terraform plan
```
### 4. Apply Configuration

```powershell
terraform apply -auto-approve
```

### 5. Verify in AWS Console

Go to [IAM Console](https://console.aws.amazon.com/iam/) and check:
- **Users** section - 26 users created
- **User groups** section - 3 groups with members


## File Structure

```
day16/
├── backend.tf          # S3 backend configuration
├── provider.tf         # AWS provider setup
├── versions.tf         # Terraform and provider versions
├── main.tf            # User creation and CSV parsing
├── groups.tf          # Group and membership management
├── users.csv          # User data source
├── DEMO_GUIDE.md      # Comprehensive demo walkthrough
└── README.md          # This file
```
## How It Works

### Step 1: Read CSV File

The `main.tf` file reads the `users.csv` file:

```terraform
locals {
  users = csvdecode(file("users.csv"))
}
```
### Step 2: Create IAM Users

Users are created with a username format: `{first_initial}{lastname}` (e.g., `mscott`):

```terraform
resource "aws_iam_user" "users" {
  for_each = { for user in local.users : user.first_name => user }
  
  name = lower("${substr(each.value.first_name, 0, 1)}${each.value.last_name}")
  path = "/users/"
  
  tags = {
    "DisplayName" = "${each.value.first_name} ${each.value.last_name}"
    "Department"  = each.value.department
    "JobTitle"    = each.value.job_title
  }
}
```
### Step 3: Enable Console Access

Login profiles are created for console access with password reset required:

```terraform
resource "aws_iam_user_login_profile" "users" {
  for_each = aws_iam_user.users
  
  user                    = each.value.name
  password_reset_required = true
}
```
### Step 4: Create Groups and Memberships

Groups are created and users are dynamically assigned based on their department:

```terraform
resource "aws_iam_group" "education" {
  name = "Education"
  path = "/groups/"
}

resource "aws_iam_group_membership" "education_members" {
  name  = "education-group-membership"
  group = aws_iam_group.education.name
  
  users = [
    for user in aws_iam_user.users : user.name 
    if user.tags.Department == "Education"
  ]
}
```
## Outputs

After applying, you can view the outputs:

```powershell
# View AWS Account ID
terraform output account_id

# View all user names
terraform output user_names

# View password information (sensitive)
terraform output user_passwords
```
