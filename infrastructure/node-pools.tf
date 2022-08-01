resource "google_service_account" "kubernetes" {
  account_id = "kubernetes"
}


resource "google_project_iam_binding" "sa-iam-binding" {  
  role = "roles/storage.admin"
  project = "amin-gcp-project-1"
  members = [
    "serviceAccount:${google_service_account.kubernetes.email}"
  ]
}

resource "google_container_node_pool" "primary-node-pool" {
  name       = "primary-node-pool"
  location   = "europe-west2-a"
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    preemptible  = false
    machine_type = "e2-small"

    service_account = google_service_account.kubernetes.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}