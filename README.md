# Introduction
This is part of a demo series on DevOps. In this project, we are focused on designing a App Service Plan and App Service resources with bicep. We will learn about the concepts of parameters, variables, resource definations and outputs.

# Steps
We have created a bicep file and we are ready to deploy. Let's launch CloudShell and clone this repo there.

1. Create resource group with the following command ``` az group create --name bicep-demo --location centralus ``` 
2. Configure your clientId and domain vairables ``` $clientId="<Client Id>"; $domain="<Domain>;$prefix=<Some prefix value for your resource names>" ```
3. Next, let's deploy this into the resource group ``` az deployment group create -n deploy-1 -g bicep-demo --template-file deploy.bicep --parameters stackPrefix=$prefix stackEnvironment=dev clientId=$clientId domain=$domain ```
