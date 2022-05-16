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
      name = "snowflake-terraform-demo"
    }
  }
}

provider "snowflake" {
}

resource "snowflake_database" "raw" {
  name    = "RAW"
  comment = "Database for Snowflake Terraform demo"
}
resource "snowflake_database" "analytics" {
  name    = "ANALYTICS"
  comment = "Database for Snowflake Terraform demo"
}

resource "snowflake_schema" "jaffle_shop_schema" {
  database = snowflake_database.raw.name
  name     = "JAFFLE_SHOP"
  comment  = "Schema for Snowflake Terraform demo"
}
resource "snowflake_schema" "stripe_schema" {
  database = snowflake_database.raw.name
  name     = "STRIPE"
  comment  = "Schema for Snowflake Terraform demo"
}