# 📦 Reminder App – Infrastructure & CI/CD Deployment

## 📚 Overview

This project provisions a full-stack **Reminder App** on AWS using **Terraform**, **Jenkins**, **Docker**, and **PostgreSQL RDS**, with **CI/CD**, **monitoring**, and **logging** enabled.

---
## 🚀 How to Set Up and Run the Infrastructure

### ✅ Prerequisites

- AWS CLI configured (`aws configure`)
- Terraform installed (`>=1.3`)
- Docker installed
- Jenkins server (local or EC2)
- GitHub repository with app code and Jenkinsfile

### 📁 Folder Structure
├── app/
│ ├── backend/ # Node.js backend (Dockerized)
│ └── frontend/ # (optional)
├── terraform/ # Infrastructure as Code (VPC, EC2, RDS, etc.)
├── jenkins/ # Jenkins pipeline config
├── scripts/ # Deployment scripts
├── docker-compose.yml
└── README.md

Commands used

1. **Clone the Repo**
   ```bash
   git clone https://github.com/your/repo.git
   cd terraform/

2. **Initialize Terraform**
   terraform init
3. **Apply Infrastructure**
   terraform apply
4. **Configure Jenkins**
   Install required plugins (see below)
   Add AWS and GitHub credentials
   Set up a pipeline job that uses your Jenkinsfile
5. **Trigger Pipeline**
   On merge to main, Jenkins:
   Runs tests
   Builds & pushes Docker image to ECR
   Deploys to EC2 via SSH script

 **Architecture Decisions**
   **Terraform**: Used for repeatable infrastructure provisioning.
   **Modular Design**: VPC, EC2, RDS defined as reusable modules.
   **Public/Private Subnets**:
      EC2 App in private subnet behind Load Balancer.
      Jenkins in public subnet for GitHub & ECR access.
   **Jenkins CI/CD**: Automates testing, Docker builds, and deployment.
   **Prometheus + Grafana**: Used for real-time monitoring.
   **CloudWatch**: For infrastructure and log metrics.
   
**Security Considerations**
  **IAM Roles**: Least-privilege IAM roles for Jenkins, EC2, and RDS.
  **Secrets Management**:
    App uses .env with secrets injected via Jenkins credentials.
    AWS Secrets Manager suggested for production.
**Network Security**:
   RDS only accessible from EC2 (no public access).
   Security Groups restrict ports (e.g., only 80, 443 for ALB).
**Data Encryption**:
   RDS with storage encryption enabled.
   TLS used in production-grade environments.
**Audit**:
   CloudTrail can be enabled for audit logs.

**Cost Optimization Measures**
**Instance Types**: Uses t3.micro or t2.micro for free-tier eligibility.
**Auto-stop Scripts**:
  Schedule EC2 shutdowns in non-production.
**Terraform State Management**:
  Use remote state (S3 + DynamoDB) to avoid duplicate resource creation.
**Logging Levels**:
  App and monitoring tools configured for essential logs only to reduce CloudWatch cost.
**Reused AMIs**:
  Pre-baked AMIs with monitoring agents reduce provisioning time.   
**Jenkins Required Plugins**
  Docker Pipeline
  GitHub Integration
  AWS Credentials
  Credentials Binding
  Blue Ocean (optional)
  Prometheus Metrics Plugin

   
