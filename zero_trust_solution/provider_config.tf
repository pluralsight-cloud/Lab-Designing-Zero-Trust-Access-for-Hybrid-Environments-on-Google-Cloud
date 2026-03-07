data "google_client_config" "current" {}

provider "google" {
  project = data.google_client_config.current.project
  region  = "us-central1"
  zone    = "us-central1-b"
}