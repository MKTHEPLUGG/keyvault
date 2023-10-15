param purpose string
param location string
param environment string
param kvSkuName string = 'standard' // default to standard if not provided

// The version number in the module path should be updated to the version you want to use.
module myKeyVault 'br:eruza123.azurecr.io/bicep/modules/keyvault:v0.1.10' = {
  name: 'keyVaultDeploy'
  params: {
    purpose: purpose
    location: location
    environment: environment
    kvSkuName: kvSkuName
  }
}
