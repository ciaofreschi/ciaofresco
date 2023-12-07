# This is an error that I'm getting even tough I've configured the service account with the right permissions

#  Initializing the backend...
# ╷
# │ Error: Error inspecting states in the "local" backend:
# │     querying Cloud Storage failed: googleapi: Error 403: sa-terraform@ciaofresco.iam.gserviceaccount.com does not have storage.objects.list access to the Google Cloud Storage bucket. Permission 'storage.objects.list' denied on resource (or it may not exist)., forbidden
# │ 
# │ Prior to changing backends, Terraform inspects the source and destination
# │ states to determine what kind of migration steps need to be taken, if any.
# │ Terraform failed to load the states. The data in both the source and the
# │ destination remain unmodified. Please resolve the above error and try again.
# │ 
# terraform {
#  backend "gcs" {
#    bucket  = "terraform-state"
#    prefix  = "terraform/state"
#  }
# }