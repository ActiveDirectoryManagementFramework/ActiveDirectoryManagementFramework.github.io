# Access Rules

## Description

Access rules allow you to define privilege delegation on any object desired.
While this resource is managed by the DomainManagement module, it is possible to also define rules that apply to the configuration Naming Context.

> It is not necessary to define the Access Rules specified as default access rules for that object type by the Schema

Any object, that has at least one such rule defined will be assumed to be fully defined. Access Rules that are not defined will be removed.
Inherited permissions will be ignored.

## Example Configuration

A reasonably simple configuration entry:

```json
[
    {
        "Path":  "CN=Builtin,%DomainDN%",
        "ActiveDirectoryRights":  "ReadProperty",
        "InheritanceType":  "None",
        "ObjectType":  "00000000-0000-0000-0000-000000000000",
        "InheritedObjectType":  "00000000-0000-0000-0000-000000000000",
        "AccessControlType":  "Allow",
        "Identity":  "Everyone"
    }
]
```

This rule will grant everyone read access on all properties of the BuiltIn Container.

A slightly more complex configuration setting:

```json
[
    {
        "ObjectCategory":  "VirtualMachineObject",
        "ActiveDirectoryRights":  "GenericAll",
        "InheritanceType":  "None",
        "ObjectType":  "<All>",
        "InheritedObjectType":  "<All>",
        "AccessControlType":  "Allow",
        "Identity":  "<Parent>"
    }
]
```

As can be seen here:

+ Rather than specifying a path, we specify an [Object Category](object-categories.html). For more details on object categories, see the related article.
+ The `ObjectType` and `InheritedObjectType` can accept the GUID, but also their string-label. `<All>` is equivalent to `00000000-0000-0000-0000-000000000000`
+ The identity specifies the parent object (in this case, the computer account the VM object is assigned to).

## Tools

The easiest way to generate a rule-set is to copy it from an existing AD object.
Example snippet:

```powershell
$acl = Get-AdsAcl -Path 'OU=UserAccounts,DC=contoso,DC=com'
$acl.Access |
  Where-Object IdentityReference -eq 'contoso\Domain Admins' |
    Select-PSFObject @(
        @{
            Name = 'Path'
            Expression = {
                $acl.DistinguishedName -replace 'DC=.+$','%DomainDN%'
            }
        },
        'ActiveDirectoryRights TO string',
        'InheritanceType TO string',
        'ObjectType',
        'InheritedObjectType',
        'AccessControlType TO string',
        'IdentityReference AS Identity TO string'
    ) | ConvertTo-Json
```

Then update the identity as need to use [Name Mapping / Name Resolution](../../advanced/name-mapping.html).

You can also use `Convert-DMSchemaGuid` to translate the GUIDs into humanly readable names.

> Transfer from Test Result

If you already have some settings deployed and are testing access rules using `Test-AdmfDomain`, you can convert test results into configuration entries.

This command will convert test results into suitable datasets:

```powershell
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
        $Clip
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
    }
    process {
        $data = $InputObject
        if ($InputObject.Changed) { $data = $InputObject.Changed }
        foreach ($datum in $data) {
            $source = $datum.ADObject
            if ($datum.Configuration) { $source = $datum.Configuration }
            $hash = @{
                Identity              = $source.IdentityReference | Convert-Identity
                ActiveDirectoryRights = $source.ActiveDirectoryRights -as [string]
                InheritanceType       = $source.InheritanceType -as [string]
                AccessControlType     = $source.AccessControlType -as [string]
                ObjectType            = $source.ObjectType -as [string]
                InheritedObjectType   = $source.InheritedObjectType -as [string]
            }
            if ($Path) { $hash.Path = $Path }
            elseif ($ObjectCategory) { $hash.ObjectCategory = $ObjectCategory }
            else {
                if ($InputObject.Identity) {
                    $hash.Path = $InputObject.Identity | Set-String -OldValue 'DC=.+' -NewValue '%DomainDN%'
                }
                elseif ($datum.DistinguishedName) {
                    $hash.Path = $datum.DistinguishedName | Set-String -OldValue 'DC=.+' -NewValue '%DomainDN%'
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
```

With that you can then convert results like this:

```powershell
# Plain Convert
$res = Test-AdmfDomain -Server contoso.com
$res | ConvertTo-AccessRuleConfiguration

# Short form straight to clipboard
$res | carc -ObjectCategory trustuser -Clip
```

## Properties

### Path

> This parameter uses [name resolution](../../advanced/name-mapping.html).

The distinguished name of the object, on which access rules are applied.

This parameter is mutually exclusive with `ObjectCategory`.

### Object Category

The [Object Category](object-categories.html) to which the access rule applies.
Object categories allow dynamically assigning permissions based on object conditions.

However, they only consider objects [Under Management](../../basics/contentmode.html).

This is commonly used for targeting dynamic objects that are hard to match with a path, such as computer objects (could have different names in different domains), as well as meta-objects assigned to them (domain controller meta-objects, DFSR-objects, Virtual Machine SCP, ...).

This parameter is mutually exclusive with `Path`.

### ActiveDirectoryRights

The actual permission granted.

### InheritanceType

Optional: Yes | Default: None

How the permissions are affect child items.

### ObjectType

Optional: Yes | Default: `<All>`

The type of objects to affect.

+ Use `<All>` or `00000000-0000-0000-0000-000000000000` to affect all.
+ Use the specific GUID or associated name for more specific constraints

You can use the `Convert-DMSchemaGuid` to convert a GUID into a name or vice-versa:

```powershell
Convert-DMSchemaGuid -Name 00000000-0000-0000-0000-000000000000 -OutType Name -Server contoso.com
```

> Note: This command is domain-specific and will on the first run cache all GUIDs, taking a considerable amount of time

As custom object class may not have the same GUID in separate forests, using names may be required.

> When specifying the name of a property or object class, use the value in the `adminDisplayName` on the schema attribute/class.

### InheritedObjectType

Optional: Yes | Default: `<All>`

A second object class or attribute reference required for this access rule.
Depending on the `ActiveDirectoryRights` setting this property may represent different things (or not be used at all).

Same rules as ObjectType, accepts a GUID or its name-equivalent.

> When specifying the name of a property or object class, use the value in the `adminDisplayName` on the schema attribute/class.

### AccessControlType

Optional: Yes | Default: Allow

Whether this is an Allow or Deny rule.
Legal Values:

+ Allow
+ Deny

### Identity

> This parameter uses [name resolution](../../advanced/name-mapping.html).

The grantee that is given the permissions defined in the access rule.
Use NT Account notation (`contoso\examplegroup`) to target the user.
As this supports name resolution, notations such as `%DomainName%\examplegroup` are also viable.

> Special notation: `<parent>`

By inserting `<parent>` as identity, it will instead use the parent object as grantee.
This requires the parent to be a security principal (such as a user or computer object).

### Optional

Optional: Yes | Default: false

A boolean value, accepting either `true` or `false` (note: no quotes in json!).
By default, the Domain Management module will complain about an object not existing when assigning an access rule to an object that ... well, doesn't exist.
Setting `Optional` to `true` will make it ignore it instead.

### Present

Whether the access rule should exist or not.
By default, it should.
Set this to $false in order to explicitly delete an existing access rule.
Set this to 'Undefined' to neither create nor delete it, in which case it will simply be accepted if it exists.

Use this field to explicitly override schema default permissions if needed/desired.

### NoFixConfig

By default, Test-DMAccessRule will generate a "FixConfig" result for accessrules that have been explicitly defined but are also part of the Schema Default permissions.
If this setting is enabled, this result object is suppressed.

## Test Results

> Update

Some access rules on this Active Directory object need to be modified.
This can contain one or multiple changes being applied to the specified object.

Tip: Inspect the `Changed` property to get a list of individual changes for the given AD object!

Change types:

+ Delete: An Undesired access rule is being removed from the object
+ Create: A missing access rule is being added to the object
+ Restore: A default permission for the object, as defined in the AD schema, is being re-applied to the object
+ FixConfig: This test result is written, when the configuration contains an access rule, that is already defined in the schema default. In other words, the configured access rule is redundant and can be removed from the configuration (or the schema default, if it should not be in there ...).

Note: To prevent a specific schema default permission to be applied to an object (by generating a restore action), define that access rule and set its "Present" property to $false.

> MissingADObject

The Active Directory object for which Access Rules have been configured does not (yet) exist.
This usually means you have not yet run the specific component of your config that would create the object.

> NoAccess

The used account has insufficient rights to read the security configuration.
This usually means the account has been blocked from reading the ACL in question - try manually fixing those or using a different, higher privileged account instead.
