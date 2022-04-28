# AKS-Construction - Spring PetClinic

`status = in-progress (nearly there... 😄)`

## Sample Objective

To deploy a sample of the Petclinic application into the Azure Kubernetes Service all using Bicep. 
Deploying web applications as part of a Bicep deployment is not a production pattern, but is great for producing samples quickly.

## Notable components

### ACR

Rather than use publicly hosted docker images, we will import them into an Azure Container Registry where they can be [scanned by Microsoft Defender](https://docs.microsoft.com/azure/defender-for-cloud/defender-for-containers-introduction?tabs=defender-for-container-arch-aks#scanning-images-in-acr-registries) before being used in Kubernetes.

### AKS

[AKS Construction](https://github.com/Azure/Aks-Construction) is being leveraged to deploy a secure cluster in a simple way.

## PetClinic - helm chart

A simple helm chart for the PetClinic application has been created, read more about it [here](spring-petclinic-cloud-chart/README.md).

## The bicep

Bicep File | Description
---------- | -----------
main.bicep | Orchestrates creation of all resources
aks-construction/main.bicep | Creates AKS and associated infrastructure components
importImages.bicep | Imports container images into ACR from DockerHub
createDatabase.bicep | Installs the MySql databases via helm charts
installApp.bicep | Installs the Petclinic helm chart 

## Lets deploy it!

The Azure CLI is the only prerequisite. If you deploy from the Azure CloudShell then this makes the process even simpler.

```bash
az group create -n aks-petclinic -l eastus
az deployment group create -g aks-petclinic -f main.bicep
```

## The Result

## Deployed Resources

![deployments](azDeployment.png)

![acr](acrRepositories.png)

## The Kubernetes Application

```bash
az aks get-credentials -n aks-petclinic -g aks-petclinic
kubectl get po -n spring-petclinic
```

## Deployment Troubleshooting/Notes

Issue | Error | Impact  | Summary
----- | ----- | ------- | ------
Wavefront | Error: secret "wavefront" not found |  This is an optional step to make use of VMWare Tanzu Observability. | Ideally we need to enhance helm chart to make wavefront install conditional. Additionally we can look to enable Azure Application Insights as a further option.

## Repo Notes

This repo uses git submodules. The following commands were run to clone the respective repositories at a point in time.
This was done rather than forking as
- This project will not be contributing back to the Petclinic sample
- Submodules captures the repo at a point in time, which is good for our sample. We can fetch latest and test as this sample is periodically reviewed.

```bash
git submodule add https://github.com/Azure/AKS-Construction.git aks-construction
git submodule add https://github.com/spring-petclinic/spring-petclinic-cloud.git spring-petclinic-cloud
```
