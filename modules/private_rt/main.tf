resource "aws_route_table" "private" {
  vpc_id = var.vpc_id
tags = {
 Name = var.name
}
}

resource "aws_route" "route" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = var.nat_gw
}

resource "aws_route_table_association" "assoc" {
  subnet_id      = var.subnet_id
  route_table_id = aws_route_table.private.id
}
