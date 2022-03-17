// Parameters are input into your ARM Template.
param stackPrefix string
param stackEnvironment string
param stackLocation string

// Variables can be delcared to be leveraged throughout your ARM Template.
var stackName = '${stackPrefix}${stackEnvironment}'

var tags = {
  'stack-name': 'contoso-web-app'
  'stack-environment': stackEnvironment
}

resource appPlan 'Microsoft.Web/serverfarms@2021-03-01' = {
  name: '${stackName}plan'
  location: stackLocation
  tags: tags
}

resource app 'Microsoft.Web/sites@2021-03-01' = {
  name: stackName
  location: stackLocation
  kind: 'app'
  tags: tags
  properties: {
    httpsOnly: true
    serverFarmId: appPlan.id
    siteConfig: {
      netFrameworkVersion: 'v6.0'
      appSettings: [
        {
          name: 'AzureAd:Instance'
          value: environment().authentication.loginEndpoint
        }
        {
          name: 'AzureAd:Domain'
          value: 'dleems.onmicrosoft.com'
        }
        {
          name: 'AzureAd:TenantId'
          value: subscription().tenantId
        }
        {
          name: 'AzureAd:ClientId'
          value: '3d55a300-65cc-4de5-b732-14cd9bf226ad'
        }
        {
          name: 'AzureAd:CallbackPath'
          value: '/signin-oidc'
        }
      ]
    }
  }
}
