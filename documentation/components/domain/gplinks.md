# Group Policy Links

## Description

Group policy links are among the most fiddly aspects of defining [Contexts](../../basics/contexts.html).
They govern where group policies are applied, and are thus the key element bringing your security configuration to life.

As such, a link is defined by three aspects:

+ The name of the policy
+ The name of the OrganizationalUnit it is assigned to.
+ The Prcedence, governing the link order (the lower the number, the higher the priority)

> Note: Defining _any_ link for an organizational unit will cause the ADMF to consider that to be the defining list of links and remove all undesired/undefined links.

## Example Configuration

Configuration sets for group policy links are rather simple from a setting perspective:

```json
[
    {
        "PolicyName":  "AD-SEC-D-Tier0-Logon-Permission",
        "OrganizationalUnit":  "OU=Servers,OU=Tier 0,OU=Tiering,%DomainDN%",
        "Precedence":  200
    }
]
```

However the true complexity ensues when combining multiple [Contexts](../../basics/contexts.html) and ensuring proper order in multiple combinations. As such, a certain amouunt of planning is unavoidable when designing precedence.

## Tools

```powershell
function Get-GPLinkConfiguration {
    [CmdletBinding()]
    param (
        [string]
        $Server,

        [PSCredential]
        $Credential,

        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [string[]]
        $OrganizationalUnit
    )
    begin {
        $parameters = $PSBoundParameters | ConvertTo-PSFHashtable -Include Server, Credential
        $module = Get-Module DomainManagement
        $command = & $module { Get-Command ConvertTo-GPLink }
        $policyMapping = @{ }
        foreach ($adGpo in (Get-ADObject @parameters -LDAPFilter '(objectCategory=GroupPolicyContainer)' -Properties DisplayName)) {
            $policyMapping[$adGpo.DistinguishedName] = $adGpo.DisplayName
        }
        $convertCmd = { & $command -PolicyMapping $policyMapping }.GetSteppablePipeline()
        $convertCmd.Begin($true)
    }
    process {
        foreach ($ouString in $OrganizationalUnit) {
            $ouObject = Get-ADObject @parameters -Identity $ouString -Properties gPLink
            $data = $convertCmd.Process($ouObject) | Select-PSFObject 'DisplayName as PolicyName', 'Precedence*100 as Precedence', 'ADObject as OrganizationalUnit to String'
            foreach ($datum in $data) {
                $datum.OrganizationalUnit = $datum.OrganizationalUnit -replace 'DC=.+$','%DomainDN%'
                $datum
            }
        }
    }
    end {
       $convertCmd.End()
    }
}
Get-ADOrganizationalUnit -Server contoso.com -SearchBase 'OU=PAW,DC=contoso,DC=com' -Filter * |
  Get-GPLinkConfiguration -Server contoso.com |
    ConvertTo-Json
```

## Properties

### PolicyName

The name of the group policy being linked.

> Supports string expansion.

### OrganizationalUnit

The organizational unit (or domain root) being linked to.

> Supports string expansion.

### Precedence

Numeric value representing the order it is linked in.
The lower the number, the higher on the list, the more relevant the setting.
