
output "repository_name" {
    value = github_repository.main.name
}

output "github_branch" {
    value = [for branch in github_branch.env_branches : branch.branch]
    description = "List of all created branch names"
}