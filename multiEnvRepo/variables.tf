

variable "github_token" {
    description = "Personal access token from gitHub"
    type        = string
    sensitive   = true
}


variable "repository_name" {
    description = "Name of repo"
    type        = string
    
}

variable "repository_description" {
    type        = string
    sensitive   = true
    description = "This is the description"
    default     = "made with Terraform"
}

variable "repository_environments" {
    type        = list(string)
    description = "List of environments"
    default     = ["development", "staging", "production"]

}

