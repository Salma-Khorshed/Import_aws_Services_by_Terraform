variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "aws_profile" {
  description = "AWS CLI profile to use"
  type        = string
}


variable "api_konecta_cloud" { type = string }
variable "ch_stack_core_admin_prd" { type = string }
variable "ch_stack_core_user_prd" { type = string }
variable "ch_stack_operators_admin" { type = string }
variable "ch_stack_operators_user" { type = string }
variable "kcrm_process_api_prd" { type = string }

variable "one_channel_hub_prd_1" { type = string }
variable "one_channel_hub_prd_2" { type = string }
variable "one_channel_hub_prd_3" { type = string }
variable "one_channel_hub_prd_4" { type = string }
variable "one_channel_hub_prd_5" { type = string }
variable "one_channel_hub_prd_6" { type = string }
variable "one_channel_hub_prd_7" { type = string }
variable "one_channel_hub_prd_8" { type = string }
variable "one_channel_hub_prd_9" { type = string }
variable "one_channel_hub_prd_10" { type = string }
variable "one_channel_hub_prd_11" { type = string }
variable "one_channel_hub_prd_12" { type = string }
variable "one_channel_hub_prd_13" { type = string }

variable "one_channel_hub_prod_1" { type = string }
variable "one_channel_hub_prod_2" { type = string }
variable "one_channel_hub_prod_3" { type = string }
variable "one_channel_hub_prod_4" { type = string }
variable "one_channel_hub_prod_5" { type = string }
variable "one_channel_hub_prod_6" { type = string }
variable "one_channel_hub_prod_7" { type = string }
variable "one_channel_hub_prod_8" { type = string }
variable "one_channel_hub_prod_9" { type = string }
variable "one_channel_hub_prod_10" { type = string }
variable "one_channel_hub_prod_11" { type = string }
variable "one_channel_hub_prod_12" { type = string }
variable "one_channel_hub_prod_13" { type = string }

variable "one_channel_hub_provision" { type = string }
variable "one_channel_hub_site_dev" { type = string }
variable "one_channel_hub_static_si_1" { type = string }
variable "one_channel_hub_static_si_2" { type = string }
variable "one_channel_hub_static_site" { type = string }
variable "one_channel_hub_static_site_prd" { type = string }
variable "one_channel_hub_upload_mediafile_prd" { type = string }
variable "one_channel_ses_email_prd" { type = string }
variable "one_channelhub_website_dev" { type = string }
variable "one_channelhub_website_prd" { type = string }
variable "one_channelhub_website_test" { type = string }
variable "stackset_cloudtrail" { type = string }




# VPC
# variable "aws_region" {
#   description = "AWS region to deploy"
#   type        = string
# }

# variable "aws_profile" {
#   description = "AWS CLI profile to use"
#   type        = string
# }

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default     = {}
}


variable "vpcs" {
  description = "Map of VPCs to manage"
  type = map(object({
    cidr = string
  }))
}


variable "iam_users" {
  description = "Set of IAM users to import/manage"
  type        = set(string)
}

variable "security_groups" {
  description = "Map of security groups to manage"
  type = map(object({
    name        = string
    description = string
    vpc_id      = string
  }))
}

# NAT
variable "nat_gateways" {
  description = "Map of NAT Gateways to manage"
  type = map(object({
    allocation_id = string
    subnet_id     = string
  }))
  default = {}
}

variable "subnets" {
  description = "Map of subnets to manage"
  type = map(object({
    vpc_id            = string
    cidr_block        = string
    availability_zone = string
  }))
  default = {}
}

variable "route_tables" {
  description = "Map of route tables to manage"
  type = map(object({
    vpc_id = string
  }))
  default = {}
}

variable "routes" {
  description = "Map of routes to manage"
  type = map(object({
    route_table_key        = string
    destination_cidr_block = string
    gateway_id             = optional(string)
    nat_gateway_id         = optional(string)
  }))
  default = {}
}

variable "route_table_associations" {
  description = "Map of route table associations"
  type = map(object({
    route_table_key = string
    subnet_id       = string
  }))
  default = {}
}

variable "internet_gateways" {
  description = "Map of Internet Gateways to manage"
  type = map(object({
    vpc_id = string
  }))
  default = {}
}

variable "iam_groups" {
  description = "Map of IAM groups to manage"
  type = map(object({
    path = optional(string)
  }))
  default = {}
}