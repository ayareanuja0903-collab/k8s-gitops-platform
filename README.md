# 🚀 K8s GitOps Platform (Infrastructure Layer)

## 📌 Overview

This repository provisions a production-ready Kubernetes cluster on AWS using Infrastructure as Code and automation tools.

## 🛠️ Tech Stack

* Terraform (EKS, VPC, EC2)
* Ansible (Node configuration)
* AWS (EKS, IAM, Networking)

## 📂 Structure

* `terraform/` → Infrastructure provisioning
* `ansible/` → Kubernetes node setup and configuration

## ⚙️ Workflow

1. Terraform creates EKS cluster and networking
2. Ansible configures worker nodes
3. Kubernetes cluster becomes ready for deployments

## ✅ Outcome

* Fully automated Kubernetes cluster setup
* Scalable and reproducible infrastructure
* Ready for GitOps deployment via ArgoCD

## ⚠️ Challenges

* IAM permission issues → Fixed with proper role policies
* Node join failures → Resolved using kubeadm token fix
* SSH connectivity → Fixed inventory and key permissions

## 🚀 Future Improvements

* Add Cluster Autoscaler
* Integrate CI/CD pipeline
* Add security best practices (IRSA, RBAC)
