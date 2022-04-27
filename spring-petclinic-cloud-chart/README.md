# Helm chart

This is a pretty rough approach to cutting a helm chart for the PetClinic app.

## Approach

Most of the Kubernetes manifest files have just been moved into the correct Helm folder structure and 'clever' parts of the helm language have not been employed. The objective was simply to allow the repository to be changed in a better way than using SED and to package all the manifests up more easily.