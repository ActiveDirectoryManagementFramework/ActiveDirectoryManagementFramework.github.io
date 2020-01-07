$commandReferenceBasePath = "$($env:SYSTEM_DEFAULTWORKINGDIRECTORY)\documentation\commands"
$modules = @("DomainManagement", "ForestManagement", "DCManagement", "ADMF")
$excludedCommands = @()

foreach ($moduleName in $modules)
{
	Write-PSFMessage -Level Host -Message "Processing $moduleName"
	Write-PSFMessage -Level Host -Message "  Importing Module"
	Import-Module $moduleName
	Write-PSFMessage -Level Host -Message "  Creating list of commands to process"
	$commands = Get-Command -Module $moduleName -CommandType Function, Cmdlet | Select-Object -ExpandProperty Name | Where-Object { $_ -notin $excludedCommands } | Sort-Object
	Write-PSFMessage -Level Host -Message "  $($commands.Count) commands found"
	
	Write-PSFMessage -Level Host -Message "  Creating markdown help files"
	Remove-Item "$($commandReferenceBasePath)\$($moduleName)" -Recurse -ErrorAction Ignore
	$null = New-Item "$($commandReferenceBasePath)\$($moduleName)" -ItemType Directory
	$null = New-MarkdownHelp -Command $commands -OutputFolder "$($commandReferenceBasePath)\$($moduleName)"
	
	Write-PSFMessage -Level Host -Message "  Creating index file"
	Set-Content -Path "$($commandReferenceBasePath)\$($moduleName).md" -Value @"
# $moduleName Command Reference

"@ -Encoding Ascii
	
	$navData = @{
		backto = @{
			Label = $moduleName
			Link = "../$moduleName.html"
		}
		fellows = @()
	}
	#region Handling "regular" module command references
	if ($moduleName -notin 'DomainManagement','ForestManagement') {
		foreach ($command in $commands)
		{
			Add-Content -Path "$($commandReferenceBasePath)\$($moduleName).md" -Value " - [$command]($($moduleName)/$command.html)"
			$navData.fellows += [PSCustomObject]@{
				Label = $command
				Link = "$command.html"
			}
		}
	}
	#endregion Handling "regular" module command references

	#region Handling grouped module command references
	else {
		$grouped = $commands | Group-Object { $_ -replace '^.+?-(DM|FM)' }
		$theOthers = $grouped | Where-Object Count -lt 5
		foreach ($group in $grouped) {
			if ($group.Count -lt 5) { continue }

			Add-Content -Path "$($commandReferenceBasePath)\$($moduleName).md" -Value @"

## $($group.Name)

"@
			foreach ($command in ($group.Group | Sort-Object)) {
				Add-Content -Path "$($commandReferenceBasePath)\$($moduleName).md" -Value " - [$command]($($moduleName)/$command.html)"
				$navData.fellows += [PSCustomObject]@{
					Label = $command
					Link = "$command.html"
				}
			}
		}

		Add-Content -Path "$($commandReferenceBasePath)\$($moduleName).md" -Value @"
			
## Other Commands

"@
		foreach ($command in ($theOthers.Group | Write-Output | Sort-Object)) {
			Add-Content -Path "$($commandReferenceBasePath)\$($moduleName).md" -Value " - [$command]($($moduleName)/$command.html)"
			$navData.fellows += [PSCustomObject]@{
				Label = $command
				Link = "$command.html"
			}
		}
	}
	#endregion Handling grouped module command references

	$navData | ConvertTo-Json | Set-Content "$($commandReferenceBasePath)\$($moduleName)\nav.json"
	Write-PSFMessage -Level Host -Message "Finished processing $moduleName"
}

Write-Host " - "
Write-Host "###############################################################"
Write-Host " - "