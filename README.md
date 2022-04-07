# terraform-github-default-repository

Resource that allows to declare [branch protection rules](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/defining-the-mergeability-of-pull-requests/managing-a-branch-protection-rule) for repository.

<!-- START_OF_AUTO_GENERATED_SECTION -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_github"></a> [github](#requirement\_github) | < 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | < 5.0 |
## Resources

| Name | Type |
|------|------|
| [github_repository.default](https://registry.terraform.io/providers/github/latest/docs/resources/repository) | resource |
| [github_team_repository.admin](https://registry.terraform.io/providers/github/latest/docs/resources/team_repository) | resource |
| [github_team_repository.pull](https://registry.terraform.io/providers/github/latest/docs/resources/team_repository) | resource |
| [github_team_repository.push](https://registry.terraform.io/providers/github/latest/docs/resources/team_repository) | resource |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | < 5.0 |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | Name of the repository that is point of module | `string` | n/a | yes |
| <a name="input_repository_description"></a> [repository\_description](#input\_repository\_description) | Description that will be visible on board of projects inside GitHub | `string` | n/a | yes |
| <a name="input_repository_private"></a> [repository\_private](#input\_repository\_private) | Set repository visible outside of organization. (Default: true) | `bool` | `true` | no |
| <a name="input_archived"></a> [archived](#input\_archived) | Set to true to archive repository. (Default: false) | `bool` | `false` | no |
| <a name="input_pull_teams"></a> [pull\_teams](#input\_pull\_teams) | Teams ids that will have read-only access to the repository. | `list(string)` | `[]` | no |
| <a name="input_push_teams"></a> [push\_teams](#input\_push\_teams) | Teams ids that will have read-write access to the repository. | `list(string)` | `[]` | no |
| <a name="input_admin_teams"></a> [admin\_teams](#input\_admin\_teams) | Teams ids that will have admin access over the repository. | `list(string)` | `[]` | no |
| <a name="input_is_template"></a> [is\_template](#input\_is\_template) | If set to true then repository can be used as a template for other repositories | `bool` | `false` | no |
| <a name="input_template"></a> [template](#input\_template) | If passed, then repository will be created from the template. | <pre>object({<br>    owner      = string<br>    repository = string<br>  })</pre> | `null` | no |
| <a name="input_allow_rebase"></a> [allow\_rebase](#input\_allow\_rebase) | Allow developers to modify history of commits. | `bool` | `false` | no |
| <a name="input_license_template"></a> [license\_template](#input\_license\_template) | License template eg: "mit", "mpl-2.0". | `string` | `null` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_repository_name"></a> [repository\_name](#output\_repository\_name) | n/a |

## Examples

### Basic example
```hcl
module "some-repo" {
  source = "git@github.com:masterborn/masterborn-terraform-modules.git//github/default-repository"

  repository_name        = "some-repo"
  repository_description = "Example repo"

  allow_rebase = true

  admin_teams = [module.some-team.admins_id]
  push_teams  = [module.some-team.developers_id]
  pull_teams  = [module.some-team.visitors_id, module.some-team.testers_id]
}
```
<!-- END_OF_AUTO_GENERATED_SECTION -->

## Enabling pre-commit hooks

Following pre-commit hooks are provided:

- [terraform-fmt](https://github.com/antonbabenko/pre-commit-terraform#terraform_fmt) to check syntax of terraform
- [terraform-docs](https://github.com/terraform-docs/terraform-docs) to recreate README.md according to terraform module properties
- [end-of-file-fixer](https://github.com/pre-commit/pre-commit-hooks#end-of-file-fixer) to ensure that each file ends with newline

### Requirements

- [pre-commit](https://pre-commit.com/#installation)

### Installation
To install `pre-commit` check .

```bash
pre-commit install
```
