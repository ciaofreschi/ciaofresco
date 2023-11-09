# Database connection

In order to connect to a Cloud SQL Database [Cloud SQL Auth Proxy](https://cloud.google.com/sql/docs/mysql/sql-proxy)

```gcloud sql instances describe ciaofresco-db --format='value(connectionName)'```

It should output something like

```ciaofresco:europe-west1:ciaofresco-db```

./cloud-sql-proxy ciaofresco:europe-west1:ciaofresco-db

And we can connect with localhost