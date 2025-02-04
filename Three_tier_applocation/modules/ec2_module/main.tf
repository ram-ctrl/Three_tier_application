# Frontend EC2
resource "aws_instance" "frontend" {
  ami                         = var.frontend_ami
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.frontend_sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y git nginx
    git clone ${var.frontend_repo_url} /home/ec2-user/frontend
    cd /home/ec2-user/frontend
    npm install
    nohup npm start &

    # Configure Nginx to proxy requests to backend
    cat <<EOT > /etc/nginx/nginx.conf
    events {}
    http {
      server {
        listen 80;
        location /api/ {
          proxy_pass http://${aws_instance.backend.private_ip}:3000/;
        }
      }
    }
    EOT
    sudo systemctl restart nginx
  EOF

  tags = {
    Name = "${var.application_name}-frontend"
  }
}

# Backend EC2 (Private)
resource "aws_instance" "backend" {
  ami                    = var.backend_ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private.id
  security_groups        = [aws_security_group.backend_sg.id]
  key_name               = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              echo "DATABASE_URL=${aws_db_instance.my_database.endpoint}" >> /etc/environment
              echo "DATABASE_USER=${aws_db_instance.my_database.username}" >> /etc/environment
              echo "DATABASE_PASSWORD=${var.database_password}" >> /etc/environment
              EOF

  tags = {
    Name = "${var.application_name}-backend"
  }
}
