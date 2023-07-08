resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}


# enable project services
resource "google_project_service" "wif_api" {
  for_each = toset([
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "iamcredentials.googleapis.com",
    "sts.googleapis.com",
  ])

  service            = each.value
  disable_on_destroy = false
}

# Service account associated with workload identity pool
resource "google_service_account" "github-svc" {
  project      = var.project_id
  account_id   = var.account_id
  display_name = var.display_name
}

resource "google_project_iam_member" "github-access" {
  project = var.project_id
  role    = var.role
  member  = "serviceAccount:${google_service_account.github-svc.email}"
}

# create workload id pool and provider
module "gh_oidc" {
  source            = "terraform-google-modules/github-actions-runners/google//modules/gh-oidc"
  version           = "v3.1.1"

  project_id        = var.project_id
  pool_id           = format("%s-%s", var.pool_id, random_string.suffix.id)
  pool_display_name = var.pool_display_name
  provider_id       = var.provider_id
  sa_mapping = {
    (google_service_account.github-svc.account_id) = {
      sa_name   = google_service_account.github-svc.name
      attribute = "*"
    }
  }
}