terraform {
  required_version = "~> 1.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.54.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "~> 3.18.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {}
}

module "oracle-query-api-alb" {
  source = "git@github.com:companieshouse/terraform-modules//aws/application_load_balancer?ref=1.0.297"

  environment             = var.environment
  service                 = "oracle-query-api"
  ssl_certificate_arn     = data.aws_acm_certificate.cert.arn
  subnet_ids              = split(",", local.subnet_ids_private)
  vpc_id                  = data.aws_vpc.vpc.id
  idle_timeout            = 1200
  create_security_group   = true
  internal                = true
  count                   = var.enable_oracle_query_api_alb ? 1 : 0
  ingress_cidrs           = local.ingress_cidrs_private
  redirect_http_to_https  = true
  route53_domain_name     = var.domain_name
  route53_aliases         = var.route53_aliases_oracle_query_api
  create_route53_aliases  = var.create_route53_aliases
  service_configuration = {
    listener_config = {
      default_action_type = "fixed-response"
      port                = 443
    }
  }
}

module "enablement-presenter-api-alb" {
  source = "git@github.com:companieshouse/terraform-modules//aws/application_load_balancer?ref=1.0.307"

  environment             = var.environment
  service                 = "enablement-pres-api"
  ssl_certificate_arn     = data.aws_acm_certificate.cert.arn
  subnet_ids              = split(",", local.subnet_ids_private)
  vpc_id                  = data.aws_vpc.vpc.id
  idle_timeout            = 1200
  create_security_group   = true
  internal                = true
  count                   = var.enable_enablement_presenter_api_alb ? 1 : 0
  ingress_cidrs           = local.ingress_cidrs_private
  ingress_prefix_list_ids = local.ingress_prefix_list_ids
  redirect_http_to_https  = true
  route53_domain_name     = var.domain_name
  route53_aliases         = var.route53_aliases_enablement_presenter_api
  create_route53_aliases  = var.create_route53_aliases
  service_configuration = {
    listener_config = {
      default_action_type = "fixed-response"
      port                = 443
    }
  }
}

module "ch-service-mock-alb" {
  source = "git@github.com:companieshouse/terraform-modules//aws/application_load_balancer?ref=1.0.329"

  count                   = var.enable_ch_service_mock_alb ? 1 : 0  

  environment             = var.environment
  service                 = "ch-service-mock"
  ssl_certificate_arn     = data.aws_acm_certificate.cert.arn
  subnet_ids              = split(",", local.subnet_ids_private)
  vpc_id                  = data.aws_vpc.vpc.id
  idle_timeout            = 1200
  create_security_group   = true
  internal                = true
  ingress_cidrs           = local.ingress_cidrs_private
  ingress_prefix_list_ids = local.ingress_prefix_list_ids
  redirect_http_to_https  = true
  route53_domain_name     = var.domain_name
  route53_aliases         = var.route53_aliases_ch_service_mock
  create_route53_aliases  = var.create_route53_aliases
  service_configuration = {
    listener_config = {
      default_action_type = "fixed-response"
      port                = 443
    }
  }
}

module "ecs-cluster" {
  source = "git@github.com:companieshouse/terraform-modules//aws/ecs/ecs-cluster?ref=1.0.231"

  stack_name                  = local.stack_name
  name_prefix                 = local.name_prefix
  environment                 = var.environment
  aws_profile                 = var.aws_profile
  vpc_id                      = data.aws_vpc.vpc.id
  subnet_ids                  = local.application_subnet_ids
  ec2_key_pair_name           = var.ec2_key_pair_name
  ec2_instance_type           = var.ec2_instance_type
  ec2_image_id                = var.ec2_image_id
  asg_max_instance_count      = var.asg_max_instance_count
  asg_min_instance_count      = var.asg_min_instance_count
  enable_container_insights   = var.enable_container_insights
  asg_desired_instance_count  = var.asg_desired_instance_count
  scaledown_schedule          = var.asg_scaledown_schedule
  scaleup_schedule            = var.asg_scaleup_schedule
  enable_asg_autoscaling      = var.enable_asg_autoscaling
  notify_topic_slack_endpoint = local.notify_topic_slack_endpoint
}

module "secrets" {
  source = "git@github.com:companieshouse/terraform-modules//aws/ecs/secrets?ref=1.0.231"

  environment = var.environment
  name_prefix = local.name_prefix
  secrets     = local.parameter_store_secrets
  kms_key_id  = data.aws_kms_key.stack_configs.id
}
