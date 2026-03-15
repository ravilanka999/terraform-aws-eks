# Terraform AWS EKS Infrastructure

End-to-end AWS EKS infrastructure using modular Terraform — built and deployed via Jenkins pipelines.

## Infrastructure Overview
```
00-vpc/          # VPC, subnets, routing, peering
10-sg/           # Security groups
20-bastion/      # Bastion host for secure access
30-ecr/          # Elastic Container Registry
40-iam/          # IAM roles and policies
60-acm/          # SSL/TLS certificates (ACM)
70-frontend-alb/ # Application Load Balancer
80-eks/          # EKS cluster and node groups
```

## Tech Stack

- **IaC** — Terraform (modular, remote state)
- **Cloud** — AWS (EKS, VPC, IAM, ECR, ALB, ACM, Bastion)
- **CI/CD** — Jenkins (Jenkinsfile per module)
- **State** — S3 remote state + DynamoDB locking

## Features

- ✅ Fully modular — each layer is independent and reusable
- ✅ Jenkins pipeline per module for controlled deployments
- ✅ Remote state with S3 + DynamoDB locking
- ✅ Bastion host for secure cluster access
- ✅ ACM SSL certificates for HTTPS
- ✅ ECR for private container image storage
- ✅ IAM least-privilege access controls

## Deployment Order
```bash
cd 00-vpc        && terraform init && terraform apply
cd 10-sg         && terraform init && terraform apply
cd 20-bastion    && terraform init && terraform apply
cd 30-ecr        && terraform init && terraform apply
cd 40-iam        && terraform init && terraform apply
cd 60-acm        && terraform init && terraform apply
cd 70-frontend-alb && terraform init && terraform apply
cd 80-eks        && terraform init && terraform apply
```

## Prerequisites

- AWS CLI configured
- Terraform >= 1.0
- S3 bucket for remote state
- DynamoDB table for state locking

## Related Repos

- [eks-argocd](https://github.com/ravilanka999/eks-argocd) — GitOps platform on this EKS cluster
- [roboshop-infra-dev](https://github.com/ravilanka999/roboshop-infra-dev) — Full roboshop infrastructure
