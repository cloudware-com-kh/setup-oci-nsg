terraform {
  required_version = ">= 1.0"
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 5.0.0"
    }
  }

  backend "s3" {
    bucket  = "cloudware-tfstate"
    key     = "$repo/terraform.tfstate"
    region  = "ap-southeast-1"
    encrypt = true
  }
}

provider "oci" {
  fingerprint  = var.api_fingerprint
  private_key  = var.api_private_key
  region       = var.region
  tenancy_ocid = var.tenancy_id
  user_ocid    = var.user_id
}
