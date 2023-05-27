## Provider AWS

provider "aws" {
    region = "ap-northeast-1"
}

## Create VPC

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "group3-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["ap-northeast-1a", "ap-northeast-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

/*   enable_nat_gateway = true
  enable_vpn_gateway = true */

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

