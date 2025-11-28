terraform {
  required_version = ">= 1.13.3, < 2.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.14.1"
    }
  }

  cloud {
    organization = "dhrub-devops"
    workspaces {
      name = "netflix-clone-project"
    }
  }
}

provider "aws" {
  region = var.aws-region
}
