# Introduction
This is part of a demo series on DevOps. In this project, we are focused on bicep.

# Steps
We have created a bicep file and we are ready to deploy. Let's launch CloudShell and clone this repo there.

1. Create resource group with the following command ``` az group create --name bicep-demo --location centralus ``` 
2. Configure your clientId and domain vairables ``` $clientId="<Client Id>"; $domain="<Domain>" ```
3. Next, let's deploy this into the resource group ``` az deployment group create -n deploy-1 -g bicep-demo --template-file deploy.bicep --parameters stackPrefix=mydemoapp1 stackEnvironment=dev clientId=$clientId domain=$domain ```
