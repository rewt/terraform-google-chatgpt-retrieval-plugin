resource "google_project_service" "artifact_registry_api" {
  service = "artifactregistry.googleapis.com"
  disable_on_destroy = false
}

resource "google_artifact_registry_repository" "chatgpt_repo" {
  location      = var.region
  repository_id = var.repository_id
  description   = "Docker image for chatgpt plugin api"
  format        = "DOCKER"
}