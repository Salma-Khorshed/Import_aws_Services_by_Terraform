# AWS Infrastructure - Terraform Import Project

#Overview

This repository contains Terraform configurations to provision and manage AWS infrastructure for the Konecta project. The infrastructure includes IAM users and groups, S3 buckets, security groups, and VPC networking components. All resources are organized modularly to allow easy management, scalability, and reuse.

#Repository Structure
KONECTA-ASS1/
│
├─ .terraform/                # Terraform working directory (auto-generated)
├─ module/                    # Terraform modules for different services
│   ├─ IAM/                   # IAM module
│   │   ├─ iam.tf             # IAM resources (users, groups)
│   │   └─ variables.tf       # IAM module variables
│   │
│   ├─ S3/                    # S3 module
│   │   ├─ s3.tf              # S3 bucket resources
│   │   ├─ output.tf          # S3 module outputs
│   │   └─ variables.tf       # S3 module variables
│   │
│   ├─ sg/                     # Security Groups module
│   │   ├─ sg.tf               # Security group definitions
│   │   └─ variables.tf        # Security group module variables
│   │
│   └─ vpc/                    # VPC module
│       ├─ vpc.tf              # VPC resources (VPC, subnets, NAT, IGW, route tables)
│       ├─ output.tf           # VPC module outputs
│       └─ variables.tf        # VPC module variables
│
├─ Screenshots/               # Optional screenshots or documentation visuals
├─ main.tf                    # Main entry Terraform configuration
├─ variables.tf               # Global variables for Terraform project
├─ dev.tfvars                 # Environment-specific variable values
├─ terraform.tfstate          # Terraform state file (auto-generated)
├─ terraform.tfstate.backup   # Terraform state backup (auto-generated)
└─ .terraform.lock.hcl        # Provider dependency lock file

# Modules & Resources
# IAM Module

This module creates and manages IAM groups and users:

Groups:

Developers

Developers_prog

ManagedMFA

RequiredMFA

Users:

one_channel_hub_prog

# S3 Module

This module provisions multiple S3 buckets for various purposes:

Application and environment buckets (e.g., api_konecta_cloud, ch_stack_core_admin_prd, one_channel_hub_prod_*)

Static website hosting buckets (e.g., one_channel_hub_static_site)

File storage and media upload buckets

# Security Group Module

This module manages security groups with unique identifiers for different environments:

sg-02c996aec871c39bf

sg-05b3b1d5e4904d474

# VPC Module

This module provisions a complete networking setup, including:

VPC: default-vpc-use1

Subnets: public and private

NAT Gateway

Internet Gateway

Route tables

# Terraform Commands
Initialize Terraform
terraform init

# Plan Infrastructure
terraform plan -var-file="dev.tfvars"

# Apply Infrastructure
terraform apply -var-file="dev.tfvars"

# Import Existing Resources

Resources already imported into Terraform state include:

module.iam.aws_iam_group.this["Developers"]
module.s3.aws_s3_bucket.api_konecta_cloud
module.vpc.aws_vpc.default-vpc-use1["default-vpc-use1"]
...and many others

# Notes

This project is structured for modularity and clarity.

Each module has its own variables and outputs for better encapsulation.

Terraform state and backups are included for reference but should be managed via remote backends in production.
