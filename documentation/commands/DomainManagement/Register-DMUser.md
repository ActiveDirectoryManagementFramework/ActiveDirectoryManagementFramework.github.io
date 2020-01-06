---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Register-DMUser

## SYNOPSIS
Registers a user definition into the configuration domains are compared to.

## SYNTAX

```
Register-DMUser [-SamAccountName] <String> [[-GivenName] <String>] [[-Surname] <String>]
 [[-Description] <String>] [-PasswordNeverExpires] [-UserPrincipalName] <String> [-Path] <String>
 [[-OldNames] <String[]>] [[-Present] <Boolean>] [<CommonParameters>]
```

## DESCRIPTION
Registers a user definition into the configuration domains are compared to.
This configuration is then compared to the configuration in AD when using Test-ADUser.

Note: Many properties can be set up for string replacement at runtime.
For example to insert the domain DN into the path, insert "%DomainDN%" (without the quotes) where the domain DN would be placed.
Use Register-DMNameMapping to add additional values and the placeholder they will be inserted into.
Use Get-DMNameMapping to retrieve a list of available mappings.
This can be used to use the same content configuration across multiple environments, accounting for local naming differences.

## EXAMPLES

### EXAMPLE 1
```
Get-Content .\users.json | ConvertFrom-Json | Write-Output | Register-DMUser
```

Reads a json configuration file containing a list of objects with appropriate properties to import them as user configuration.

## PARAMETERS

### -SamAccountName
SamAccountName of the user to manage.
Subject to string insertion.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -GivenName
Given Name of the user to manage.
Subject to string insertion.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Surname
Surname (Family Name) of the user to manage.
Subject to string insertion.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Description
Description of the user account.
This is required and should describe the purpose / use of the account.
Subject to string insertion.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -PasswordNeverExpires
Whether the password should never expire.
By default it WILL expire.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -UserPrincipalName
The user principal name the account should have.
Subject to string insertion.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 5
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Path
The organizational unit the user should be placed in.
Subject to string insertion.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 6
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -OldNames
Previous names the user object had.
Will trigger a rename if a user is found under one of the old names but not the current one.
Subject to string insertion.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: @()
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Present
Whether the user should be present.
This can be used to trigger deletion of a managed account.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: True
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
