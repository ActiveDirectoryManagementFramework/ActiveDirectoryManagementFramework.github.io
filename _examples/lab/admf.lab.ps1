$labname = 'ADMF'
$domainName = 'contoso.com'
$domainName2 = 'fabrikam.org'
$imageUI = 'Windows Server 2022 Datacenter (Desktop Experience)'

New-LabDefinition -Name $labname -DefaultVirtualizationEngine HyperV

$PSDefaultParameterValues['Add-LabMachineDefinition:Memory'] = 2GB
$PSDefaultParameterValues['Add-LabMachineDefinition:OperatingSystem'] = $imageUI
$PSDefaultParameterValues['Add-LabMachineDefinition:DomainName'] = $domainName

Add-LabMachineDefinition -Name AdmfDCRed -Roles RootDC
Add-LabMachineDefinition -Name AdmfCA -Roles CaRoot
Add-LabMachineDefinition -Name AdmfAdminHost
Add-LabMachineDefinition -Name AdmfDCBlack -Roles RootDC -DomainName $domainName2

Install-Lab

Install-LabWindowsFeature -ComputerName AdmfAdminHost -FeatureName NET-Framework-Core, NET-Non-HTTP-Activ, GPMC, RSAT-AD-Tools

Invoke-LabCommand -ActivityName "Setting Keyboard Layout" -ComputerName (Get-LabVM).Name -ScriptBlock { Set-WinUserLanguageList -LanguageList 'de-de' -Confirm:$false -Force }
Restart-LabVM -ComputerName (Get-LabVM).Name