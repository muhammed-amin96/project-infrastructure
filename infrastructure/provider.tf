provider "google" {
  credentials = file("/home/muhmdamin/Downloads/terraformsvc-key.json")

  project = "amin-gcp-project-1"
  region  = "europe-west2"
}