module "secret-manager" {
  source  = "GoogleCloudPlatform/secret-manager/google"
  version = "~> 0.1"
  project_id = var.project_id
secrets = [
  {
    name                     = "GCP_PROJECT_ID"
    automatic_replication    = true
    secret_data              = var.project_id
  },
  {
    name                     = "WIF_PROVIDER"
    automatic_replication    = true
    secret_data              = module.gh_oidc.provider_name
  },
  {
    name                     = "GH_SA"
    automatic_replication    = true
    secret_data              = google_service_account.github-svc.email
  },
  {
    name                     = "REGION"
    automatic_replication    = true
    secret_data              = var.region
  },
  {
    name                     = "ARTIFACT_REGISTRY"
    automatic_replication    = true
    secret_data              = google_artifact_registry_repository.chatgpt_repo.repository_id
  },
  {
    name                     = "IMAGE_NAME"
    automatic_replication    = true
    secret_data              = var.image_name
  }
]

}