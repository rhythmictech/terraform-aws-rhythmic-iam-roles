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
| terraform | >= 0.12.19 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| create\_security\_analyst\_role | Create role with SecurityAudit managed policy attached | `bool` | `true` | no |
| create\_standard\_admin\_role | Create StandardAdmin role | `bool` | `true` | no |
| master\_account | Master account that holds cross-account roles | `string` | n/a | yes |
| max\_session\_duration | STS token max lifetime | `number` | `7200` | no |
| role\_prefix | Optional prefix for IAM role names | `string` | `""` | no |
| standard\_admin\_additional\_policies | List of additional policy ARNs to attach to standard admin role | `list(string)` | `[]` | no |
| standard\_admin\_attach\_poweruser | Attach AWS managed policy PowerUser to Standard Admin role | `bool` | `true` | no |
| standard\_admin\_role\_name | Standard Admin role name | `string` | `"StandardAdmin"` | no |
| tags | Tags to apply across all roles | `map(string)` | `{}` | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
