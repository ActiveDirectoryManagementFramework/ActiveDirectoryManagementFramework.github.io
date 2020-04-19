---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Unregister-DMGPPermission

## SYNOPSIS
Removes a registered GP Permission.

## SYNTAX

```
Unregister-DMGPPermission [[-PermissionIdentity] <String[]>] [<CommonParameters>]
```

## DESCRIPTION
Removes a registered GP Permission.

## EXAMPLES

### EXAMPLE 1
```
Get-DMGPPermission | Unregister-DMGPPermission
```

Clear all defined configuration.

## PARAMETERS

### -PermissionIdentity
The identity string of a GP permission.
This is NOT the user/group assigned permission (Identity property) but instead the unique identifier of the permission setting (PermissionIdentity property).

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
