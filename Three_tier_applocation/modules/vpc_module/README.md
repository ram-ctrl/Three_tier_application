# VPC Module

This module creates a Virtual Private Cloud (VPC) with:
- A public subnet (with an Internet Gateway and a route table for outbound traffic)
- A private subnet

## Usage

```hcl
module "vpc" {
  source              = "./modules/vpc_module"
  project_name        = "my-3tier-app"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
  availability_zone   = "us-east-1a"
}

### **Explanation of `README.md`:**

- **Overview**: Describes what the module does.
- **Usage Example**: Shows how to integrate the module into a root Terraform configuration.
- **Outputs**: Lists and explains the outputs provided by the module.

---

## **Flow Summary**

1. **Variables Setup**:  
   - The `variables.tf` file defines what inputs (e.g., CIDR blocks, project name) the module requires.

2. **Resource Creation in `main.tf`**:  
   - The VPC is created using the provided CIDR.
   - Public and private subnets are created within the VPC.
   - An Internet Gateway is attached to the VPC.
   - A public route table is created and associated with the public subnet to allow Internet access.

3. **Outputs in `outputs.tf`**:  
   - Important IDs (VPC, subnets, Internet Gateway) are output so they can be used by other modules or the root configuration.

This modular approach allows you to easily plug this VPC configuration into your overall Terraform project, keeping your code organized, reusable, and maintainable.


