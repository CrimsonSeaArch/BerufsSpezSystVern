
# resource for creating a repository.

resource "github_repository" "main" {
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



# resource for creating a branch with environment

resource "github_branch" "env_branches" {
  for_each   = toset(var.repository_environments)
  repository = github_repository.main.name
  branch     = each.key
  depends_on = [github_repository.main]
}
