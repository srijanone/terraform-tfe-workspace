# Terraform Module for TFE workspace management 


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.12.24 |
| tfe | ~> 0.15.0 |
| tfe | ~> 0.15.0 |

## Providers

| Name | Version |
|------|---------|
| tfe | ~> 0.15.0 ~> 0.15.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| auto\_apply | (Optional) Whether to automatically apply changes when a Terraform plan is successful. Defaults to false. | `bool` | `false` | no |
| file\_triggers\_enabled | (Optional) Whether to filter runs based on the changed files in a VCS push. If enabled, the working directory and trigger prefixes describe a set of paths which must contain changes for a VCS push to trigger a run. If disabled, any push will trigger a run. Defaults to true | `bool` | `true` | no |
| name | (Required) Name of the workspace. | `string` | n/a | yes |
| oauth\_token\_id | Oauth token for VCS | `string` | `null` | no |
| operations | (Optional) Whether to use remote execution mode. When set to false, the workspace will be used for state storage only. Defaults to true | `bool` | `true` | no |
| organization | (Required) Name of the organization | `string` | n/a | yes |
| queue\_all\_runs | (Optional) Whether all runs should be queued. When set to false, runs triggered by a VCS change will not be queued until at least one run is manually queued. Defaults to true. | `bool` | `true` | no |
| ssh\_key\_id | (Optional) The ID of an SSH key to assign to the workspace. | `string` | `null` | no |
| terraform\_version | (Optional) The version of Terraform to use for this workspace. Defaults to the latest available version. | `string` | `"0.12.29"` | no |
| trigger\_prefixes | (Optional) List of repository-root-relative paths which describe all locations to be tracked for changes. | `list` | `[]` | no |
| variables | Map of environment or Terraform variables to define in the workspace. | `map(map(string))` | `{}` | no |
| vcs\_repo | n/a | `map` | `{}` | no |
| working\_directory | (Optional) A relative path that Terraform will execute within. Defaults to the root of your repository. | `string` | `null` | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->