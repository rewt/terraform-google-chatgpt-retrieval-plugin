output "chatgpt_repo" {
  description = "The Artifact Registry repository resource details."
  value = google_artifact_registry_repository.chatgpt_repo
}

output "enabled_services" {
  description = "The services enabled in the project."
  value = google_project_service.wif_api
}

output "github_service_account" {
  description = "The service account used for GitHub."
  value = google_service_account.github-svc
}

output "github_access_iam_binding" {
  description = "The IAM binding for the GitHub service account."
  value = google_project_iam_member.github-access
}

output "gh_oidc" {
  description = "The Workload Identity Federation details."
  value = module.gh_oidc
}