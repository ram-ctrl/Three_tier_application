# EC2 Module

This module provisions two EC2 instances for a three-tier application:
- **Frontend Instance:** Hosts the frontend application (e.g., a React app).
- **Backend Instance:** Hosts the backend application (e.g., a Node.js API).

## Usage

Include the module in your root Terraform configuration as follows:

```hcl
module "ec2" {
  source             = "./modules/ec2_module"
  project_name       = "my-3tier-app"
  instance_type      = "t2.micro"
  subnet_id          = "<YOUR_SUBNET_ID>"
  frontend_ami       = "<FRONTEND_AMI_ID>"   # e.g., Amazon Linux 2 AMI
  backend_ami        = "<BACKEND_AMI_ID>"    # e.g., Amazon Linux 2 AMI
  frontend_sg_id     = "<FRONTEND_SECURITY_GROUP_ID>"
  backend_sg_id      = "<BACKEND_SECURITY_GROUP_ID>"
  frontend_repo_url  = "https://github.com/facebook/create-react-app.git"
  backend_repo_url   = "https://github.com/typicode/json-server.git"
}
