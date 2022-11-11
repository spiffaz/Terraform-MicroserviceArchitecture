resource "aws_instance" "database" {
  ami                    = data.aws_ssm_parameter.ubuntu_latest.value
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.private[0].id
  vpc_security_group_ids = [aws_security_group.database.id]
  private_ip             = var.database_private_ip
  key_name               = var.ec2_key_pair
  tags                   = { "Name" = "${var.default_tags.project}-database" }

  user_data = base64encode(templatefile("${path.module}/scripts/database.sh", {
    DATABASE_SERVICE_NAME = var.database_service_name # getting the variables from Terraform into the script
    DATABASE_MESSAGE      = var.database_service_message
  }))

  depends_on = [aws_nat_gateway.nat]
}

resource "aws_instance" "consul_server" {
  count = var.consul_server_count
  ami = data.aws_ssm_parameter.ubuntu_latest.value
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private[count.index].id
  associate_public_ip_address = false
  key_name = var.ec2_key_pair

  vpc_secutiry_group_ids = [aws_security_group.consul_server.id]
  private_ip = local.server_private_ips[count.index]

  iam_instance_profile = aws_iam_instance_profile.consul_instance.profile.name

  tags = {
    "Name" = "${var.default_tags.project}-consul-server"
  }

  user_data = base64encode(templatefile("${path.module}/scripts/server.sh", {
    # come back
  }))

  depends_on = [aws_nat_gateway.nat]
}