# Grant the current user permission to access the VM via IAP

data "google_client_openid_userinfo" "me" {}

resource "google_project_iam_member" "iap_access" {

  project = data.google_client_config.current.project
  role    = "roles/iap.tunnelResourceAccessor"

  member = "user:${data.google_client_openid_userinfo.me.email}"

}