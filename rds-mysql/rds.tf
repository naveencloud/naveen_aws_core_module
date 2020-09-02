# Below resource to create RDS MYSQL

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

resource "aws_db_instance" "core_rds_db" {
  allocated_storage         = var.rds_allocated_storage
  storage_type              = var.rds_storage_type
  storage_encrypted         = var.rds_encryption
  engine                    = var.rds_db_engine
  engine_version            = var.rds_engine_version
  instance_class            = var.rds_instance_class
  name                      = var.rds_name
  identifier                = var.rds_name
  parameter_group_name      = aws_db_parameter_group.core_rds_db_pg.id
  vpc_security_group_ids    = [ aws_security_group.core_rds_security_group.id ]
  skip_final_snapshot       = "true"
  backup_retention_period   = var.rds_backup_retention_days
  multi_az                  = var.rds_multi_az
  db_subnet_group_name      = aws_db_subnet_group.core_rds_subnetgroup.id

  tags = {
    Name = var.rds_name
    Environment = var.environment
  }
 lifecycle {
    prevent_destroy = true
  }
}

resource "aws_db_subnet_group" "core_rds_subnetgroup" {
  name        = "${var.rds_name}-subnet-group"
  description = "RDS subnet group"
  subnet_ids  = var.rds_db_subnet_ids
}

#Security Group for RDS DB
resource "aws_security_group" "core_rds_security_group" {
  name        = "${var.rds_name}-sg"
  description = "${var.rds_name}-rds-sg"
  vpc_id      = var.vpc_id
  tags = {
    Name = "${var.rds_name}-rds-sg"
    Environment = var.environment
    Unitname = var.unit_name
  }
}