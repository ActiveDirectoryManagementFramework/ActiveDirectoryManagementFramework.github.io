[CmdletBinding()]
param (
	[Parameter(Mandatory = $true)]
	[string]
	$SourcesPath,

	[Parameter(Mandatory = $true)]
	[string]
	$DevOpsPath,

	[string]
	$Branch = 'main',

    [switch]
    $NoAuthorQuery
)

$ErrorActionPreference = 'Stop'
trap {
	Remove-Item -Path $tempRoot -Force -Recurse -ErrorAction SilentlyContinue
	Write-Warning "Script failed: $_"
	throw $_
}

#region Functions
function New-TempDirectory {
	[CmdletBinding()]
	param (
		
	)

	$directory = New-Item -Path $env:TEMP -Name "PSModule-$(Get-Random)" -ItemType Directory
	$directory.FullName
}

function Set-GitAuthor {
    [CmdletBinding()]
    param ()

    $userName = Read-Host "Please provide the git message Username (e.g.: 'Max Mustermann')"
    $userMail = Read-Host "Please provide the git message mail (e.g.: 'Max.Mustermann@contoso.com')"
    git config --global user.name $userName
    git config --global user.email $userMail
}

function Resolve-SourceFile {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]
		[string]
		$Path
	)

	foreach ($file in Get-ChildItem -Path $Path -Filter *.zip) {
		[PSCustomObject]@{
			Path = $file.FullName
			Name = $file.BaseName -replace '-[^-]+'
		}
	}
}

function Publish-Branch {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]
		[string]
		$DevOpsPath,

		[Parameter(Mandatory = $true)]
		[string]
		$Branch,

		[Parameter(Mandatory = $true)]
		[string]
		$Name,

		[Parameter(Mandatory = $true)]
		[string]
		$SourceFile,

		[Parameter(Mandatory = $true)]
		[string]
		$WorkingDirectory
	)

	$extractPath = Join-Path -Pat $WorkingDirectory -ChildPath '_extracts'
	if (-not (Test-Path -Path $extractPath)) {
		$null = New-Item -Path $extractPath -ItemType Directory -Force
	}

    Write-Host "Publishing $Name to branch $Branch" -ForegroundColor Cyan
	$file = Get-Item -LiteralPath $SourceFile
	Expand-Archive -LiteralPath $file.FullName -DestinationPath $extractPath

	Install-GitRepository -Path $WorkingDirectory -Url ($DevOpsPath -f $Name)
	$gitRoot = Join-Path -Path $WorkingDirectory -ChildPath $Name
	
	Set-GitBranch -RepoPath $gitRoot -Name $Branch
	Remove-Item -Path "$gitRoot\*"
	Copy-Item -Path "$extractPath\$($file.BaseName)\*" -Destination $gitRoot -Recurse -Force
	Publish-GitRepo -RepoPath $gitRoot -Branch $Branch
}

function Install-GitRepository {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]
		[string]
		$Path,

		[Parameter(Mandatory = $true)]
		[string]
		$Url
	)

	Push-Location -Path $Path
	git clone $Url
	Pop-Location
}

function Set-GitBranch {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]
		[string]
		$RepoPath,

		[Parameter(Mandatory = $true)]
		[string]
		$Name
	)

	Push-Location -Path $RepoPath
	git switch -c $Name
    git pull origin $Name
	Pop-Location
}

function Publish-GitRepo {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]
		[string]
		$RepoPath,
        
        [Parameter(Mandatory = $true)]
		[string]
        $Branch
	)

	Push-Location -Path $RepoPath
    $null = git add *
    $null = git commit -a -m "update branch $Branch"
    git push --set-upstream origin $Branch
	Pop-Location
}
#endregion Functions

if (-not $NoAuthorQuery) { Set-GitAuthor }
$tempRoot = New-TempDirectory

$sources = Resolve-SourceFile -Path $SourcesPath
foreach ($source in $sources) {
	Publish-Branch -DevOpsPath $DevOpsPath -Branch $Branch -Name $source.Name -SourceFile $source.Path -WorkingDirectory $tempRoot
}

Remove-Item -Path $tempRoot -Force -Recurse