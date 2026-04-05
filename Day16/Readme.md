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
