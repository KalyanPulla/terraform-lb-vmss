az provider register --namespace Microsoft.Insights --wait

to check registration
az provider show --namespace Microsoft.Insights --query "registrationState" -o tsv
