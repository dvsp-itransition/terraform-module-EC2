resource "aws_instance" "this" {
  count = length(var.instance_name)
  ami           = element(var.ami, count.index)
  instance_type = element(var.instance_type, count.index)
  key_name      = element(var.key_pair, count.index)
  user_data     = var.user_data
  
  subnet_id              = element(var.subnet_id, count.index)
  vpc_security_group_ids = [element(var.vpc_security_group_ids, count.index)]

  dynamic "root_block_device" {
    for_each = var.root_block_device

    content {
      delete_on_termination = try(root_block_device.value.delete_on_termination, null)
      encrypted             = try(root_block_device.value.encrypted, null)
      iops                  = try(root_block_device.value.iops, null)
      kms_key_id            = lookup(root_block_device.value, "kms_key_id", null)
      volume_size           = try(root_block_device.value.volume_size, null)
      volume_type           = try(root_block_device.value.volume_type, null)
      throughput            = try(root_block_device.value.throughput, null)
      tags                  = try(root_block_device.value.tags, null)
    }
  }

  tags = {
    Name        = "${var.environment}_Instance"
    environment = var.environment
  }
}










