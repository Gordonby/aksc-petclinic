param aksName string
param location string =  resourceGroup().location

module runCmd 'br/public:deployment-scripts/aks-run-command:1.0.1' = {
  name: 'InstallPetClinicHelm'
  params: {
    aksName: aksName
    location: location
    rbacRolesNeeded:[
      contributor
      rbacWriter
    ]
    commands: [
      'helm install petapp . -n spring-petclinic --create-namespace'
    ]
  }
}
output commandOutput string = runCmd.outputs.commandOutput
