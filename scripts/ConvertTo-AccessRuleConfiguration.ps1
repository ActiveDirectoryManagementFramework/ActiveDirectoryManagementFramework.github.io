function ConvertTo-AccessRuleConfiguration {
    <#
    .SYNOPSIS
        Tool to convert Access Rule test results into configuration sets.
    
    .DESCRIPTION
        Tool to convert Access Rule test results into configuration sets.
    
    .PARAMETER Path
        Replace the path the results should apply to.
        By default, paths should be auto-detected.
    
    .PARAMETER ObjectCategory
        Name of the object category that the result should be applied to.
        By default, rules are applied to paths of the origin.
    
    .PARAMETER InputObject
        The test result to convert.

    .PARAMETER Clip
        Converts results to json and pastes them to clipboard.

	.PARAMETER NoResolve
		Do not resolve GUIDs
		GUIDs will be resovled using the last server used in DomainManagement, which may fail if credentials are needed.
    
    .EXAMPLE
        PS C:\> $res | ConvertTo-AccessRuleConfiguration

        Converts the input test result to configuration rules

    .EXAMPLE
        PS C:\> $res | carc -ObjectCategory trustuser -Clip

        Converts the input test result to configuration rules that apply to the object category "trustuser".
        Then it converts the results to json and pastes it to the clipboard
    #>
    [Alias('carc')]
    [CmdletBinding()]
    param (
        [string]
        $Path,

        [string]
        $ObjectCategory,

        [Parameter(ValueFromPipeline = $true)]
        $InputObject,

        [switch]
        $Clip,

		[switch]
		$NoResolve
    )

    begin {
        function Convert-Identity {
            [CmdletBinding()]
            param (
                [Parameter(ValueFromPipeline = $true)]
                [string]
                $Name
            )

            begin {
                $builtIn = @{
                    'BUILTIN\Administrators'                      = 'S-1-5-32-544'
                    'BUILTIN\Users'                               = 'S-1-5-32-545'
                    'BUILTIN\Guests'                              = 'S-1-5-32-546'
                    'BUILTIN\Account Operators'                   = 'S-1-5-32-548'
                    'BUILTIN\Server Operators'                    = 'S-1-5-32-549'
                    'BUILTIN\Print Operators'                     = 'S-1-5-32-550'
                    'BUILTIN\Backup Operators'                    = 'S-1-5-32-551'
                    'BUILTIN\Replicator'                          = 'S-1-5-32-552'
                    'BUILTIN\Pre-Windows 2000 Compatible Access'  = 'S-1-5-32-554'
                    'BUILTIN\Remote Desktop Users'                = 'S-1-5-32-555'
                    'BUILTIN\Network Configuration Operators'     = 'S-1-5-32-556'
                    'BUILTIN\Incoming Forest Trust Builders'      = 'S-1-5-32-557'
                    'BUILTIN\Performance Monitor Users'           = 'S-1-5-32-558'
                    'BUILTIN\Performance Log Users'               = 'S-1-5-32-559'
                    'BUILTIN\Windows Authorization Access Group'  = 'S-1-5-32-560'
                    'BUILTIN\Terminal Server License Servers'     = 'S-1-5-32-561'
                    'BUILTIN\Distributed COM Users'               = 'S-1-5-32-562'
                    'BUILTIN\IIS_IUSRS'                           = 'S-1-5-32-568'
                    'BUILTIN\Cryptographic Operators'             = 'S-1-5-32-569'
                    'BUILTIN\Event Log Readers'                   = 'S-1-5-32-573'
                    'BUILTIN\Certificate Service DCOM Access'     = 'S-1-5-32-574'
                    'BUILTIN\RDS Remote Access Servers'           = 'S-1-5-32-575'
                    'BUILTIN\RDS Endpoint Servers'                = 'S-1-5-32-576'
                    'BUILTIN\RDS Management Servers'              = 'S-1-5-32-577'
                    'BUILTIN\Hyper-V Administrators'              = 'S-1-5-32-578'
                    'BUILTIN\Access Control Assistance Operators' = 'S-1-5-32-579'
                    'BUILTIN\Remote Management Users'             = 'S-1-5-32-580'
                    'BUILTIN\Storage Replica Administrators'      = 'S-1-5-32-582'
                }
            }

            process {
                if ($builtIn[$Name]) { return $builtIn[$Name] }

                $sid = $Name -as [System.Security.Principal.SecurityIdentifier]
                if (-not $sid) {
                    try { $sid = ([System.Security.Principal.NTAccount]$Name).Translate([System.Security.Principal.SecurityIdentifier]) }
                    catch { return $Name }
                }

                # Case: Builtin SID
                if (-not $sid.AccountDomainSid) { return $sid -as [string] }

                $rid = ($sid.Value -split '-')[-1]
                if (1000 -gt $rid) {
                    return "%DomainSID%-$rid"
                }
                $Name
            }
        }

        $list = [System.Collections.ArrayList]@()

		# Figure out last server used from the DC resolution message
		$server = @((Get-PSFMessage | Where-Object String -eq 'Resolve-DomainController.Resolved' | Select-Object -Last 1).StringValue)[0]
		if (-not $server) { $server = $env:USERDNSDOMAIN }
    }
    process {
        $data = $InputObject
        if ($InputObject.Changed) { $data = $InputObject.Changed }
        foreach ($datum in $data) {
            $source = $datum.ADObject
            if ($datum.Configuration) { $source = $datum.Configuration }
            $hash = @{
                Identity              = $source.IdentityReference | Convert-Identity | Set-String -OldValue '^.+\\' -NewValue '%DomainNetBIOSName%\'
                ActiveDirectoryRights = $source.ActiveDirectoryRights -as [string]
                InheritanceType       = $source.InheritanceType -as [string]
                AccessControlType     = $source.AccessControlType -as [string]
                ObjectType            = $source.ObjectType -as [string]
                InheritedObjectType   = $source.InheritedObjectType -as [string]
            }
			if (-not $NoResolve) {
				$hash.ObjectType = Convert-DMSchemaGuid -Server $server -Name $hash.ObjectType -OutType Name
				$hash.InheritedObjectType = Convert-DMSchemaGuid -Server $server -Name $hash.InheritedObjectType -OutType Name
			}

            if ($Path) { $hash.Path = $Path }
            elseif ($ObjectCategory) { $hash.ObjectCategory = $ObjectCategory }
            else {
				if ($datum.DistinguishedName) {
					$hash.Path = $datum.DistinguishedName | Set-String -OldValue 'DC=.+' -NewValue '%DomainDN%'
				}
                elseif ($InputObject.Identity) {
                    $hash.Path = $InputObject.Identity | Set-String -OldValue 'DC=.+' -NewValue '%DomainDN%'
                }
                else {
                    $hash.Path = "INSERT_HERE"
                }
            }

            switch ($datum.Type) {
                'Restore' { $hash.Present = $false }
            }
    
            if ($Clip) { $null = $list.Add([PSCustomObject]$hash)}
            else { [PSCustomObject]$hash }
        }
    }
    end {
        if ($Clip) {
            $list | ConvertTo-Json | Set-Clipboard
        }
    }
}