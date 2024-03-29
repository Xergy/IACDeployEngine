$AzureEnvironment = "AzureUsGovernment"

<#
    .SYNOPSIS
        Connects to Azure and sets the provided subscription.

    .PARAMETER SubscriptionId
        ID of subscription to use
#>
function Get-AzureConnection 
{
    Param
    (
        [parameter(mandatory = $true)]
        $SubscriptionId
    )

    $context = Get-AzureRmContext

    if($null -eq $context.Account)
    {
        $envARM = Get-AzureRmEnvironment -Name $AzureEnvironment

        $context = Add-AzureRmAccount -Environment $envARM -ErrorAction Stop
    }

    $null = Set-AzureRmContext -Subscription $SubscriptionId -ErrorAction Stop
}

<#
    .SYNOPSIS
        Starts a new Azure RM template deployment.

    .PARAMETER TemplateFile
        Path to ARM template

    .PARAMETER ResourceGroupName
        Name of resource group to deploy template file too

    .PARAMETER TemplateParameterObject
        Parameter objects for template
#>
function New-ArmDeployment
{
    [cmdletbinding()]
    Param
    (
        [parameter(mandatory = $true)]
        $DeploymentName,
    
        [parameter(mandatory = $true)]
        $TemplateFile,

        [parameter(mandatory = $true)]
        $ResourceGroupName,

        [parameter(mandatory = $true)]
        $Subscription,

        [parameter(mandatory = $true)]
        $TemplateParameterObject
    )
    
    Set-AzureRmContext -SubscriptionID $Subscription | out-null
    Set-AzureRmDefault -ResourceGroupName $ResourceGroupName | out-null
    $Context = Get-AzureRmContext 
    
    Write-Verbose "Starting $DeploymentName"

    return New-AzureRmResourceGroupDeployment -Name $DeploymentName `
                                              -ResourceGroupName $ResourceGroupName `
                                              -DefaultProfile $Context `
                                              -TemplateFile $TemplateFile `
                                              -TemplateParameterObject $TemplateParameterObject `
                                              -Force `
                                              -Verbose `
                                              -Asjob `
                                              
}
function Get-KeyVaultSecret  {
    Param
    (
        [parameter(mandatory = $true)]
        $Subscription,
        [parameter(mandatory = $true)]
        $VaultName,
        [parameter(mandatory = $true)]
        $SecretName
    )

    $StartingSub = (Get-AzureRmContext).Subscription.ID

    If ($StartingSub -ne $Subscription) {
        Write-Host "Changing to Sub $($Subscription)"
        Set-AzureRmContext -SubscriptionId $Subscription | out-null
    }

    Write-Host "Retrieving Secret $($SecretName)"
    $Secret = $null
    $Secret = (Get-AzureKeyVaultSecret -VaultName $VaultName -Name $SecretName).SecretValueText
    If ($Secret){Write-Host "Success"} Else {Write-Host "Failed to Retrieve $($SecretName)"}

    If ((Get-AzureRmContext).Subscription.ID -ne $StartingSub) {
        Write-Host "Changing back to starting Subscription $($StartingSub)"
        Set-AzureRmContext -SubscriptionId $StartingSub | out-null
    }

    return $Secret

}


Function New-KeyVaultCSVTemplate {

    #Sample Data
    $Item = New-Object PSObject -Property @{
        Subscription = "ed347077-d367-4401-af11-a87b73bbae0e"
        ResourceGroupName = "Prod-RG"
        VaultName = "Agile-KV"
        SecretName = "Prod-F5-azureuser"
        ContentType = "Prod-F5-azureuser"
        SecretValue = "MyPassword"
    }
    
    $Item | 
        Select-Object -Property Subscription,ResourceGroupName,VaultName,SecretName,ContentType,SecretValue | 
        Export-Csv -Path KeyVaultBulkLoad.csv -NoTypeInformation    
}

Function Add-KeyVaultSecret {

    $Secrets = Import-Csv -Path KeyVaultBulkLoad.csv             

    foreach ($Secret in $Secrets) {
    
        Write-Host "Adding Secret for $($Secret.SecretName) to KeyVault $($Secret.VaultName) in $($Secret.ResourceGroupName)"        
        $secretvalue = $null
        $secretvalue = ConvertTo-SecureString $($Secret.SecretValue) -AsPlainText -Force
        Set-AzureKeyVaultSecret -VaultName $Secret.VaultName -Name $Secret.SecretName -SecretValue $SecretValue -ContentType $Secret.ContentType 
             
    }
  

}

function Add-KeyVaultSecret {
    $Secrets = Import-Csv -Path KeyVaultBulkLoad.csv             


    foreach ($Secret in $Secrets) {
    
        Write-Host "Adding Secret for $($Secret.SecretName) to KeyVault $($Secret.VaultName) in $($Secret.ResourceGroupName)"        
        $secretvalue = $null
        $secretvalue = ConvertTo-SecureString $($Secret.SecretValue) -AsPlainText -Force
        Set-AzureKeyVaultSecret -VaultName $Secret.VaultName -Name $Secret.SecretName -SecretValue $SecretValue -ContentType $Secret.ContentType 
    }
    
}

