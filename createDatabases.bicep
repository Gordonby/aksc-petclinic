param aksName string
param location string =  resourceGroup().location

module runCmd 'br/public:deployment-scripts/aks-run-command:1.0.1' = {
  name: 'Install-MySQL-databases'
  params: {
    aksName: aksName
    location: location
    rbacRolesNeeded:[
      contributor
      rbacWriter
    ]
    commands: [
      'helm repo add bitnami https://charts.bitnami.com/bitnami;helm repo update'
      'helm install vets-db-mysql bitnami/mysql --namespace spring-petclinic --version 8.8.8 --set auth.database=service_instance_db'
      'helm install visits-db-mysql bitnami/mysql --namespace spring-petclinic  --version 8.8.8 --set auth.database=service_instance_db'
      'helm install customers-db-mysql bitnami/mysql --namespace spring-petclinic  --version 8.8.8 --set auth.database=service_instance_db'
    ]
  }
}
output commandOutput string = runCmd.outputs.commandOutput
