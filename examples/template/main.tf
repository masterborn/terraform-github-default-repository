module "some-template-repo" {
  source = "git@github.com:masterborn/terraform-github-default-repository.git?ref={{ provider_version }}"

  repository_name        = "some-template-repo"
  repository_description = "Template repository"

  is_template = true

  admin_teams = [var.developers_devops_id]
  push_teams  = [var.developers_id]
}

module "repository-from-template" {
  source = "git@github.com:masterborn/terraform-github-default-repository.git?ref={{ provider_version }}"

  repository_name        = "repository-from-template"
  repository_description = "Terraform module created from template module"

  template = {
    owner      = "masterborn"
    repository = "some-template-repo"
  }
}
