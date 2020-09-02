# Below are the list of variable for CLOUDMAP resource

variable "rds_name" {
  description = "RDS DB Instance Name"
  default = ""
}

variable "rds_parameter_group_family" {
  description = "RDS Parameter group family details"
}

variable "rds_encryption" {
  description = "RDS DB Engine Encryption option"
  type = bool
}

variable "rds_db_engine" {
  description = "RDS DB Engine details"
  default = ""
}

variable "rds_allocated_storage" {
  description = "Allocated database size for SonarQube (in Gb)"
}

variable "rds_storage_type" {
  description = "RDS storage type"
  default     = ""
}
variable "rds_engine_version" {
  description = "mysql version of RDS instance"
  default     = ""
}
variable "rds_instance_class" {
  description = "RDS Instance class"
}

variable "rds_snapshot_identifier" {
  description = "RDS Snapshot identifier to create DB instance"
}

variable "rds_backup_retention_days" {
  description = "The amount of time in days that the database snapshots will be retained for"
  default     = 7
}

variable "rds_multi_az" {
  description = "RDS DB Instance Multi-AZ configuration"
}

variable "rds_db_subnet_ids" {
  description = "RDS DB Instance Subnet IDS to create Group"
}

variable "vpc_id" {
  description = "RDS DB Instance SG creation VPC Creation details"
}

variable "environment" {
  description = "Environment tag details"
}

