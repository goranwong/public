# Read local state file from network (network)
data "terraform_remote_state" "network" {
  backend = "local"
  config = {
    path = "../01-network/terraform.tfstate"
  }
}

module "mysql_db" {
  source  = "terraform-google-modules/sql-db/google//modules/mysql"
  version = "~> 28.3"

  name                 = "griffin-dev-db"
  random_instance_name = false
  database_version     = "MYSQL_5_7"
  project_id           = var.project_id
  zone                 = var.zone
  region               = var.region
  tier                 = "db-n1-standard-1"

  db_name       = "wordpress"
  user_name     = "wp_user"
  user_password = "stormwind_rules"
  user_host     = "%"

  ip_configuration = {
    ipv4_enabled        = true
    authorized_networks = []
  }

#  ip_configuration = {
#    ipv4_enabled        = true
#  
#    # Authorized Networks configuration
#     authorized_networks = [
#       {
#         name  = "allow-all"
#         value = "0.0.0.0/0"
#       }
#     ]
#  }
}

