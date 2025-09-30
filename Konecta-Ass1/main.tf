terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_organizations_account" "main" {
  name  = "AWS_ONE_CHANNEL_HUB"
  email = "aws_one_channel_hub@grupokonecta.com"
}


# Call the S3 module
module "s3" {
  source = "./module/s3"

  api_konecta_cloud       = var.api_konecta_cloud
  ch_stack_core_admin_prd = var.ch_stack_core_admin_prd
  ch_stack_core_user_prd  = var.ch_stack_core_user_prd
  ch_stack_operators_admin = var.ch_stack_operators_admin
  ch_stack_operators_user  = var.ch_stack_operators_user
  kcrm_process_api_prd    = var.kcrm_process_api_prd

  one_channel_hub_prd_1  = var.one_channel_hub_prd_1
  one_channel_hub_prd_2  = var.one_channel_hub_prd_2
  one_channel_hub_prd_3  = var.one_channel_hub_prd_3
  one_channel_hub_prd_4  = var.one_channel_hub_prd_4
  one_channel_hub_prd_5  = var.one_channel_hub_prd_5
  one_channel_hub_prd_6  = var.one_channel_hub_prd_6
  one_channel_hub_prd_7  = var.one_channel_hub_prd_7
  one_channel_hub_prd_8  = var.one_channel_hub_prd_8
  one_channel_hub_prd_9  = var.one_channel_hub_prd_9
  one_channel_hub_prd_10 = var.one_channel_hub_prd_10
  one_channel_hub_prd_11 = var.one_channel_hub_prd_11
  one_channel_hub_prd_12 = var.one_channel_hub_prd_12
  one_channel_hub_prd_13 = var.one_channel_hub_prd_13

  one_channel_hub_prod_1  = var.one_channel_hub_prod_1
  one_channel_hub_prod_2  = var.one_channel_hub_prod_2
  one_channel_hub_prod_3  = var.one_channel_hub_prod_3
  one_channel_hub_prod_4  = var.one_channel_hub_prod_4
  one_channel_hub_prod_5  = var.one_channel_hub_prod_5
  one_channel_hub_prod_6  = var.one_channel_hub_prod_6
  one_channel_hub_prod_7  = var.one_channel_hub_prod_7
  one_channel_hub_prod_8  = var.one_channel_hub_prod_8
  one_channel_hub_prod_9  = var.one_channel_hub_prod_9
  one_channel_hub_prod_10 = var.one_channel_hub_prod_10
  one_channel_hub_prod_11 = var.one_channel_hub_prod_11
  one_channel_hub_prod_12 = var.one_channel_hub_prod_12
  one_channel_hub_prod_13 = var.one_channel_hub_prod_13

  one_channel_hub_provision       = var.one_channel_hub_provision
  one_channel_hub_site_dev        = var.one_channel_hub_site_dev
  one_channel_hub_static_si_1     = var.one_channel_hub_static_si_1
  one_channel_hub_static_si_2     = var.one_channel_hub_static_si_2
  one_channel_hub_static_site     = var.one_channel_hub_static_site
  one_channel_hub_static_site_prd = var.one_channel_hub_static_site_prd
  one_channel_hub_upload_mediafile_prd = var.one_channel_hub_upload_mediafile_prd
  one_channel_ses_email_prd       = var.one_channel_ses_email_prd
  one_channelhub_website_dev      = var.one_channelhub_website_dev
  one_channelhub_website_prd      = var.one_channelhub_website_prd
  one_channelhub_website_test     = var.one_channelhub_website_test
  stackset_cloudtrail             = var.stackset_cloudtrail

  tags = var.tags
}

module "vpc" {
  source = "./module/vpc"

  vpcs = var.vpcs
  tags = var.tags
  nat_gateways = var.nat_gateways
  subnets      = var.subnets 
  route_tables             = var.route_tables
  routes                   = var.routes
  route_table_associations = var.route_table_associations
  internet_gateways        = var.internet_gateways
}

module "iam" {
  source    = "./module/IAM"   # 👈 make sure this matches your folder name exactly
  iam_users = var.iam_users
  tags      = var.tags
  iam_groups = var.iam_groups
}

module "sg" {
  source = "./module/sg"

  security_groups = var.security_groups
  tags            = var.tags
}

