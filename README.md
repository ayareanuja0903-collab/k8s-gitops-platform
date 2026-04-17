# 🚀 K8s GitOps Platform (Infrastructure Layer)

## 📌 Overview

This repository provisions a production-ready Kubernetes cluster on AWS using Infrastructure as Code and automation tools.


| 🚀 Repository           | 🎯 Purpose                      | 🧩 Key Responsibilities                                                                                                                                                                                      |
| ----------------------- | ------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **K8s-GitOps-Platform** | Infrastructure & Platform Setup | • Provision Kubernetes cluster using Terraform <br> • Configure nodes using Ansible <br> • Setup ArgoCD, monitoring stack (Prometheus, Grafana, Alertmanager) <br> • Acts as the **foundation layer**        |
|🔗 <a href="https://github.com/ayareanuja0903-collab/k8s-ansible-config" rel="noopener noreferrer" style="text-decoration:none; color:#0366d6; font-weight:500;">k8s-ansible-config </a> | Configuration Automation        | • Automates Kubernetes setup using Ansible <br> • Handles Docker/container runtime installation <br> • Initializes master node & joins worker nodes <br> • Ensures consistent environment setup across nodes |
| **k8s-gitops-config**   | GitOps Deployment Layer         | • Stores Kubernetes manifests & Helm charts <br> • Managed by ArgoCD for continuous deployment <br> • Includes HPA, RBAC, Ingress, monitoring configs <br> • Enables **automated sync (Git → Cluster)**      |



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
