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
    Terraform   = "true"
    Environment = "dev"
  }
}

## ECS Module

module "ecs" {
  source = "terraform-aws-modules/ecs/aws"

  cluster_name = "group3-ecs-tf"

  fargate_capacity_providers = {
    FARGATE = {
      default_capacity_provider_strategy = {
        weight = 100
      }
    }
  }

  services = {
    group3-ecs = { #td name
      cpu    = 512
      memory = 1024

      # Container definition(s)
      container_definitions = {

        group3-ecs-container = { #container name
          essential = true
          image     = "public.ecr.aws/docker/library/httpd:latest"
          port_mappings = [
            {
              name          = "ecs-sample"
              containerPort = 8080
              protocol      = "tcp"
            }
          ]
          readonly_root_filesystem = false

        }
      }
      assign_public_ip                   = true
      deployment_minimum_healthy_percent = 100
      subnet_ids                         = ["subnet-0c367963f6cb16292", "subnet-0db7c7648426ccf6f"]
      security_group_rules = {
        ingress_all = {
          type        = "ingress"
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          description = "Allow all"
          cidr_blocks = ["0.0.0.0/0"]
        }
        egress_all = {
          type        = "egress"
          from_port   = 0
          to_port     = 0
          protocol    = "-1"
          cidr_blocks = ["0.0.0.0/0"]
        }
      }
    }
  }

}


##Test TF Workflow with EC2 2

/* resource "aws_instance" "testEC2" {
  ami = "ami-03dceaabddff8067e"
  instance_type = "t2.micro"
  tags = {
    Name = "testEC2"
  }
}  */

