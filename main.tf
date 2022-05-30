resource "github_repository" "default" {
  name         = var.repository_name
  description  = var.repository_description
  homepage_url = var.homepage_url

  visibility = var.repository_private == true ? "private" : "public"

  has_issues           = var.has_issues
  has_projects         = var.has_projects
  has_wiki             = var.has_wiki
  vulnerability_alerts = var.vulnerability_alerts

  delete_branch_on_merge = true

  allow_merge_commit = true
  allow_squash_merge = true
  allow_rebase_merge = var.allow_rebase

  archived = var.archived

  is_template = var.is_template
  dynamic "template" {
    for_each = var.template != null ? [{}] : []
    content {
      owner      = var.template.owner
      repository = var.template.repository
    }
  }

  license_template = var.license_template
}

resource "github_team_repository" "pull" {
  count = length(var.pull_teams)

  team_id    = var.pull_teams[count.index]
  repository = github_repository.default.name
  permission = "pull"
}

resource "github_team_repository" "push" {
  count = length(var.push_teams)

  team_id    = var.push_teams[count.index]
  repository = github_repository.default.name
  permission = "push"
}

resource "github_team_repository" "admin" {
  count = length(var.admin_teams)

  team_id    = var.admin_teams[count.index]
  repository = github_repository.default.name
  permission = "admin"
}
