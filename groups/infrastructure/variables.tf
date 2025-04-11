# Environment
variable "environment" {
  type        = string
  description = "The environment name, defined in envrionments vars."
}
variable "aws_region" {
  default     = "eu-west-2"
  type        = string
  description = "The AWS region for deployment."
}
variable "aws_profile" {
  default     = "development-eu-west-2"
  type        = string
  description = "The AWS profile to use for deployment."
}

variable "cert_domain" {
  description = "The certificate domain to use."
  type        = string
}

variable "domain_name" {
  description = "Domain name"
  type        = string
}

variable "enable_oracle_query_api_alb" {
  default     = true
  description = "Defines whether an ALB for the oracle-query-api should be created (true) or not (false)"
  type        = bool
}

variable "enable_enablement_presenter_api_alb" {
  default     = true
  description = Defines whether an ALB for the enablement-presenter-api should be created (true) or not (false)"
  type        = bool
}

# EC2
variable "ec2_key_pair_name" {
  type        = string
  description = "The key pair for SSH access to ec2 instances in the clusters."
}
variable "ec2_instance_type" {
  default     = "t3.medium"
  type        = string
  description = "The instance type for ec2 instances in the clusters."
}
variable "ec2_image_id" {
  default     = "ami-04018f95156d810bc" # ECS optimized Amazon2 Linux in London created 15/03/2023
  type        = string
  description = "The machine image name for the ECS cluster launch configuration."
}

# Auto-scaling Group
variable "asg_max_instance_count" {
  default     = 0
  type        = number
  description = "The maximum allowed number of instances in the autoscaling group for the cluster."
}
variable "asg_min_instance_count" {
  default     = 0
  type        = number
  description = "The minimum allowed number of instances in the autoscaling group for the cluster."
}
variable "asg_desired_instance_count" {
  default     = 0
  type        = number
  description = "The desired number of instances in the autoscaling group for the cluster. Must fall within the min/max instance count range."
}

variable "asg_scaledown_schedule" {
  default     = ""
  type        = string
  description = "The schedule to use when scaling down the number of EC2 instances to zero."
}

variable "asg_scaleup_schedule" {
  default     = ""
  type        = string
  description = "The schedule to use when scaling up the number of EC2 instances to their normal desired level."
}

variable "enable_asg_autoscaling" {
  default     = true
  type        = bool
  description = "Whether to enable auto-scaling of the ASG by creating a capacity provider for the ECS cluster."
}

# Container Insights - ECS
variable "enable_container_insights" {
  type        = bool
  description = "A boolean value indicating whether to enable Container Insights or not"
  default     = true
}

# DNS

variable "route53_aliases_oracle_query_api" {
  type        = list(string)
  description = "The Route53 aliases to create for oracle-query-api lb."
  default     = []
}

variable "route53_aliases_enablement_presenter_api" {
  type        = list(string)
  description = "The Route53 aliases to create for enablement-presenter-api lb ."
  default     = []
}

variable "create_route53_aliases" {
  default     = false
  description = "Whether to create Route53 aliases pointing to the ALB"
  type        = bool
}
