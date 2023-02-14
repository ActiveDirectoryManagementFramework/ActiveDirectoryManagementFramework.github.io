# Group Policy Links

## Description

Group policy links are among the most fiddly aspects of defining [Contexts](../../basics/contexts.html).
They govern where group policies are applied, and are thus the key element bringing your security configuration to life.

As such, a link is defined by three aspects:

+ The name of the policy
+ The name of the OrganizationalUnit it is assigned to.
+ The Precedence, governing the link order (the lower the number, the higher the priority)

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

However the true complexity ensues when combining multiple [Contexts](../../basics/contexts.html) and ensuring proper order in multiple combinations. As such, a certain amount of planning is unavoidable when designing precedence.

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

### OUFilter

A filter string for an organizational unit.
The filter must be a wildcard-pattern supporting distinguishedname.

### Precedence

Numeric value representing the order it is linked in.
The lower the number, the higher on the list, the more relevant the setting.

### Tier

The tier of a link is a priority ordering on top of Precedence.
While precedence determines order within a given tier, each tier is processed separately.
The higher the tier number, the higher the priority.
In additive mode, already existing linked policies have a Tier 0 priority.
If you want your own policies to be prepended, use Tier 1 or higher.
If you want your own policies to have the least priority however, user Tier -1 or lower.

> Default: 1

### State

The state the link should be in.
Supported states:

+ Enabled: Link should be enabled
+ Disabled: Link should be disabled
+ Enforced: Link is being enforced
+ Undefined: The current state of the link is ignored

> Defaults to: Enabled

### ProcessingMode

In which way GPO links are being processed:

+ Additive: Add provided links, but do not modify the existing ones.
+ Constrained: Replace existing links that are undesired.

By default, constrained mode is being used.
If any single link for a given Organizational Unit is in constrained mode, the entire OU is processed under constraind mode.

### Present

Whether the link should be present at all.
Relevant in additive mode, to retain the capability to delete undesired links.
