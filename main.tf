terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  cloud {
    organization = var.tfc_organization
    workspaces {
    tags = [var.tfc_workspace_tag]
    }
  }

}

provider "aws" {
  region = var.region
  default_tags {
    tags = var.default_tags
  }
}

