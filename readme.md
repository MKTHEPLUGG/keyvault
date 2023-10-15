# Documentation for KeyVault Deployment Repository

## Overview
This repository contains Azure Bicep templates and workflows designed to deploy a KeyVault in Azure. 

## Directory Structure
- **templates**: Contains the `main.bicep` file which has the module reference to deploy a KeyVault and 
- **parameters**: Contains the `main_we.bicepparams` file which provides specific parameters to the main template.
- **Actions**: Contains custom GitHub actions for deployment purposes.
- **Workflows**: Contains GitHub workflows that automate validation, deployment, and tagging processes for the repository.

## How to Use

### Bicep Templates

1. **main.bicep**
   - **purpose**: The purpose for the KeyVault deployment.
   - **location**: Azure region where the KeyVault will be deployed.
   - **environment**: Deployment environment (e.g., integration, production).
   - **kvSkuName**: The SKU name for KeyVault. Default is 'standard'.

This main template references the module 'br:eruza123.azurecr.io/bicep/modules/keyvault:v0.1.11' for actual KeyVault deployment.

2. **main_we.bicepparams**
   - It utilizes the main template but provides static parameters specific to westeurope (`we`) location and the integration environment.

### Action

The custom GitHub action named **Azure Bicep Network & NSG Deploy** is designed to:
- Checkout the repository.
- Login to Azure using provided service principal credentials.
- Determine the GitVersion.
- Replace tokens in the Bicep parameters file.
- Copy templates and parameters to an artifact directory.
- Publish the artifacts.
- Adjust directory paths and references.
- Deploy the Bicep template using the Azure CLI.

### Workflow

The **Validate & Deploy** workflow is triggered on push and pull requests to the master branch and also can be manually dispatched.

It sets up certain environment variables like `ENVIRONMENT`, `TEMPLATE_FILE`, `LOCATION`, and `RESOURCE_GROUP`. 

The workflow uses the aforementioned custom action to deploy a KeyVault in Azure using Bicep templates.

## Setup and Deployment

1. **Fork/Clone the Repository**: Start by forking or cloning the repository.

2. **Setup Secrets in GitHub**: Go to your repository settings -> Secrets. Add the following secrets:
   - `AZURE_CLIENT_ID`: Azure Client ID.
   - `AZURE_TENANT_ID`: Azure Tenant ID.
   - `AZURE_SUBSCRIPTION_ID`: Azure Subscription ID.

3. **Run the Workflow**:
   - Either make a push or pull request to the master branch or manually trigger the workflow from the "Actions" tab in GitHub.
   - The workflow will validate the Bicep templates and deploy the KeyVault in the Azure subscription using the provided service principal credentials and parameters.

## Author Information
Michiel Van Haegenborgh

## Note

This is a high-level documentation tailored to the provided files. For a more detailed or step-by-step guide, you might want to consider creating more extensive documentation or how-to guides. Always ensure that any sensitive information is kept secure, and avoid hard-coding any secrets or credentials.