provider "aws" {

    region = "us-east-1"
  
}

resource "aws_instance" "exampleec2" {
  instance_type = "t2.micro"
  ami = "ami-06b21ccaeff8cd686"
  tags = {
    Name = "ExampleEc2"
  }
}