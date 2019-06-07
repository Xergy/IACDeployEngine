<#
    .SYNOPSIS
        Configuration data file for Dev environment
#>

Write-Host "Loading Configuration Data..."

$Deployments= @( <#
    @{
        ResourceGroupName = "F5-RG"
        TemplateFilePath = "D:\F5Deployment\InfraAsCodeF5Deployment\ArmTemplates\F5ClusteredDeploymentMock.json"
        DeploymentName = "F5ClusteredDeployment-Prod"
        Subscription = "ed347077-d367-4401-af11-a87b73bbae0e"
        Parameters = @{
            adminUsername = 'azureuser' 
            authenticationType = "password" 
            adminPasswordOrKey = Get-KeyVaultSecret -Subscription "ed347077-d367-4401-af11-a87b73bbae0e" -VaultName "Agile-KV" -SecretName "F5-Prod-azureuser"
            dnsLabel = "f5deployment" 
            instanceName = "f5instance"
            instanceType = "Standard_DS3_v2"
            imageName = "Best"
            bigIpVersion = "latest"
            numberOfAdditionalNics = 0            
            additionalNicLocation = "OPTIONAL"
            numberOfExternalIps = 0
            vnetName = "f5vnet"
            vnetResourceGroupName = "F5-RG"
            mgmtSubnetName = "Subnet01"
            mgmtIpAddressRangeStart = "10.10.10.10"
            externalSubnetName = "Subnet02"
            externalIpSelfAddressRangeStart = "10.10.11.10"
            externalIpAddressRangeStart = "10.10.11.20"
            internalSubnetName = "Subnet03"
            internalIpAddressRangeStart = "10.10.12.10"
            tenantId = "8a09f2d7-8415-4296-92b2-80bb4666c5fc"
            clientId = "cd37dfd4-dd8b-44ea-9e6c-df82cf9909dd"
            servicePrincipalSecret = Get-KeyVaultSecret -Subscription "ed347077-d367-4401-af11-a87b73bbae0e" -VaultName "Agile-KV" -SecretName "F5-Prod-cd37dfd4-dd8b-44ea-9e6c-df82cf9909dd"
            managedRoutes = "NOT_SPECIFIED"
            ntpServer = "0.pool.ntp.org"
            timeZone = "UTC"
            customImage = "OPTIONAL"
            allowUsageAnalytics = "Yes"
            LicenseKey1 = "ZTECY-DTPOL-RMODU-OAQBB-AXCGZCM"
            LicenseKey2 = "YQCDX-TPUYU-MODOA-HBGOH-MMTVSMP"
            tagValues = @{Environment = "PROD"}
            restrictedSrcAddress = "*"
        }
    },
    @{
        ResourceGroupName = "F5-RG"
        TemplateFilePath = "D:\F5Deployment\InfraAsCodeF5Deployment\ArmTemplates\F5ClusteredDeploymentMock.json"
        DeploymentName = "F5ClusteredDeployment-Dev"
        Subscription = "dd1f0073-4e57-4d48-b9ce-0a9ec4782de8"
        Parameters = @{            
            adminUsername = 'azureuser' 
            authenticationType = "password" 
            adminPasswordOrKey = Get-KeyVaultSecret -Subscription "dd1f0073-4e57-4d48-b9ce-0a9ec4782de8" -VaultName "Dev-KV" -SecretName "F5-Dev-azureuser" 
            dnsLabel = "f5deployment" 
            instanceName = "f5instance"
            instanceType = "Standard_DS3_v2"
            imageName = "Best"
            bigIpVersion = "latest"
            numberOfAdditionalNics = 0            
            additionalNicLocation = "OPTIONAL"
            numberOfExternalIps = 0
            vnetName = "f5vnet"
            vnetResourceGroupName = "F5-RG"
            mgmtSubnetName = "Subnet01"
            mgmtIpAddressRangeStart = "10.10.10.10"
            externalSubnetName = "Subnet02"
            externalIpSelfAddressRangeStart = "10.10.11.10"
            externalIpAddressRangeStart = "10.10.11.20"
            internalSubnetName = "Subnet03"
            internalIpAddressRangeStart = "10.10.12.10"
            tenantId = "8a09f2d7-8415-4296-92b2-80bb4666c5fc"
            clientId = "cd37dfd4-dd8b-44ea-9e6c-df82cf9909dd"
            servicePrincipalSecret = Get-KeyVaultSecret -Subscription "dd1f0073-4e57-4d48-b9ce-0a9ec4782de8" -VaultName "Dev-KV" -SecretName "F5-Dev-cd37dfd4-dd8b-44ea-9e6c-df82cf9909dd"
            managedRoutes = "NOT_SPECIFIED"
            ntpServer = "0.pool.ntp.org"
            timeZone = "UTC"
            customImage = "OPTIONAL"
            allowUsageAnalytics = "Yes"
            LicenseKey1 = "ZTECY-DTPOL-RMODU-OAQBB-AXCGZCM"
            LicenseKey2 = "YQCDX-TPUYU-MODOA-HBGOH-MMTVSMP"
            tagValues = @{Environment = "DEV"}
            restrictedSrcAddress = "*"
        }
    },
    @{
        ResourceGroupName = "F5-TX-RG"
        TemplateFilePath = "D:\F5Deployment\InfraAsCodeF5Deployment\ArmTemplates\F5ClusteredDeploymentMock.json"
        DeploymentName = "F5ClusteredDeployment-Prod-TX"
        Subscription = "ed347077-d367-4401-af11-a87b73bbae0e"
        Parameters = @{
            adminUsername = 'azureuser' 
            authenticationType = "password" 
            adminPasswordOrKey = Get-KeyVaultSecret -Subscription "ed347077-d367-4401-af11-a87b73bbae0e" -VaultName "Agile-KV" -SecretName "F5-Prod-azureuser"
            dnsLabel = "f5deployment" 
            instanceName = "f5instance"
            instanceType = "Standard_DS3_v2"
            imageName = "Best"
            bigIpVersion = "latest"
            numberOfAdditionalNics = 0            
            additionalNicLocation = "OPTIONAL"
            numberOfExternalIps = 0
            vnetName = "f5vnet"
            vnetResourceGroupName = "F5-TX-RG"
            mgmtSubnetName = "Subnet01"
            mgmtIpAddressRangeStart = "10.10.10.10"
            externalSubnetName = "Subnet02"
            externalIpSelfAddressRangeStart = "10.10.11.10"
            externalIpAddressRangeStart = "10.10.11.20"
            internalSubnetName = "Subnet03"
            internalIpAddressRangeStart = "10.10.12.10"
            tenantId = "8a09f2d7-8415-4296-92b2-80bb4666c5fc"
            clientId = "cd37dfd4-dd8b-44ea-9e6c-df82cf9909dd"
            servicePrincipalSecret = Get-KeyVaultSecret -Subscription "ed347077-d367-4401-af11-a87b73bbae0e" -VaultName "Agile-KV" -SecretName "F5-Prod-cd37dfd4-dd8b-44ea-9e6c-df82cf9909dd"
            managedRoutes = "NOT_SPECIFIED"
            ntpServer = "0.pool.ntp.org"
            timeZone = "UTC"
            customImage = "OPTIONAL"
            allowUsageAnalytics = "Yes"
            LicenseKey1 = "ZTECY-DTPOL-RMODU-OAQBB-AXCGZCM"
            LicenseKey2 = "YQCDX-TPUYU-MODOA-HBGOH-MMTVSMP"
            tagValues = @{Environment = "PROD-TX"}
            restrictedSrcAddress = "*"
        }
    },  #>
    @{  DeploymentName = "ResizeAVSet"
        ResourceGroupName = "Prod-RG"
        TemplateFilePath = "D:\GovtLabDeployment\ArmTemplates\AVSet.json"
        Subscription = "ed347077-d367-4401-af11-a87b73bbae0e"
        Parameters = @{
            avSetName = 'ResizeAVSet'
            faultDomains = 2
            updateDomains = 5
            location = 'usgovvirginia'
            sku = 'Aligned'
        }
    }
    @{  DeploymentName = "ResizeVM01"
        ResourceGroupName = "Prod-RG"
        TemplateFilePath = "D:\GovtLabDeployment\ArmTemplates\WindowsServer2016_SmallDisk.json"
        Subscription = "ed347077-d367-4401-af11-a87b73bbae0e"
        Parameters = @{
            location = "usgovvirginia"
            virtualMachineName = "ResizeVM01"
            virtualMachineSize = "Standard_D2s_v3"
            adminUsername = "azureuser"
            virtualNetworkName = "prodnet"
            networkInterfaceName = "ResizeVM01_300"
            diskSizeGB = "31"
            networkSecurityGroupName = "ResizeVM01-nsg"
            adminPassword = "S3cedit12345618!" 
            availabilitySetName = "ResizeAVSet"
            diagnosticsStorageAccountName = "diagsa"
            diagnosticsStorageAccountType = "Standard_LRS"
            diagnosticsStorageAccountId = "Microsoft.Storage/storageAccounts/diagsa"
            subnetName = "Subnet1"
            publicIpAddressName = "ResizeVM01-ip"
            publicIpAddressType = "Dynamic"
            publicIpAddressSku = "Basic"
        }
    }
    @{  DeploymentName = "ResizeVM02"
        ResourceGroupName = "Prod-RG"
        TemplateFilePath = "D:\GovtLabDeployment\ArmTemplates\WindowsServer2016_SmallDisk.json"
        Subscription = "ed347077-d367-4401-af11-a87b73bbae0e"
        Parameters = @{
            location = "usgovvirginia"
            virtualMachineName = "ResizeVM02"
            virtualMachineSize = "Standard_D2s_v3"
            adminUsername = "azureuser"
            virtualNetworkName = "prodnet"
            networkInterfaceName = "ResizeVM02_300"
            diskSizeGB = "31"
            networkSecurityGroupName = "ResizeVM02-nsg"
            adminPassword = "S3cedit12345618!" 
            availabilitySetName = "ResizeAVSet"
            diagnosticsStorageAccountName = "diagsa"
            diagnosticsStorageAccountType = "Standard_LRS"
            diagnosticsStorageAccountId = "Microsoft.Storage/storageAccounts/diagsa"
            subnetName = "Subnet1"
            publicIpAddressName = "ResizeVM02-ip"
            publicIpAddressType = "Dynamic"
            publicIpAddressSku = "Basic"
        }
}
)

Return @{
    Deployments = $Deployments
}
