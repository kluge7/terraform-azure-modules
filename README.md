# OperaTerra AS - Azure Infrastructure Project

## Overview

This project provisions a scalable, secure, and reusable Azure infrastructure using Terraform. It consists of several modules to manage key Azure resources. The goal is to make the infrastructure easily deployable and customizable for multiple clients.

## Purpose of Each Module

### 1. **Network Module**
- Provisions an Azure Virtual Network (VNET), Subnet, and associates a Network Security Group (NSG) to protect the network traffic.
- **Resources Created**: 
  - Virtual Network
  - Subnet
  - Network Security Group (NSG)

### 2. **Storage Account Module**
- Creates an Azure Storage Account and an associated container.
- **Resources Created**: 
  - Storage Account
  - Storage Container

### 3. **Virtual Machine Module**
- Provisions an Azure Linux Virtual Machine and connects it to the VNET.
- **Resources Created**:
  - Linux Virtual Machine
  - Network Interface (NIC)
  - VM Disk

### 4. **Key Vault Module**
- Provisions an Azure Key Vault and stores sensitive secrets, including the Virtual Machine credentials and Storage Account Access Keys.
- **Resources Created**:
  - Azure Key Vault
  - Key Vault Secrets (VM credentials, Storage Account Access Key)

## Pre-requisites

Before using this Terraform configuration, ensure you have the following:

1. **Azure Subscription**: You need a valid Azure subscription to provision resources.
2. **Azure CLI**: Install the [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) and ensure you are authenticated using:
```bash
az login
```
3. **Terraform CLI**: Install the [Terraform CLI]()
4. **Service Principal (Optional)**: If automating, create an Azure service principal and configure it in your environment:
```bash
az ad sp create-for-rbac --name terraform --role Contributor
```

## How to use the Terraform scripts
1. **Configure Variables**: Create/Edit the terraform.tfvars file with your specific values.
2. **Initialize Terraform**: Run the following command to initialize the working directory that contains the configuration files:
```bash
terraform init
```
3. **Plan the Infrastructure**: Use the terraform plan command to preview the infrastructure changes and verify if the configuration is correct:
```bash
terraform plan -out="main.tfplan" 
```
4. **Apply the Changes**: Once you're satisfied with the plan, apply the changes to create the resources in Azure:
```bash
terraform apply "main.tfplan" 
```
5. **Destroy the Infrastructure**: If you want to tear down the infrastructure created by this configuration, use the following command:
```bash
terraform destroy
```