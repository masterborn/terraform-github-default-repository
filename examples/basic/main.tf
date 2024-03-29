module "some-repo" {
  source = "git@github.com:masterborn/terraform-github-default-repository.git?ref={{ provider_version }}"

  repository_name        = "some-repo"
  repository_description = "Example repo"

  allow_rebase = true

  admin_teams = [module.some-team.admins_id]
  push_teams  = [module.some-team.developers_id]
  pull_teams  = [module.some-team.visitors_id, module.some-team.testers_id]
}
