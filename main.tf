provider "github" {
  token = var.github_token
}

resource "github_repository" "example_repo" {
  name        = "my-repo"
  description = "Repo with automated merging"
  visibility  = "public"
}

resource "github_actions_secret" "github_token" {
  repository      = github_repository.example_repo.name
  secret_name     = "GITHUB_TOKEN"
  plaintext_value = var.github_token
}
