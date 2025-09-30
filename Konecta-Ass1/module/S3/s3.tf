resource "aws_s3_bucket" "api_konecta_cloud" {
  bucket = var.api_konecta_cloud
  tags   = var.tags
}

resource "aws_s3_bucket" "ch_stack_core_admin_prd" {
  bucket = var.ch_stack_core_admin_prd
  tags   = var.tags
}

resource "aws_s3_bucket" "ch_stack_core_user_prd" {
  bucket = var.ch_stack_core_user_prd
  tags   = var.tags
}

resource "aws_s3_bucket" "ch_stack_operators_admin" {
  bucket = var.ch_stack_operators_admin
  tags   = var.tags
}

resource "aws_s3_bucket" "ch_stack_operators_user" {
  bucket = var.ch_stack_operators_user
  tags   = var.tags
}

resource "aws_s3_bucket" "kcrm_process_api_prd" {
  bucket = var.kcrm_process_api_prd
  tags   = var.tags
}

# ---------------- one-channel-hub-prd ----------------
resource "aws_s3_bucket" "one_channel_hub_prd_1" {
   bucket = var.one_channel_hub_prd_1 
tags = var.tags
 }
resource "aws_s3_bucket" "one_channel_hub_prd_2" {
   bucket = var.one_channel_hub_prd_2 
tags = var.tags 
}
resource "aws_s3_bucket" "one_channel_hub_prd_3" {
   bucket = var.one_channel_hub_prd_3 
tags = var.tags 
}
resource "aws_s3_bucket" "one_channel_hub_prd_4" {
   bucket = var.one_channel_hub_prd_4 
tags = var.tags 
}
resource "aws_s3_bucket" "one_channel_hub_prd_5" {
   bucket = var.one_channel_hub_prd_5 
tags = var.tags 
}
resource "aws_s3_bucket" "one_channel_hub_prd_6" {
   bucket = var.one_channel_hub_prd_6 
tags = var.tags 
}
resource "aws_s3_bucket" "one_channel_hub_prd_7" {
   bucket = var.one_channel_hub_prd_7 
tags = var.tags 
}
resource "aws_s3_bucket" "one_channel_hub_prd_8" {
   bucket = var.one_channel_hub_prd_8 
tags = var.tags 
}
resource "aws_s3_bucket" "one_channel_hub_prd_9" {
   bucket = var.one_channel_hub_prd_9 
tags = var.tags 
}
resource "aws_s3_bucket" "one_channel_hub_prd_10" {
   bucket = var.one_channel_hub_prd_10 
tags = var.tags 
}
resource "aws_s3_bucket" "one_channel_hub_prd_11" {
   bucket = var.one_channel_hub_prd_11 
tags = var.tags 
}
resource "aws_s3_bucket" "one_channel_hub_prd_12" {
   bucket = var.one_channel_hub_prd_12 
tags = var.tags 
}
resource "aws_s3_bucket" "one_channel_hub_prd_13" {
   bucket = var.one_channel_hub_prd_13 
tags = var.tags 
}

# ---------------- one-channel-hub-prod ----------------
resource "aws_s3_bucket" "one_channel_hub_prod_1" { 
  bucket = var.one_channel_hub_prod_1
  tags   = var.tags
}
resource "aws_s3_bucket" "one_channel_hub_prod_2" { 
  bucket = var.one_channel_hub_prod_2
   tags = var.tags
    }
resource "aws_s3_bucket" "one_channel_hub_prod_3" { 
  bucket = var.one_channel_hub_prod_3
   tags = var.tags
    }
resource "aws_s3_bucket" "one_channel_hub_prod_4" {
   bucket = var.one_channel_hub_prod_4
    tags = var.tags
     }
resource "aws_s3_bucket" "one_channel_hub_prod_5" {
   bucket = var.one_channel_hub_prod_5
 tags = var.tags 
 }

resource "aws_s3_bucket" "one_channel_hub_prod_6" { 
bucket = var.one_channel_hub_prod_6
 tags = var.tags 
 }

resource "aws_s3_bucket" "one_channel_hub_prod_7" { 
  bucket = var.one_channel_hub_prod_7
 tags = var.tags 
 }
resource "aws_s3_bucket" "one_channel_hub_prod_8" { 
  bucket = var.one_channel_hub_prod_8
 tags = var.tags 
 }
resource "aws_s3_bucket" "one_channel_hub_prod_9" { 
  bucket = var.one_channel_hub_prod_9
 tags = var.tags 
 }
resource "aws_s3_bucket" "one_channel_hub_prod_10" {
   bucket = var.one_channel_hub_prod_10
 tags = var.tags
 }
resource "aws_s3_bucket" "one_channel_hub_prod_11" {
   bucket = var.one_channel_hub_prod_11
 tags = var.tags
 }
resource "aws_s3_bucket" "one_channel_hub_prod_12" {
   bucket = var.one_channel_hub_prod_12
 tags = var.tags
 }
resource "aws_s3_bucket" "one_channel_hub_prod_13" {
   bucket = var.one_channel_hub_prod_13
 tags = var.tags
 }

# ---------------- other buckets ----------------
resource "aws_s3_bucket" "one_channel_hub_provision" {
   bucket = var.one_channel_hub_provision
 tags = var.tags 
}
resource "aws_s3_bucket" "one_channel_hub_site_dev" {
   bucket = var.one_channel_hub_site_dev
 tags = var.tags 
}
resource "aws_s3_bucket" "one_channel_hub_static_si_1" {
   bucket = var.one_channel_hub_static_si_1
 tags = var.tags 
}
resource "aws_s3_bucket" "one_channel_hub_static_si_2" {
   bucket = var.one_channel_hub_static_si_2
 tags = var.tags 
}
resource "aws_s3_bucket" "one_channel_hub_static_site" {
   bucket = var.one_channel_hub_static_site
 tags = var.tags 
}
resource "aws_s3_bucket" "one_channel_hub_static_site_prd" {
   bucket = var.one_channel_hub_static_site_prd
 tags = var.tags 
}
resource "aws_s3_bucket" "one_channel_hub_upload_mediafile_prd" {
   bucket = var.one_channel_hub_upload_mediafile_prd
 tags = var.tags 
 
 }
resource "aws_s3_bucket" "one_channel_ses_email_prd" {
   bucket = var.one_channel_ses_email_prd
 tags = var.tags 
}
resource "aws_s3_bucket" "one_channelhub_website_dev" {
   bucket = var.one_channelhub_website_dev 
tags = var.tags 
}
resource "aws_s3_bucket" "one_channelhub_website_prd" {
   bucket = var.one_channelhub_website_prd 
tags = var.tags 
}
resource "aws_s3_bucket" "one_channelhub_website_test" {
  bucket = var.one_channelhub_website_test
 tags = var.tags 
}
resource "aws_s3_bucket" "stackset_cloudtrail" {
  bucket = var.stackset_cloudtrail
 tags = var.tags 
}
