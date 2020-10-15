# Users

## Description

Define user objects in configuration.

## Example Configuration

A reasonably simple configuration entry:

```json
[
    {
        "SamAccountName":  "t0.admin.js",
        "GivenName":  "John",
        "Surname":  "Smith",
        "Description": "Tier 0 Admin Account",
        "PasswordNeverExpires":  false,
        "UserPrincipalName": "t0.admin.js@%DomainFqdn%",
        "Path": "OU=Admins,OU=T0,OU=Tiering,%DomainDN%",
        "OldNames": "t0.admin.john.smith"
    }
]
```

This configuration will create a new "Tier 0" admin account for John Smith at the Organizational Unit "OU=Admins,OU=T0,OU=TieringDC=corp,DC=contoso,DC=com". The naming concept was changed from full name to just the initials.

## Tools

The following command allows you to generate json configuration data for all users under the specified OU:

```powershell
Get-ADuser -Searchbase 'CN=Tier0,DC=contoso,DC=com' -Properties Description -Filter * | Select-PSFObject @(
  'SamAccountName'
  'GivenName'
  'Surname'
  'Description To string'
  'UserPrincipalName'
  @{ Name = 'Path'; Expression = { $_.DistinguishedName -replace 'DC=.+$','%DomainDN%' -replace '^.+?,' }}
) | ConvertTo-Json
```

## Properties

### SamAccountName

> This parameter uses [name resolution](../../advanced/name-mapping.html).

The SamAccountName of the user object.
By default, this is also used to define the Name of the user object

### Name

> This parameter uses [name resolution](../../advanced/name-mapping.html).

Optional: True | Default: `<SamAccountName>`

The name of the user object.
if this property is not specified, it will instead use the SamAccountName as Name.

### GivenName

> This parameter uses [name resolution](../../advanced/name-mapping.html).

Optional: Yes | Default: $null

The given name of the object.

### Surname

> This parameter uses [name resolution](../../advanced/name-mapping.html).

Optional: Yes | Default: $null

The surname (sn / Family Name) of the object.

### Description

> This parameter uses [name resolution](../../advanced/name-mapping.html).

Optional: Yes | Default: $null

The description of the user account. This is required and should describe the purpose / use of the account.

### PasswordNeverExpires

Optional: Yes | Default: $false

Whether the password should never expire. By default it WILL expire.

### UserPrincipalName

> This parameter uses [name resolution](../../advanced/name-mapping.html).

The user principal name the account should have.

### Path

> This parameter uses [name resolution](../../advanced/name-mapping.html).

The organizational unit the user should be placed in.

### Enabled

Optionl: Yes | Default: Undefined

By default, user objects will be created as enabled, but the enabled/disabled state is not managed:
If somebody disables the user account, that will ben either changed nor reported.

Unless you explicitly state your preference with the `Enabled` property, that is.

Supported states:

+ Enabled
+ Disabled
+ Undefined (default)

### OldNames

> This parameter uses [name resolution](../../advanced/name-mapping.html).

Optional: Yes | Default: @()

Previous names the user object had.
Will trigger a rename if a user is found under one of the old names but not the current one.

> If for some reason more than one of the old names is in use, rename will fail and an error entry is generated

### Present

Optional: Yes | Default: true

Whether the user should be present.
This can be used to trigger deletion of a managed account.
