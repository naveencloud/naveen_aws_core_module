# Below is the resource to create IGW and NAT Gateway
resource "aws_internet_gateway" "core_igw" {
  vpc_id = aws_vpc.core_vpc.id

  tags = merge(
  map("Name", "${var.environment}-igw-all"),
  map("VPC", aws_vpc.core_vpc.tags.Name),
  var.common_tags,
  map("Classification", "public")
  )
}

resource "aws_eip" "nat_eip" {
  count = length(var.availability_zones)
  vpc   = true
  depends_on = [aws_internet_gateway.core_igw]

  tags = merge( 
    map("Name", "${var.environment}-eip-nat-az${count.index + 1}"),
    map("VPC", aws_vpc.core_vpc.tags.Name),
    var.common_tags,
    map("Classification", "public")
  )
}

resource "aws_nat_gateway" "core_nat" {
  count         = length(var.availability_zones)
  allocation_id = aws_eip.nat_eip.*.id[count.index]
  subnet_id     = aws_subnet.subnet_public.*.id[count.index]
  depends_on    = ["aws_internet_gateway.core_igw"]
}