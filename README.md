# aksc-petclinic

This repo deploys the Spring Petclinic application onto an Azure Kubernetes Cluster, all using bicep in a single `code-golf` step.

## Aim

To deploy a sample of the Petclinic application into the Azure Kubernetes Service all using Bicep. This is not a real-world pattern, but great for producing samples quickly.

## Notable components

### ACR

Rather than use publicly hosted docker images, we will import them into an Azure Container Registry where they can be scanned by Microsoft Defender before being used in Kubernetes.

## The bicep


## Lets deploy it!

The Azure CLI is the only prerequisite. If you deploy from the Azure CloudShell then this makes the process even simpler.

```bash
az group create -n aks-petclinic -l eastus
az deployment group create -g aks-petclinic -f main.bicep
```

## Repo Notes

This repo uses git submodules. The following commands were run to clone the respective repositories at a point in time.

```bash
git submodule add https://github.com/Azure/AKS-Construction.git aks-construction
git submodule add https://github.com/spring-petclinic/spring-petclinic-cloud.git spring-petclinic-cloud
```
