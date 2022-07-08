# Source Bucket Objects Transition in S3 Bucket Standard IA class
variable "source_bkt_SC_standard_ia" {
  description = "Source Bucket Objects Transition in S3 Standard IA class"
  type = number
  default = 30
}

# Source Bucket Objects Transition in S3 Bucket Intelligent tiering class
variable "source_bkt_SC_Intelligent_tier" {
  description = "Source Bucket Objects Transition in S3 Intelligent tiering"
  type = number
  default = 60
}

# Source Bucket Objects Transition in S3 Bucket Glacier storage class
variable "source_bkt_SC_glacier" {
  description = "Source Bucket Objects Transition in S3 Glacier storage class"
  type = number
  default = 90
}

# Source Bucket Objects to be expired after
variable "source_bkt_SC_expiration" {
  description = "Source Bucket Objects to be expired after no of days"
  type = number
  default = 180
}

# Source Bucket Objects Transition of non concurrent versions to be expired after
variable "source_bkt_SC_non_c_expiration" {
  description = "Source Bucket Objects Transition of non concurrent versions to be expired after no of days"
  type = number
  default = 90
}

# Destination Bucket Objects Transition in S3 Bucket Standard IA class
variable "dest_bkt_SC_standard_ia" {
  description = "Destination Bucket Objects Transition in S3 Standard IA class"
  type = number
  default = 30
}

# Destination Bucket Objects Transition in S3 Bucket Intelligent tiering class
variable "dest_bkt_SC_Intelligent_tier" {
  description = "Destination Bucket Objects Transition in S3 Intelligent tiering"
  type = number
  default = 60
}

# Destination Bucket Objects Transition in S3 Bucket Glacier storage class
variable "dest_bkt_SC_glacier" {
  description = "Destination Bucket Objects Transition in S3 Glacier storage class"
  type = number
  default = 90
}

# Destination Bucket Objects to be expired after
variable "dest_bkt_SC_expiration" {
  description = "Destination Bucket Objects to be expired after no of days"
  type = number
  default = 180
}

# Destination Bucket Objects Transition of non concurrent versions to be expired after
variable "dest_bkt_SC_non_c_expiration" {
  description = "Destination Bucket Objects Transition of non concurrent versions to be expired after no of days"
  type = number
  default = 90
}
