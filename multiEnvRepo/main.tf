
# resource for creating a repository.

resource "github_repository" "example" {
  name        = var.repository_name
  description = var.repository_description
  

  visibility = "public"
  auto_init  = true

  template {
    owner                = "github"
    repository           = "terraform-template-module"
    include_all_branches = true
  }
}

# resource for repository environment

resource "github_repository_environment" "example" {
  environment_1         = var.repository_development_environment
  environment_2         = var.repository_staging_environment
  environment_3         = var.repository_production_environment
  repository          = github_repository.example.name
  prevent_self_review = true
  #reviewers {
    users = [data.github_user.current.id]
  }
  deployment_branch_policy {
    protected_branches     = true
    custom_branch_policies = false
  }
}

# resource for creating a branch.

resource "github_branch" "development" {
  repository = github_repository.example.name
  branch     = "development"
  depends_on = [github_repository.example]
}

resource "github_branch" "staging" {
  repository = github_repository.example.name
  branch     = "staging"
  depends_on = [github_repository.example]
}

resource "github_branch" "production" {
  repository = github_repository.example.name
  branch     = "production"
  depends_on = [github_repository.example]
}