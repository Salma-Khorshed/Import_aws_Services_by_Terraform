aws_region  = "us-east-1"
aws_profile = "default"

api_konecta_cloud       = "api.konecta.cloud"
ch_stack_core_admin_prd = "ch-stack-core-admin-prd-serverlessdeploymentbucket-dffvcreiko7d"
ch_stack_core_user_prd  = "ch-stack-core-user-prd-serverlessdeploymentbucket-fyvngpscppzk"
ch_stack_operators_admin = "ch-stack-operators-admin--serverlessdeploymentbuck-m1ibim0m27re"
ch_stack_operators_user  = "ch-stack-operators-user-p-serverlessdeploymentbuck-n3ztsilhl593"
kcrm_process_api_prd    = "kcrm-process-api-prd-serverlessdeploymentbucket-cwcshd5gsup0"

one_channel_hub_prd_1  = "one-channel-hub-prd-serverlessdeploymentbucket-12xmfse0gfcgs"
one_channel_hub_prd_2  = "one-channel-hub-prd-serverlessdeploymentbucket-1ahotl7zemkxc"
one_channel_hub_prd_3  = "one-channel-hub-prd-serverlessdeploymentbucket-1bn8s4xpesbil"
one_channel_hub_prd_4  = "one-channel-hub-prd-serverlessdeploymentbucket-1pbddbhr39h75"
one_channel_hub_prd_5  = "one-channel-hub-prd-serverlessdeploymentbucket-1pv3mp0srgqkn"
one_channel_hub_prd_6  = "one-channel-hub-prd-serverlessdeploymentbucket-1q89niuwp67g3"
one_channel_hub_prd_7  = "one-channel-hub-prd-serverlessdeploymentbucket-1rsfzzg70xyl0"
one_channel_hub_prd_8  = "one-channel-hub-prd-serverlessdeploymentbucket-j8u8z24axdxt"
one_channel_hub_prd_9  = "one-channel-hub-prd-serverlessdeploymentbucket-rep38sn3jzhm"
one_channel_hub_prd_10 = "one-channel-hub-prod-serverlessdeploymentbucket-140h34vv4efp8"
one_channel_hub_prd_11 = "one-channel-hub-prod-serverlessdeploymentbucket-16ghh7ke8q985"
one_channel_hub_prd_12 = "one-channel-hub-prod-serverlessdeploymentbucket-16o0z0l1ijzlg"
one_channel_hub_prd_13 = "one-channel-hub-prod-serverlessdeploymentbucket-197p3q9f03vsj"

one_channel_hub_prod_1  = "one-channel-hub-prod-serverlessdeploymentbucket-1pd52f60p12lb"
one_channel_hub_prod_2  = "one-channel-hub-prod-serverlessdeploymentbucket-1ssou92q57nvs"
one_channel_hub_prod_3  = "one-channel-hub-prod-serverlessdeploymentbucket-1uzzztra3tdme"
one_channel_hub_prod_4  = "one-channel-hub-prod-serverlessdeploymentbucket-bovnjrkeen1x"
one_channel_hub_prod_5  = "one-channel-hub-prod-serverlessdeploymentbucket-ghlmifxiemvf"
one_channel_hub_prod_6  = "one-channel-hub-prod-serverlessdeploymentbucket-h190g4a46laj"
one_channel_hub_prod_7  = "one-channel-hub-prod-serverlessdeploymentbucket-pidobdsvn7ka"
one_channel_hub_prod_8  = "one-channel-hub-prod-serverlessdeploymentbucket-qasxmojyc1x"
one_channel_hub_prod_9  = "one-channel-hub-prod-serverlessdeploymentbucket-trsvlkjsnqmi"
one_channel_hub_prod_10 = "one-channel-hub-provision-serverlessdeploymentbuck-80qtzssjiic8"
one_channel_hub_prod_11 = "one-channel-hub-site-dev-serverlessdeploymentbucke-j8jpvjlzugfo"
one_channel_hub_prod_12 = "one-channel-hub-static-si-serverlessdeploymentbuck-0mwtxpky89yq"
one_channel_hub_prod_13 = "one-channel-hub-static-si-serverlessdeploymentbuck-hfxpt8gtegue"

one_channel_hub_provision       = "one-channel-hub-static-site"
one_channel_hub_site_dev        = "one-channel-hub-static-site-prd"
one_channel_hub_static_si_1     = "one-channel-hub-upload-mediafile-prd"
one_channel_hub_static_si_2     = "one-channel-ses-email-prd"
one_channel_hub_static_site     = "one-channelhub-website-de-serverlessdeploymentbuck-mcr9eiaauoxz"
one_channel_hub_static_site_prd = "one-channelhub-website-pr-serverlessdeploymentbuck-b8yjyr1ru725"
one_channel_hub_upload_mediafile_prd = "one-channelhub-website-te-serverlessdeploymentbuck-etflg2sdgodm"
one_channel_ses_email_prd       = "stackset-stacksetcloudtrailwitchcloud-trailbucket-14g1uofp3r0rj"

one_channelhub_website_dev  = "one-channel-hub-static-site"
one_channelhub_website_prd  = "one-channel-hub-static-site-prd"
one_channelhub_website_test = "one-channel-hub-upload-mediafile-prd"
stackset_cloudtrail         = "stackset-stacksetcloudtrailwitchcloud-trailbucket-14g1uofp3r0rj"


# VPC
vpcs = {
  default-vpc-use1 = {
    cidr = "172.31.0.0/16"
  }
}

# IAM
iam_users = ["one_channel_hub_prog"]

tags = {
  Environment = "dev"
  Owner       = "Salma"
}


# Security Groups 

# security_groups = {
#   sg-05b3b1d5e4904d474 = {
#     name        = "sg-05b3b1d5e4904d474"
#     description = "Imported security group sg-05b3b1d5e4904d474"
#     vpc_id      = "vpc-05ee2e561b25ea156"  
#   }

#   sg-02c996aec871c39bf = {
#     name        = "sg-02c996aec871c39bf"
#     description = "Imported security group sg-02c996aec871c39bf"
#     vpc_id      = "vpc-05ee2e561b25ea156"  # ✅ replace with the real VPC ID
#   }
# }
# Security Groups
security_groups = {
  sg-05b3b1d5e4904d474 = {
    name        = "SG-ONE-Channel-Hub-Lambdas-Default"
    description = "Imported security group sg-05b3b1d5e4904d474"
    vpc_id      = "vpc-05ee2e561b25ea156"
  }

  sg-02c996aec871c39bf = {
    name        = "default"
    description = "Imported security group sg-02c996aec871c39bf"
    vpc_id      = "vpc-05ee2e561b25ea156"
  }
}

# NAT Gateways
nat_gateways = {
  nat-eu-west-1 = {
    allocation_id = "eipalloc-07177f5d6e45cf6ca"  # Replace with actual EIP allocation ID
    subnet_id     = "subnet-0313035df85fcd076"
  }
}

# Subnets
subnets = {
  subnet-private2-euw1b = {
    vpc_id            = "vpc-05ee2e561b25ea156"
    cidr_block        = "10.133.44.16/28"
    availability_zone = "eu-west-1b"
  }
  subnet-public2-euw1b = {
    vpc_id            = "vpc-05ee2e561b25ea156"
    cidr_block        = "10.133.44.48/28"
    availability_zone = "eu-west-1b"
  }
  subnet-public1-euw1a = {
    vpc_id            = "vpc-05ee2e561b25ea156"
    cidr_block        = "10.133.44.32/28"
    availability_zone = "eu-west-1a"
  }
  subnet-private1-euw1a = {
    vpc_id            = "vpc-05ee2e561b25ea156"
    cidr_block        = "10.133.44.0/28"
    availability_zone = "eu-west-1a"
  }
}

# Route Tables
route_tables = {
  rtb-private2-euw1b = {
    vpc_id = "vpc-05ee2e561b25ea156"
  }
  rtb-public2-euw1b = {
    vpc_id = "vpc-05ee2e561b25ea156"
  }
  rtb-public1-euw1a = {
    vpc_id = "vpc-05ee2e561b25ea156"
  }
  rtb-private1-euw1a = {
    vpc_id = "vpc-05ee2e561b25ea156"
  }
}

# Route Table Associations
route_table_associations = {
  assoc-private2-euw1b = {
    route_table_key = "rtb-private2-euw1b"
    subnet_id       = "subnet-0675dae736ca47137"
  }
  assoc-public2-euw1b = {
    route_table_key = "rtb-public2-euw1b"
    subnet_id       = "subnet-0fc626adc3633defd"
  }
  assoc-public1-euw1a = {
    route_table_key = "rtb-public1-euw1a"
    subnet_id       = "subnet-0313035df85fcd076"
  }
  assoc-private1-euw1a = {
    route_table_key = "rtb-private1-euw1a"
    subnet_id       = "subnet-058c52100db85a8ba"
  }
}

# Internet Gateways
internet_gateways = {
  igw-euw1 = {
    vpc_id = "vpc-05ee2e561b25ea156"
  }
}
# IAM Groups
iam_groups = {
  Developers = {
    path = "/"
  }
  Developers_prog = {
    path = "/"
  }
  ManagedMFA = {
    path = "/"
  }
  RequiredMFA = {
    path = "/"
  }
}