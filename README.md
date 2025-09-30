# Import_aws_Services_by_Terraform

AWS Infrastructure - Terraform Import Project
Overview
This project contains Terraform configurations for managing existing AWS infrastructure that has been imported from an AWS account. The infrastructure includes VPC networking, IAM resources, S3 buckets, and security groups.
Project Structure
.
├── main.tf                 # Main Terraform configuration and module calls
├── variables.tf            # Root variable declarations
├── dev.tfvars             # Development environment variable values
├── terraform.tfstate      # Terraform state file (DO NOT COMMIT)
├── terraform.tfstate.backup
└── module/
    ├── vpc/               # VPC module
    │   ├── vpc.tf
    │   ├── subnets.tf
    │   ├── nat_gateway.tf
    │   ├── route_tables.tf
    │   ├── internet_gateway.tf
    │   └── variables.tf
    ├── IAM/               # IAM module
    │   ├── users.tf
    │   ├── groups.tf
    │   └── variables.tf
    ├── s3/                # S3 module
    │   ├── buckets.tf
    │   └── variables.tf
    └── sg/                # Security Groups module
        ├── sg.tf
        └── variables.tf
Managed Resources
Networking (VPC Module)

VPC: vpc-05ee2e561b25ea156 (10.133.44.0/24)
Subnets: 4 subnets across 2 availability zones (eu-west-1a, eu-west-1b)

2 Public subnets
2 Private subnets


NAT Gateway: nat-0e98eb0a5fe2e79b2
Internet Gateway: igw-0ba93071c90f2ab74
Route Tables: 4 route tables with associations

IAM Resources

IAM Users: 1 user (one_channel_hub_prog)
IAM Groups: 4 groups (Developers, Developers_prog, ManagedMFA, RequiredMFA)

Storage (S3 Module)
Multiple S3 buckets for various services including:

Serverless deployment buckets
Static website hosting
Media file storage
CloudTrail logs

Security

Security Groups: 2 security groups

SG-ONE-Channel-Hub-Lambdas-Default
default



Prerequisites

Terraform >= 1.0
AWS CLI configured with appropriate credentials
AWS Provider ~> 6.0

Setup Instructions
1. Clone the Repository
bashgit clone <repository-url>
cd <project-directory>
2. Configure AWS Credentials
Ensure your AWS CLI is configured with the correct profile:
bashaws configure --profile default
3. Initialize Terraform
bashterraform init
4. Validate Configuration
bashterraform validate
5. Review Changes
bashterraform plan -var-file="dev.tfvars"
6. Apply Changes (if needed)
bashterraform apply -var-file="dev.tfvars"
Important Notes
Imported Resources
All resources in this project were imported from an existing AWS account using the terraform import command. The state file contains the current configuration of these resources.
State File Management
⚠️ CRITICAL: The terraform.tfstate file contains sensitive information and should NEVER be committed to version control.
Add to .gitignore:
# Terraform
*.tfstate
*.tfstate.*
.terraform/
.terraform.lock.hcl
*.tfvars
Lambda Functions
Note: This project does NOT manage Lambda functions. The AWS account contains 150+ Lambda functions that are managed separately (likely via Serverless Framework or AWS SAM).
Usage
Adding New Resources

Add the resource configuration to the appropriate module
Add variables to variables.tf in both the module and root
Add values to dev.tfvars
Run terraform plan to review
Run terraform apply to create

Importing Existing Resources
Example import command:
bashterraform import -var-file="dev.tfvars" 'module.vpc.aws_subnet.this["subnet-name"]' subnet-xxxxx
Modules
VPC Module (./module/vpc)
Manages all VPC-related resources including subnets, route tables, NAT gateways, and internet gateways.
IAM Module (./module/IAM)
Manages IAM users and groups. Does not currently manage the 244 IAM roles present in the account.
S3 Module (./module/s3)
Manages S3 buckets used for application deployments and storage.
Security Groups Module (./module/sg)
Manages security groups for network access control.
Region Configuration

Primary Region: eu-west-1
Secondary Region: us-east-1 (for some resources)

Maintenance
Regular Tasks

Review and update Terraform provider versions
Audit imported resources for drift
Document any manual changes made in AWS Console
Backup state files regularly (use remote state in production)

Troubleshooting
If you encounter drift or changes:
bash# Refresh state
terraform refresh -var-file="dev.tfvars"


