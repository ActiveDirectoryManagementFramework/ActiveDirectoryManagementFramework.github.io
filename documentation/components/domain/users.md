# Users

## Description

Defintition of user which should be part of your domain configuration.


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
        "OldNames": "t0.admin.john.smith",
        "Present": true
    }
]
```

This configuration will create a new "Tier 0" admin account for John Smith at the Organizational Unit "OU=Admins,OU=T0,OU=TieringDC=corp,DC=contoso,DC=com". The naming concept was changed from full name to just the initials.

## Properties

### SamAccountName

The name of the user object.

### GivenName

Optional: Yes | Default: false

The given name of the object.

### Surname

Optional: Yes | Default: false

The surename (Family Name) of the object.

### Description

The description of the user account. This is required and should describe the purpose / use of the account.

### PasswordNeverExpires

Optional: Yes | Default: false

Whether the password should never expire. By default it WILL expire.

### UserPrincipalName

> This parameter uses [name resolution](../../advanced/name-mapping.html).

The user principal name the account should have.

### Path

> This parameter uses [name resolution](../../advanced/name-mapping.html).

The organizational unit the user should be placed in.

### OldNames

Optional: Yes | Default: false

Previous names the user object had. Will trigger a rename if a user is found under one of the old names but not the current one.

### Present

Optional: Yes | Default: false

Whether the user should be present. This can be used to trigger deletion of a managed account.