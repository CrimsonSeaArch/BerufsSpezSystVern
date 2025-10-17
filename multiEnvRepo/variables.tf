

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

variable "repository_name" {
    description = "Name of repo"
    type        = string
    
}

variable "repository_development_environment" {
    type        = string

}

variable "repository_staging_environment" {
    type        = string

}

variable "repository_production_environment" {
    type        = string

}
