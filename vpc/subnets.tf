resource "aws_subnet" "subnet_public" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.core_vpc.id
  cidr_block        = element(var.subnets_cidrs["public"], count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = merge(
    map("Name", "${var.environment}-sub-${var.sub_services_names["public"]}-az${count.index + 1}"), 
    map("VPC", aws_vpc.core_vpc.tags.Name),
    var.common_tags,
    map("Classification", "public")
  )
}

resource "aws_subnet" "subnet_private_app" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.core_vpc.id
  cidr_block        = element(var.subnets_cidrs["private_app"], count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = merge( 
    map("Name", "${var.environment}-sub-${var.sub_services_names["private_app"]}-az${count.index + 1}"), 
    map("VPC", aws_vpc.core_vpc.tags.Name),
    var.common_tags,
    map("Classification", "private")
  )
}

resource "aws_subnet" "subnet_private_db" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.core_vpc.id
  cidr_block        = element(var.subnets_cidrs["private_db"], count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = merge( 
    map("Name", "${var.environment}-sub-${var.sub_services_names["private_db"]}-az${count.index + 1}"),
    map("VPC", aws_vpc.core_vpc.tags.Name),
    var.common_tags,
    map("Classification", "private")
  )
}