#Below is the Resource to Create RouteTable and Route Entries

resource "aws_default_route_table" "public" {
  default_route_table_id = aws_vpc.core_vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.core_igw.id
  }

  tags = merge(
    map("Name", "${var.environment}-rtb-${var.sub_services_names["public"]}-all"),
    map("VPC", aws_vpc.core_vpc.tags.Name),
    var.common_tags,
    map("Classification", "public")
  )
}

resource "aws_route_table" "private_app" {
  count  = length(var.availability_zones)
  vpc_id = aws_vpc.core_vpc.id
  
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = element(aws_nat_gateway.core_nat.*.id, count.index)
  }

  tags = merge(
    map("Name", "${var.environment}-rtb-${var.sub_services_names["private_app"]}-az${count.index + 1}"),
    map("VPC", aws_vpc.core_vpc.tags.Name),
    var.common_tags,
    map("Classification", "private")
  )
}

resource "aws_route_table" "private_data" {
  count    = length(var.availability_zones)
  vpc_id = aws_vpc.core_vpc.id
  
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = element(aws_nat_gateway.core_nat.*.id, count.index)
  }

  tags = merge(
    map("Name", "${var.environment}-rtb-${var.sub_services_names["private_db"]}-az${count.index + 1}"),
    map("VPC", aws_vpc.core_vpc.tags.Name),
    var.common_tags,
    map("Classification", "private")
  )
}