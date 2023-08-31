# terraform-aws-rhythmic-iam-roles

[![](https://github.com/rhythmictech/terraform-aws-rhythmic-iam-roles/workflows/check/badge.svg)](https://github.com/rhythmictech/terraform-aws-rhythmic-iam-roles/actions)

Create and manage IAM roles for Rhythmic engineers to access accounts via cross-account IAM roles.

## Usage
```
module "rhythmic-iam-roles" {
  source         = "git::https://github.com/rhythmictech/terraform-aws-rhythmic-iam-roles.git"
  role_prefix    = "RhythmicOps-"
  master_account = "123456789012"
}

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.19 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.FullAdminAccess](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.FullReadOnlyAccess](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.SecurityAnalyst](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.StandardAdminAccess](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.FullAdminAccess](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.FullReadOnlyAccess](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.SecurityAnalyst](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.StandardAdminAccess](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.StandardAdmin_additional_policies](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.assume](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_security_analyst_role"></a> [create\_security\_analyst\_role](#input\_create\_security\_analyst\_role) | Create role with SecurityAudit managed policy attached | `bool` | `true` | no |
| <a name="input_create_standard_admin_role"></a> [create\_standard\_admin\_role](#input\_create\_standard\_admin\_role) | Create StandardAdmin role | `bool` | `true` | no |
| <a name="input_external_id"></a> [external\_id](#input\_external\_id) | External ID associated with the IAM role to be assumed, if applicable | `string` | `""` | no |
| <a name="input_master_account"></a> [master\_account](#input\_master\_account) | Master account that holds cross-account roles | `string` | n/a | yes |
| <a name="input_max_session_duration"></a> [max\_session\_duration](#input\_max\_session\_duration) | STS token max lifetime | `number` | `7200` | no |
| <a name="input_role_prefix"></a> [role\_prefix](#input\_role\_prefix) | Optional prefix for IAM role names | `string` | `""` | no |
| <a name="input_standard_admin_additional_policies"></a> [standard\_admin\_additional\_policies](#input\_standard\_admin\_additional\_policies) | List of additional policy ARNs to attach to standard admin role | `list(string)` | `[]` | no |
| <a name="input_standard_admin_attach_poweruser"></a> [standard\_admin\_attach\_poweruser](#input\_standard\_admin\_attach\_poweruser) | Attach AWS managed policy PowerUser to Standard Admin role | `bool` | `true` | no |
| <a name="input_standard_admin_role_name"></a> [standard\_admin\_role\_name](#input\_standard\_admin\_role\_name) | Standard Admin role name | `string` | `"StandardAdmin"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply across all roles | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
