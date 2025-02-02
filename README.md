# Three_tier_application
🚀 Project Overview
This project consists of a React frontend and a Node.js backend, deployed securely using AWS services. The CI/CD pipeline is fully automated and ensures security compliance before deployment.

🔹 Frontend: A React web application serving static content.
🔹 Backend: A Node.js API providing data processing functionality.
🔹 CI/CD Pipeline: Uses AWS CodePipeline, CodeBuild, and CodeDeploy for deployment automation.
🔹 Security Scanning: Integrated SonarQube, Cycode, and Snyk to ensure no exposed credentials or vulnerable code is deployed.

## Project Structure

📦 three_tier_application
├── 📁 terraform/               # Terraform infrastructure as code
│   ├── 📄 main.tf              # Main provider and backend configuration for Terraform
│   ├── 📄 variables.tf         # Define variables for your resources
│   ├── 📄 outputs.tf           # Output values like instance IP, VPC IDs, etc.
│   ├── 📄 terraform.tfvars     # Variable values for different environments (dev, prod)
│   ├── 📁 modules/             # Contains sub-modules for each piece of infrastructure
│   │   ├── 📁 vpc_module/      # VPC, subnets, and networking components
│   │   │   ├── 📄 main.tf      # VPC, subnets, and routing configuration
│   │   │   ├── 📄 variables.tf # Variables specific to VPC (CIDR blocks, etc.)
│   │   │   ├── 📄 outputs.tf   # VPC-related output (VPC ID, subnet IDs, etc.)
│   │   │   ├── 📄 README.md    # Module usage and instructions
│   │   ├── 📁 ec2_module/      # EC2 instances configuration (frontend, backend)
│   │   │   ├── 📄 main.tf      # EC2 provisioning for frontend and backend
│   │   │   ├── 📄 variables.tf # EC2 variables (instance type, AMI, etc.)
│   │   │   ├── 📄 outputs.tf   # EC2 output (public IP, instance ID, etc.)
│   │   │   ├── 📄 README.md    # Module usage and instructions
│   │   ├── 📁 rds_module/      # RDS instance configuration
│   │   │   ├── 📄 main.tf      # RDS database provisioning (Postgres/MySQL)
│   │   │   ├── 📄 variables.tf # RDS variables (DB instance size, engine, etc.)
│   │   │   ├── 📄 outputs.tf   # RDS output (DB endpoint, DB name, etc.)
│   │   │   ├── 📄 README.md    # Module usage and instructions
│   │   ├── 📁 iam_module/      # IAM roles, policies for EC2, CodePipeline, etc.
│   │   │   ├── 📄 main.tf      # IAM roles and policies for your resources
│   │   │   ├── 📄 variables.tf # IAM-specific variables (role names, permissions, etc.)
│   │   │   ├── 📄 README.md    # IAM module usage and instructions
│
├── 📁 ci_cd_pipeline/          # CI/CD pipeline resources for deployment automation
│   ├── 📄 aws_codepipeline.tf  # CodePipeline configuration (source, build, deploy stages)
│   ├── 📄 aws_codedeploy.tf    # CodeDeploy configuration for deployment group
│   ├── 📄 aws_codebuild.tf     # CodeBuild configuration to build frontend/backend apps
│   ├── 📄 variables.tf         # CI/CD-specific variables (GitHub repo, etc.)
│   ├── 📄 buildspec_frontend.yml # Optional: Buildspec for frontend
│   ├── 📄 buildspec_backend.yml  # Optional: Buildspec for backend
│   ├── 📄 README.md            # CI/CD pipeline setup and instructions
│
├── 📁 frontend/                # Frontend React app source code and deployment details
│   ├── 📁 src/                 # React source code (components, assets, etc.)
│   ├── 📁 public/              # Public assets (index.html, etc.)
│   ├── 📄 package.json         # React project dependencies
│   ├── 📄 buildspec.yml        # Optional: Buildspec for frontend build in CodeBuild
│   ├── 📄 README.md            # Frontend setup and instructions
│
├── 📁 backend/                 # Backend Node.js API source code and deployment details
│   ├── 📁 src/                 # Node.js backend code (app.js, routes, etc.)
│   ├── 📄 package.json         # Node.js project dependencies
│   ├── 📄 buildspec.yml        # Optional: Buildspec for backend build in CodeBuild
│   ├── 📄 README.md            # Backend setup and instructions
│
└── 📄 README.md                # Project root readme with general setup and instructions
```

## Overview
This project is a **full-stack web application** deployed using **AWS services** and **Terraform**. It includes a **React frontend**, **Node.js backend**, and infrastructure managed via Terraform. The deployment pipeline is automated with **AWS CodePipeline, CodeBuild, and CodeDeploy**.

### **Infrastructure Components**
- **VPC Module**: Manages the networking setup, including subnets and security groups.
- **EC2 Module**: Provisions frontend and backend servers with appropriate IAM roles.
- **RDS Module**: Creates and secures an AWS RDS database (PostgreSQL/MySQL).
- **IAM Module**: Configures permissions and access control for the infrastructure.

### **CI/CD Pipeline**
- **AWS CodePipeline**: Automates the deployment process from GitHub to AWS.
- **AWS CodeBuild**: Builds both frontend and backend applications.
- **AWS CodeDeploy**: Handles automatic deployment to EC2 instances.

### **Frontend (React)**
- Developed using React with state management and API integration.
- Hosted on **Amazon S3 + CloudFront** for fast delivery.

### **Backend (Node.js + Express)**
- RESTful API handling authentication, database operations, and business logic.
- Deployed on **AWS EC2 instances** with an **Nginx reverse proxy**.

### **Security & Best Practices**
- **IAM policies** enforce the principle of least privilege.
- **Terraform remote backend** ensures state consistency.
- **RDS security groups** restrict access to only backend instances.
- **SSL termination** via **AWS ALB** (Application Load Balancer).

### **Setup & Deployment**
1. **Clone the repository**
   ```sh
   git clone https://github.com/your-repo/my-fullstack-app.git
   cd my-fullstack-app
   ```
2. **Initialize Terraform & Apply Infrastructure**
   ```sh
   cd terraform
   terraform init
   terraform apply -auto-approve
   ```
3. **Deploy via CI/CD Pipeline**
   - Push changes to GitHub to trigger **AWS CodePipeline**.
   - Build and deploy using **AWS CodeBuild** and **AWS CodeDeploy**.

## Contribution Guidelines
- Fork the repository and create a feature branch.
- Follow the **Git flow strategy** (feature -> develop -> main).
- Submit a **pull request** with a clear description of changes.

AWS Architecture Diagram
                  +-------------------------+
                  |        GitHub Repo       |
                  +------------+------------+
                               |
                  +------------v------------+
                  |      AWS CodePipeline    |
                  +------------+------------+
                               |
           +------------------+------------------+
           |                                     |
  +--------v--------+                  +--------v--------+
  |  AWS CodeBuild  |                  |  AWS CodeBuild  |
  |  (Frontend)     |                  |  (Backend)      |
  +--------+--------+                  +--------+--------+
           |                                     |
  +--------v--------+                  +--------v--------+
  |  Security Scan  |                  |  Security Scan  |
  | (SonarQube,     |                  | (SonarQube,     |
  |  Cycode, Snyk)  |                  |  Cycode, Snyk)  |
  +--------+--------+                  +--------+--------+
           |                                     |
  +--------v--------+                  +--------v--------+
  |   S3 Artifacts  |                  |   S3 Artifacts  |
  +--------+--------+                  +--------+--------+
           |                                     |
  +--------v--------+                  +--------v--------+
  | AWS CodeDeploy  |                  | AWS CodeDeploy  |
  | (EC2 Instances) |                  | (EC2 Instances)|
  +-----------------+                  +-----------------+

 Fail Deployment If:
🚫 Credentials or sensitive information are found.
🚫 API endpoints are exposed in the backend.
🚫 High-severity security vulnerabilities exist in the code.

Security Measures in Pipeline
✅ Static Code Analysis with SonarQube
✅ Vulnerability Scanning with Snyk & Cycode
✅ Build Fails if Secrets/Exposed APIs are Found
✅ Security Compliance Checks Before Deployment

Tech Stack
Frontend: React, NGINX, AWS EC2
Backend: Node.js, Express, AWS EC2 
Database: Amazon RDS (PostgreSQL/MySQL)
CI/CD: AWS CodePipeline, CodeBuild, CodeDeploy
Infrastructure: Terraform, AWS VPC, IAM

Issues with This Approach

This setup works, but there are some downsides:

Frontend on EC2 is not ideal

Running React on an EC2 instance with npm start is not scalable or optimized.
Instead, we should build the frontend (npm run build) and serve it via NGINX or Apache.
A better alternative is S3 + CloudFront for static file hosting.
No Load Balancing for High Availability

If the frontend or backend EC2 instance goes down, the app will be inaccessible.
We should use an Application Load Balancer (ALB) for the backend to ensure reliability.
No Auto-Scaling

This setup does not scale automatically if traffic increases.
We should use an Auto Scaling Group (ASG) to launch additional EC2 instances as needed
