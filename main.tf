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
  name    = "DEV_DEMO_DB"
  comment = "Database for Snowflake Terraform demo"
}