<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.54.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | ~> 3.18.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.54.0 |
| <a name="provider_aws.heritage"></a> [aws.heritage](#provider\_aws.heritage) | ~> 4.54.0 |
| <a name="provider_vault"></a> [vault](#provider\_vault) | ~> 3.18.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ch-service-mock-alb"></a> [ch-service-mock-alb](#module\_ch-service-mock-alb) | git@github.com:companieshouse/terraform-modules//aws/application_load_balancer | 1.0.348 |
| <a name="module_ecs-cluster"></a> [ecs-cluster](#module\_ecs-cluster) | git@github.com:companieshouse/terraform-modules//aws/ecs/ecs-cluster | 1.0.231 |
| <a name="module_enablement-presenter-api-alb"></a> [enablement-presenter-api-alb](#module\_enablement-presenter-api-alb) | git@github.com:companieshouse/terraform-modules//aws/application_load_balancer | 1.0.348 |
| <a name="module_felixvalidator-alb"></a> [felixvalidator-alb](#module\_felixvalidator-alb) | git@github.com:companieshouse/terraform-modules//aws/application_load_balancer | 1.0.348 |
| <a name="module_oracle-query-api-alb"></a> [oracle-query-api-alb](#module\_oracle-query-api-alb) | git@github.com:companieshouse/terraform-modules//aws/application_load_balancer | 1.0.348 |
| <a name="module_secrets"></a> [secrets](#module\_secrets) | git@github.com:companieshouse/terraform-modules//aws/ecs/secrets | 1.0.348 |

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.cert](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/acm_certificate) | data source |
| [aws_ec2_managed_prefix_list.admin_cidr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ec2_managed_prefix_list) | data source |
| [aws_kms_key.stack_configs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_key) | data source |
| [aws_subnet.heritage_application](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnet.management](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnet.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnet.routing_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnets.application](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_subnets.heritage_application](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_subnets.management](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_subnets.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |
| [vault_generic_secret.secrets](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/generic_secret) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_asg_desired_instance_count"></a> [asg\_desired\_instance\_count](#input\_asg\_desired\_instance\_count) | The desired number of instances in the autoscaling group for the cluster. Must fall within the min/max instance count range. | `number` | `0` | no |
| <a name="input_asg_max_instance_count"></a> [asg\_max\_instance\_count](#input\_asg\_max\_instance\_count) | The maximum allowed number of instances in the autoscaling group for the cluster. | `number` | `0` | no |
| <a name="input_asg_min_instance_count"></a> [asg\_min\_instance\_count](#input\_asg\_min\_instance\_count) | The minimum allowed number of instances in the autoscaling group for the cluster. | `number` | `0` | no |
| <a name="input_asg_scaledown_schedule"></a> [asg\_scaledown\_schedule](#input\_asg\_scaledown\_schedule) | The schedule to use when scaling down the number of EC2 instances to zero. | `string` | `""` | no |
| <a name="input_asg_scaleup_schedule"></a> [asg\_scaleup\_schedule](#input\_asg\_scaleup\_schedule) | The schedule to use when scaling up the number of EC2 instances to their normal desired level. | `string` | `""` | no |
| <a name="input_aws_profile"></a> [aws\_profile](#input\_aws\_profile) | The AWS profile to use for deployment. | `string` | `"development-eu-west-2"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region for deployment. | `string` | `"eu-west-2"` | no |
| <a name="input_cert_domain"></a> [cert\_domain](#input\_cert\_domain) | The certificate domain to use. | `string` | n/a | yes |
| <a name="input_create_route53_aliases"></a> [create\_route53\_aliases](#input\_create\_route53\_aliases) | Whether to create Route53 aliases pointing to the ALB | `bool` | `false` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Domain name | `string` | n/a | yes |
| <a name="input_ec2_image_id"></a> [ec2\_image\_id](#input\_ec2\_image\_id) | The machine image name for the ECS cluster launch configuration. | `string` | `"ami-04018f95156d810bc"` | no |
| <a name="input_ec2_instance_type"></a> [ec2\_instance\_type](#input\_ec2\_instance\_type) | The instance type for ec2 instances in the clusters. | `string` | `"t3.medium"` | no |
| <a name="input_ec2_key_pair_name"></a> [ec2\_key\_pair\_name](#input\_ec2\_key\_pair\_name) | The key pair for SSH access to ec2 instances in the clusters. | `string` | n/a | yes |
| <a name="input_enable_asg_autoscaling"></a> [enable\_asg\_autoscaling](#input\_enable\_asg\_autoscaling) | Whether to enable auto-scaling of the ASG by creating a capacity provider for the ECS cluster. | `bool` | `true` | no |
| <a name="input_enable_ch_service_mock_alb"></a> [enable\_ch\_service\_mock\_alb](#input\_enable\_ch\_service\_mock\_alb) | Defines whether an ALB for the ch-service-mock should be created (true) or not (false) | `bool` | `true` | no |
| <a name="input_enable_container_insights"></a> [enable\_container\_insights](#input\_enable\_container\_insights) | A boolean value indicating whether to enable Container Insights or not | `bool` | `true` | no |
| <a name="input_enable_enablement_presenter_api_alb"></a> [enable\_enablement\_presenter\_api\_alb](#input\_enable\_enablement\_presenter\_api\_alb) | Defines whether an ALB for the enablement-presenter-api should be created (true) or not (false) | `bool` | `true` | no |
| <a name="input_enable_felixvalidator_alb"></a> [enable\_felixvalidator\_alb](#input\_enable\_felixvalidator\_alb) | Defines whether an ALB for the felixvalidator should be created (true) or not (false) | `bool` | `true` | no |
| <a name="input_enable_oracle_query_api_alb"></a> [enable\_oracle\_query\_api\_alb](#input\_enable\_oracle\_query\_api\_alb) | Defines whether an ALB for the oracle-query-api should be created (true) or not (false) | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment name, defined in envrionments vars. | `string` | n/a | yes |
| <a name="input_hashicorp_vault_password"></a> [hashicorp\_vault\_password](#input\_hashicorp\_vault\_password) | The password used when retrieving configuration from Hashicorp Vault | `string` | n/a | yes |
| <a name="input_hashicorp_vault_username"></a> [hashicorp\_vault\_username](#input\_hashicorp\_vault\_username) | The username used when retrieving configuration from Hashicorp Vault | `string` | n/a | yes |
| <a name="input_heritage_aws_access_key_id"></a> [heritage\_aws\_access\_key\_id](#input\_heritage\_aws\_access\_key\_id) | Variable access key for heritage accounts | `string` | n/a | yes |
| <a name="input_heritage_aws_secret_access_key"></a> [heritage\_aws\_secret\_access\_key](#input\_heritage\_aws\_secret\_access\_key) | Variable secret key for heritage accounts | `string` | n/a | yes |
| <a name="input_route53_aliases_ch_service_mock"></a> [route53\_aliases\_ch\_service\_mock](#input\_route53\_aliases\_ch\_service\_mock) | The Route53 aliases to create for ch-service-mock lb | `list(string)` | `[]` | no |
| <a name="input_route53_aliases_enablement_presenter_api"></a> [route53\_aliases\_enablement\_presenter\_api](#input\_route53\_aliases\_enablement\_presenter\_api) | The Route53 aliases to create for enablement-presenter-api lb . | `list(string)` | `[]` | no |
| <a name="input_route53_aliases_felixvalidator"></a> [route53\_aliases\_felixvalidator](#input\_route53\_aliases\_felixvalidator) | The Route53 aliases to create for felixvalidator lb . | `list(string)` | `[]` | no |
| <a name="input_route53_aliases_oracle_query_api"></a> [route53\_aliases\_oracle\_query\_api](#input\_route53\_aliases\_oracle\_query\_api) | The Route53 aliases to create for oracle-query-api lb. | `list(string)` | `[]` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->