## DR S3

# In terraform.tfvars file modify the variables of generic variables like
  aws_region    
  environment      
  business_divsion

# local_values.tf
# Modify all environments common variables in local_values.tf like
  owners 
  environment 
  name 
  tags

# Created a 2nd provider with alias "region2" modify the 2nd region in provider_region2.tf
  region2

## S3
# S3 Buckets names are defined in s3_locals.tf as below and modify them accordingly in s3_locals.tf
  source_bucket_name       = "${var.business_divsion}-${var.environment}-source-bucket-2022"
  destination_bucket_name  = "${var.business_divsion}-${var.environment}-destination-bucket-2022"

# Prefix for s3 bucket replication configuration and S3 Lifecycle Configuration is defined as var.environment and it cosiders the value of environment we specify in terraform.tfvars
  var.environment


