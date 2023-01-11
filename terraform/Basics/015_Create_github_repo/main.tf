provider "github" {
  token="xxxxxxxxxxxxxxxxxxxx"
}

resource "github_repository" "terraform-first-repo" {
  name       = "first-repo-from-terraform"
  description = "My First resource for my youtube viewers."
  visibility = "public"
  auto_init  = true
}


resource "github_repository" "terraform-second-repo" {
  name       = "second-repo-from-terraform"
  description = "Another repo"
  visibility = "public"
  auto_init  = true
}


output "terraform-repo-url" {
  value = github_repository.terraform-first-repo.html_url
}

output "terraform-repo-name" {
  value = github_repository.terraform-second-repo.name
}

output "terraform-repo-full_name" {
  value = github_repository.terraform-second-repo.full_name
}