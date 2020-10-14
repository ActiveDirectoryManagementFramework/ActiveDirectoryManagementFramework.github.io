# Groups

## Description

Groups are the binding glue that allows effective permission delegation and message distribution service to actually work.
This Component allows you to define your own groups but does _not_ cover group membership assignments.

See the [Group Membership Component](groupmemberships.html) for managing group memberships.

## Example Configuration

A sample group defined:

```json
[
    {
        "Path":  "OU=Groups,OU=Administration,%DomainDN%",
        "Name":  "Tier 1 Accounts",
        "Description":  "All Accounts operating at Tier 1",
        "Scope":  "Global"
    }
]
```

This creates the "Tier 1 Accounts" global group under the specified OU.

## Tools

Convert all groups to configuration:

```powershell
Get-ADGroup -Filter * -Property Description | Select-PSFObject @{
  Name = 'Path'
  Expression = { $_.DistinguishedName -replace ',DC=.+$',',%DomainDN%' -replace '^.+?,' }
}, Name, "Description to string", 'GroupScope as Scope to String' | convertTo-Json
```

## Properties

### Name

> This parameter uses [name resolution](../../advanced/name-mapping.html).

The name of the group.

### SamAccountName

> This parameter uses [name resolution](../../advanced/name-mapping.html).

The SamAccountName of the group.
Defaults to the Name if not otherwise specified.

### Path

> This parameter uses [name resolution](../../advanced/name-mapping.html).

Path (distinguishedName) of the OU to place the group in.

### Description

> This parameter uses [name resolution](../../advanced/name-mapping.html).

Description of the group.

### Scope

The scope of the group.
Use DomainLocal for groups that grrant direct permissions and Global for role groups.

### Category

Default: Security | Optional: yes

Whether the group should be a security group or a distribution group.

### OldNames

Previous names the group used to have.
By specifying this name, groups will be renamed if still using an old name.
Conflicts may require resolving.

### Present

Default: $true | Optional: yes

Whether the group should exist.
Set to $false for explicitly deleting groups, rather than creating them.
