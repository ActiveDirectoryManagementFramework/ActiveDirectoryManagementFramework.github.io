# Organizational Units

## Description

This [Component](../components.html) allows defining Organizational Units in configuration.

One of the most straightforward [Components](../components.html), there is one thing to note:

It will refuse to delete Organizational Units that should be deleted, so long as they have any content.
Instead it will write a warning telling you to clean up.

## Example Configuration

Default definition for the Domain Controllers OU:

```json
[
    {
        "Name":  "Domain Controllers",
        "Description":  "Default container for domain controllers",
        "Path":  "%DomainDN%"
    }
]
```

## Tools

Convert all GPOs into Json configuration:

```powershell
Get-ADOrganizationalUnit -Filter * -Properties Description |
    Select-Object @(
        'Name'
        'Description'
        @{
            Name = 'Path'
            Expression = {
                $_.DistinguishedName.Split(",",2)[1] -replace 'DC=.+$','%DomainDN%'
            }
        }
    ) | ConvertTo-Json
```

## Properties

### Name

> This parameter uses [name resolution](../../advanced/name-mapping.html).

Name of the OU to register.

### Description

> This parameter uses [name resolution](../../advanced/name-mapping.html).

Description for the OU to register.

### Path

> This parameter uses [name resolution](../../advanced/name-mapping.html).

The path to where the OU should be.

### OldNames

> This parameter uses [name resolution](../../advanced/name-mapping.html).

Previous names the OU had.
During invocation, if it is not found but an OU in the same path with a listed old name IS, it will be renamed.

### Present

Optional: Yes | Default: $true

Whether the OU should be present.
