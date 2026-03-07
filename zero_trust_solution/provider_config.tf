# Configure Google provider.
# In Cloud Shell the project is already set via:
# gcloud config set project <PROJECT_ID>
# Terraform automatically uses that project.

provider "google" {
  region = "us-central1"
  zone   = "us-central1-b"
}