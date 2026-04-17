# 🚀 K8s GitOps Platform (Infrastructure Layer)

## 📌 Overview

The Kubernetes GitOps Platform capstone project showcases the design and implementation of a production-grade DevOps ecosystem that automates infrastructure provisioning, cluster configuration, application deployment, and monitoring using industry-standard tools.

This project demonstrates how modern DevOps practices—Infrastructure as Code (IaC), Configuration Management, and GitOps—can be combined to build a scalable, reliable, and fully automated cloud-native platform.


| 🚀 Repository           | 🎯 Purpose                      | 🧩 Key Responsibilities                                                                                                                                                                                      |
| ----------------------- | ------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 🔗 <a href="https://github.com/ayareanuja0903-collab/K8s-GitOps-Platform" rel="noopener noreferrer" style="text-decoration:none; color:#0366d6; font-weight:500;">K8s-GitOps-Platform</a> | Infrastructure & Platform Setup | • Provision Kubernetes cluster using Terraform <br> • Infrastructure (Terraform)        |
|🔗 <a href="https://github.com/ayareanuja0903-collab/k8s-ansible-config" rel="noopener noreferrer" style="text-decoration:none; color:#0366d6; font-weight:500;">k8s-ansible-config </a> | Configuration Automation        | • Automates Kubernetes setup using Ansible <br> • Handles Docker/container runtime installation <br> • Initializes master node & joins worker nodes <br> • Ensures consistent environment setup across nodes |
| 🔗 <a href="https://github.com/ayareanuja0903-collab/k8s-gitops-config" rel="noopener noreferrer" style="text-decoration:none; color:#0366d6; font-weight:500;">k8s-gitops-config</a>   | GitOps Deployment Layer         | • Stores Kubernetes manifests & Helm charts <br> • Managed by ArgoCD for continuous deployment <br> • Includes HPA, RBAC, Ingress, monitoring configs <br> • Enables **automated sync (Git → Cluster)**  <br> • Enables **alert manger Graffana Prometheus**     |

---

## 🛠️ Tech Stack

* Terraform (EKS, VPC, EC2)
* Ansible (Node configuration)
* AWS (EKS, IAM, Networking)

## 📂 Structure

* `terraform/` → Infrastructure provisioning

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
