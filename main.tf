terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
    }
  }

  backend "remote" {
    organization = "Siemens_ratkin"

    workspaces {
      name = "sandbox-tf-snowflake"
    }
  }
}

provider "snowflake" {
}

resource "snowflake_database" "dev_demo_db" {
  name    = "DEV_DEMO_DB_v2"
  comment = "Database for Snowflake Terraform demo"
}

resource "snowflake_schema" "dev_demo_schema" {
  database = snowflake_database.dev_demo_db_v2.name
  name     = "DEMO_SCHEMA"
  comment  = "Schema for Snowflake Terraform demo"
}