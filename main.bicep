param nameseed string = 'petclinic'
param location string =  resourceGroup().location

//---------Kubernetes Construction---------
module aksconst 'aks-construction/bicep/main.bicep' = {
  name: 'aksconstruction'
  params: {
    location : location
    resourceName: nameseed
    enable_aad: true
    enableAzureRBAC : true
    registries_sku: 'Standard'
    omsagent: true
    retentionInDays: 30
    agentCount: 2
    JustUseSystemPool: true
  }
}

module acrImages 'importImages.bicep' = {
  name: 'Import-PetClinc-Images'
  params: {
    location: location
    acrName: aksconst.outputs.containerRegistryName
  }
}
