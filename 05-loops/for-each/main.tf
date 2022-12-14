//resource "aws_instance" "web" {
//  for_each = toset(var.sample)
//  ami           = "ami-0f0d5d950bc2520f0"
//  instance_type = "t3.micro"
//  tags = {
//    Name = each.key
//  }
//}
//
//variable "sample" {
//  default = ["one", "two"]
//}

resource "aws_instance" "web" {
  for_each = var.sample
  ami           = "ami-0f0d5d950bc2520f0"
  instance_type = each.value
  tags = {
    Name = each.key
  }
}

variable "sample" {
  default = {
    one = "t3.micro"
    two = "t3.medium"
  }
}