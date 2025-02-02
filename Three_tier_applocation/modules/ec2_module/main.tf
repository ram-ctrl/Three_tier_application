// Provision Frontend EC2 Instance
resource "aws_instance" "frontend" {
  ami                         = var.frontend_ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.frontend_sg_id]
  associate_public_ip_address = true

  user_data = <<-EOF
    #!/bin/bash
    # Update the system
    sudo yum update -y
    # Install Git and Node.js (if not included in the AMI)
    sudo yum install -y git
    # Optional: Install Node.js if needed:
    # curl -sL https://rpm.nodesource.com/setup_14.x | sudo bash -
    # sudo yum install -y nodejs
    # Clone the frontend repository and start the application
    git clone ${var.frontend_repo_url} /home/ec2-user/frontend
    cd /home/ec2-user/frontend
    npm install
    nohup npm start &
  EOF

  tags = {
    Name = "${var.project_name}-frontend"
  }
}

# Provision Backend EC2 Instance
resource "aws_instance" "backend" {
  ami                         = var.backend_ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.backend_sg_id]
  associate_public_ip_address = true

  user_data = <<-EOF
    #!/bin/bash
    # Update the system
    sudo yum update -y
    # Install Git and Node.js (if not included in the AMI)
    sudo yum install -y git
    # Optional: Install Node.js if needed:
    # curl -sL https://rpm.nodesource.com/setup_14.x | sudo bash -
    # sudo yum install -y nodejs
    # Clone the backend repository and start the application
    git clone ${var.backend_repo_url} /home/ec2-user/backend
    cd /home/ec2-user/backend
    npm install
    nohup npm start &
  EOF

  tags = {
    Name = "${var.project_name}-backend"
  }
}
