<#
.SYNOPSIS
	A publishing script used to bullk-publish modules.

.DESCRIPTION
	A publishing script used to bullk-publish modules.
	This assumes a source control system such as Azure DevOps or any other viable tool with direct git access.
	It also expects an installed git client and makes no provisions for authentication.

	All modules must be provided via the same "DevOpsPath" - meaning they must be in the same collection if on Azure DevOps.
	Each module requires its own repository (or ideally project).

	While this script _assumes_ the use of Azure DevOps, it should be compatible with other services.

	There are also no provisions for powershell repository authentication.
	Either come pre-authenticated, use windows authentication or use PSResourceGet and have authentication configured for the repository.

.PARAMETER Repository
	Name of the PowerShell repository to publish the finished modules to.

.PARAMETER DevOpsPath
	The full path used for "git clone".
	Insert a "{0}" placeholder for the name of the module.

.PARAMETER UseGetV3
	By default, this script will use "Find-Module" and "Publish-MModule"
	Use this switch to instead use "Find-PSResource" and "Publish-PSResource"

.PARAMETER Credential
	Credentials use for repository access.

.PARAMETER Modules
	The modules to publish.
	Must be provided in the correct order of dependency.
	Will possibly fail if not all dependencies are specified, even if the target repository contains said dependencies.
	Defaults to include all modules needed for the ADMF project.

.EXAMPLE
	PS C:\> .\Publish-Admf.ps1 -Repository internal -DevOpsPath "<insertgoodexample>" -UseGetV3

	Uses PSResourceGet to clone all ADMF repositories from the source control system, and publish as needed to the internal repository using PSResourceGet.
#>
[CmdletBinding()]
param (
	[Parameter(Mandatory = $true)]
	[string]
	$Repository,

	[Parameter(Mandatory = $true)]
	[string]
	$DevOpsPath,

	[switch]
	$UseGetV3,

	[pscredential]
	$Credential,

	[string[]]
	$Modules = @(
		'string'
		'PSFramework'
		'ResolveString'
		'Principal'
		'ADSec'
		'ADMF.Core'
		'DCManagement'
		'DomainManagement'
		'ForestManagement'
		'ADMF'
	)
)

$ErrorActionPreference = 'Stop'
trap {
	Remove-Item -Path $tempRoot -Force -Recurse -ErrorAction SilentlyContinue
	Write-Warning "Script failed: $_"
	throw $_
}

if ($Credential) {
	$PSDefaultParameterValues['Find-Module:Credential'] = $Credential
	$PSDefaultParameterValues['Find-PSResource:Credential'] = $Credential
	$PSDefaultParameterValues['Publish-Module:Credential'] = $Credential
	$PSDefaultParameterValues['Publish-PSResource:Credential'] = $Credential
}

#region Functions
function New-TempDirectory {
	[CmdletBinding()]
	param (
		
	)

	$directory = New-Item -Path $env:TEMP -Name "PSModule-$(Get-Random)" -ItemType Directory
	$directory.FullName
}

function Build-Module {
	[CmdletBinding()]
	param (
		[string]
		$WorkingDirectory,

		[string]
		$Repository,

		[string]
		$Name,

		[string]
		$DevOpsPath,

		[switch]
		$UseGetV3
	)

	Assert-ModulePath -Root $WorkingDirectory

	Install-ModuleProject -Path $WorkingDirectory -DevOpsPath $DevOpsPath -Name $Name
	Publish-FakeModule -Path $WorkingDirectory -Name $Name
	if (-not (Test-ModuleUpdatePending -Path $WorkingDirectory -Name $Name -Repository $Repository -UseGetV3:$UseGetV3)) {
		Write-Host "Skipping Module $Name - no update needed."
		return
	}

	Write-Host "Updating Module $Name"
	switch ($Name) {
		'string' {
			if ($UseGetV3) { Publish-PSResource -Path "$WorkingDirectory\$Name\$Name" -Repository $Repository }
			else { Publish-Module -Path "$WorkingDirectory\$Name\$Name" -Repository $Repository }
		}
		default {
			. "$WorkingDirectory\$Name\build\vsts-build.ps1" -Repository $Repository -ApiKey DevOps -WorkingDirectory "$WorkingDirectory\$Name"
		}
	}
}

function Assert-ModulePath {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]
		[string]
		$Root
	)

	$modulePath = Join-Path -Path $Root -ChildPath '_modules'
	if (Test-Path -Path $modulePath) { return }

	$null = New-Item -Path $modulePath -ItemType Directory -Force
	$env:PSModulePath = $modulePath, $env:PSModulePath -join ';'
}

function Install-ModuleProject {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]
		[string]
		$Path,

		[Parameter(Mandatory = $true)]
		[string]
		$DevOpsPath,

		[Parameter(Mandatory = $true)]
		[string]
		$Name
	)

	Push-Location -Path $Path
	git clone "$($DevOpsPath -f $Name)"
	Pop-Location
}

function Publish-FakeModule {
	<#
	.SYNOPSIS
		Copies the module code of the selected repository into the modules folders.
	
	.DESCRIPTION
		Copies the module code of the selected repository into the modules folders.
		The folder being the "_modules" subfolder.

		Publish-Module requires all dependencies to be present not only in the repository, but also on the machine doing the publishing.
		This command - together with "Assert-ModulePath" - will ensure a copy is in a local location PowerShell knows to look for.
	
	.PARAMETER Path
		The root path where the module repositories to be published are cloned to.
		Also the parent folder under which this function expects a "_modules" folder.
	
	.PARAMETER Name
		Name of the module to fake-pulish.
	#>
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]	
		[string]
		$Path,

		[Parameter(Mandatory = $true)]	
		[string]
		$Name
	)

	Copy-Item -Path "$Path\$Name\$Name" -Destination "$Path\_modules" -Recurse -Force
}

function Test-ModuleUpdatePending {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]
		[string]
		$Path,
		
		[Parameter(Mandatory = $true)]
		[string]
		$Name,
		
		[Parameter(Mandatory = $true)]
		[string]
		$Repository,

		[switch]
		$UseGetV3
	)

	# Would prefer to use "Import-PowerShellDataFile", but some manifests cannot be read that way
	$localVersion = (Get-Content -Path "$Path\$Name\$Name\$Name.psd1" | Where-Object { $_ -match '^\s*ModuleVersion' }) -replace "^.+?['`"]" -replace "['`"]+$" -as [version]

	try {
		if ($UseGetV3) { $remoteVersion = (Find-PSResource -Name $Name -Repository $Repository).Version -as [Version] }
		else { $remoteVersion = (Find-Module -Name $Name -Repository $Repository).Version -as [Version] }
	}
	catch {
		if ('ObjectNotFound','ResourceUnavailable','ParserError' -notcontains $_.CategoryInfo.Category) {
			throw
		}
		$remoteVersion = '0.0.0' -as [Version]
	}

	if (-not $remoteVersion) { return $true }
	if ($remoteVersion -lt $localVersion) { return $true }
	$false
}
#endregion Functions

if ($UseGetV3) { 
	function global:Publish-Module {
		[CmdletBinding()]
		param (
			$Path,
			$NuGetApiKey,
			[switch]
			$Force,
			$Repository
		)

		Publish-PSResource -Path $Path -Repository $Repository -ApiKey $NuGetApiKey -SkipDependenciesCheck
	}
}
$tempRoot = New-TempDirectory

foreach ($moduleName in $Modules) {
	Build-Module -WorkingDirectory $tempRoot -Repository $Repository -Name $moduleName -DevOpsPath $DevOpsPath -UseGetV3:$UseGetV3
}

Remove-Item -Path $tempRoot -Force -Recurse