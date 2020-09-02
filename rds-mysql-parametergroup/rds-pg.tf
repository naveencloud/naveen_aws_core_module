
resource "aws_db_parameter_group" "core_rds_db_pg" {
  name   = "${var.rds_name}-mysql"
  family = var.rds_parameter_group_family

  parameter {
    name  = "character_set_server"
    value = "utf8"
  }

  parameter {
    name  = "character_set_client"
    value = "utf8"
  }
}
