param acrName string 
param location string =  resourceGroup().location

var petclinicImages = [
  'docker.io/springcommunity/spring-petclinic-cloud-api-gateway:2.5.1'
  'docker.io/springcommunity/spring-petclinic-cloud-visits-service:2.5.1'
  'docker.io/springcommunity/spring-petclinic-cloud-vets-service:2.5.1'
  'docker.io/springcommunity/spring-petclinic-cloud-customers-service:2.5.1'
  'docker.io/springcommunity/spring-petclinic-cloud-admin-server:2.5.1'
  'docker.io/springcommunity/spring-petclinic-cloud-discovery-service:2.5.1'
  'docker.io/springcommunity/spring-petclinic-cloud-config-server:2.5.1'
]

param useLatestDockerImageTag bool = false
var petClinicImagesLatestTags = [for image in petclinicImages: '${replace(image,':2.5.1',':latest')}']

module acrImport 'br/public:deployment-scripts/import-acr:1.0.1' = {
  name: 'testAcrImportSingle'
  params: {
    acrName: acrName
    location: location
    images: useLatestDockerImageTag ? petClinicImagesLatestTags : petclinicImages
  }
}
