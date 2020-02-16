# Introduction:
Container used to administrate Azure account

## Content:

This docker may content :
- Powershell 7 preview
- Powershell Azure module
- Kubectl v1.17.3 

## Usage:

To use powershell you need to be connected. You need to create a Service Principle Name. You can connect like:


```powershell
> Set-Variable -name ARM_CLIENT_ID -Value "######"

> Set-Variable -name ARM_CLIENT_SECRET -Value "######"

> Set-Variable -name ARM_SUBSCRIPTION_ID -Value "######"

> Set-Variable -name ARM_TENANT_ID -Value "######"

> $passwd= ConvertTo-SecureString -String $ARM_CLIENT_SECRET -AsPlainText -Force

> $Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList  $ARM_CLIENT_ID, $passwd

> Connect-AzAccount -Credential $Credential -Tenant $ARM_TENANT_ID -ServicePrincipal
```

To use Kubectl as default endpoint you can execute:

```Docker
docker run --rm --entrypoint kubectl -it seitosana/azure_administration:tagname 
```
