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
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| master\_account | account authenticating from | string | n/a | yes |
| role\_prefix |  | string | `""` | no |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
