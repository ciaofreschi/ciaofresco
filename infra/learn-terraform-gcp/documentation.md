## What if I have an existing resources already created that I want to preserve?

You can use the Terraform CLI import command. This will associate the existing instance with the resource in your Terraform files.

The exact invocation will depend on your configuration.

terraform import your_resource.name_in_terraform gcp-instance-name
This a useful (albeit AWS focused) article.

terraform import google_sql_database_instance.ciaofresco-db ciaofresco-db
