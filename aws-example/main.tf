provider "aws" {
  region                      = "us-east-1" # <<<<< Try changing this to eu-west-1 to compare the costs
  skip_credentials_validation = true
  skip_requesting_account_id  = true
}

resource "aws_instance" "web_app" {
  ami           = "ami-674cbc1e"
  instance_type = "t2.micro"              # <<<<< Try changing this to m5.8xlarge to compare the costs

  root_block_device {
    volume_size = 20
  }
}

resource "aws_s3_bucket" "demobucket" {
  bucket = "bucket-infracost-v9"

  tags = {
    Name        = "roxsross"
    Environment = "Dev"
  }
}
