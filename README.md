# AWS Infrastructure - Terraform Import Project
Overview
This project contains Terraform configurations for managing existing AWS infrastructure that has been imported from an AWS account. The infrastructure includes VPC networking, IAM resources, S3 buckets, and security groups. All resources were imported from a live AWS environment using the terraform import command.
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

VPC: 1 VPC with CIDR block configuration
Subnets: 4 subnets across 2 availability zones (eu-west-1a, eu-west-1b)

2 Public subnets
2 Private subnets


NAT Gateway: 1 NAT Gateway for private subnet internet access
Internet Gateway: 1 Internet Gateway attached to VPC
Route Tables: 4 route tables with subnet associations

IAM Resources

IAM Users: Imported users for programmatic access
IAM Groups: 4 groups (Developers, Developers_prog, ManagedMFA, RequiredMFA)

Storage (S3 Module)
Multiple S3 buckets for various services including:

Serverless deployment buckets
Static website hosting
Media file storage
CloudTrail logs

Security

Security Groups: 2 security groups

Custom Lambda security group
Default VPC security group



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

# Show specific resource
terraform state show 'module.vpc.aws_vpc.this["vpc-name"]'

# List all resources
terraform state list
Security Considerations

Never commit .tfvars files with sensitive data
Use remote state with encryption for production
Implement least privilege IAM policies for Terraform execution
Enable MFA for AWS accounts
Regular audit of security groups and IAM permissions

Common Issues and Troubleshooting
Issue 1: "Error: resource address does not exist in the configuration"
Problem: Terraform cannot find the resource configuration when trying to import.
Solution:

Ensure terraform init has been run to load all modules
Verify the module path is correct in main.tf
Check that the resource exists in the module's .tf files
Validate configuration with terraform validate

Issue 2: PowerShell Quote Escaping for Import Commands
Problem: Import commands fail with "Index value required" error in PowerShell.
Solution:
Use escaped quotes in PowerShell:
powershell# Correct syntax for PowerShell
terraform import -var-file="dev.tfvars" 'module.vpc.aws_subnet.this[\"subnet-name\"]' subnet-xxxxx

# Alternative: Use CMD instead of PowerShell
terraform import -var-file="dev.tfvars" "module.vpc.aws_subnet.this[\"subnet-name\"]" subnet-xxxxx
Issue 3: Region Mismatch During Import
Problem: "Cannot import non-existent remote object" error even though the resource exists.
Solution:

Verify the provider region in main.tf matches the resource's region
Check which region the resource is actually in using AWS CLI
For multi-region setups, ensure you're importing to the correct provider

Example:
powershell# Check resource region first
aws ec2 describe-subnets --subnet-ids subnet-xxxxx --region eu-west-1
Issue 4: Security Group Name Cannot Begin with "sg-"
Problem: Error: "invalid value for name (cannot begin with sg-)"
Solution:

The security group ID (like sg-xxxxx) is not the same as the name
Get the actual name from AWS:

powershellaws ec2 describe-security-groups --group-ids sg-xxxxx --query 'SecurityGroups[].GroupName'

Use the returned name in your dev.tfvars, not the ID

Issue 5: Large Number of Resources to Import
Problem: Too many resources (e.g., 244 IAM roles, 150+ Lambda functions) to import manually.
Solution:

Only import critical infrastructure resources
Use automated tools like Terraformer for bulk imports
Skip application-level resources managed by other tools (Serverless Framework, SAM)
Prioritize: VPC, Networking, IAM Groups/Users, Security Groups, S3

Issue 6: Plan Shows Unexpected Changes After Import
Problem: terraform plan shows resources will be modified or recreated after import.
Solution:

Compare Terraform configuration with actual AWS resource attributes
Use terraform state show to see what was imported
Add missing attributes to your configuration (e.g., enable_dns_support, map_public_ip_on_launch)
Check for default values that differ from AWS defaults

Example:
powershell# See imported resource details
terraform state show 'module.vpc.aws_vpc.this["vpc-name"]'
Issue 7: Missing Route Table Associations
Problem: Route tables imported but associations are missing.
Solution:

Route table associations must be imported separately
Get association IDs from AWS:

powershellaws ec2 describe-route-tables --query 'RouteTables[].[RouteTableId,Associations[].RouteTableAssociationId]'

Import each association with its specific ID

General Troubleshooting Commands
powershell# Refresh state from AWS
terraform refresh -var-file="dev.tfvars"

# List all managed resources
terraform state list

# Show specific resource details
terraform state show 'module.name.resource.type["key"]'

# Validate configuration
terraform validate

# Check formatting
terraform fmt -check

# Remove a resource from state (if needed)
terraform state rm 'module.name.resource.type["key"]'
