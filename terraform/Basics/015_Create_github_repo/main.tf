provider "github" {
  token="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
}

resource "github_repository" "terraform-first-repo" {
  name       = "first-repo-from-terraform"
  description = "My First resource for my youtube viewers."
  visibility = "public"
  auto_init  = true
}


resource "github_repository" "terraform-second-repo" {
  name       = "second-repo-from-terraform"
  description = "My second resource for my youtube viewers."
  visibility = "public"
  auto_init  = true
}