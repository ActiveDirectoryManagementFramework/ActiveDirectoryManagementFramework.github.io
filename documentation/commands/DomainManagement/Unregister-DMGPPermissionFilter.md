---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Unregister-DMGPPermissionFilter

## SYNOPSIS
Removes a GP Permission Filter.

## SYNTAX

```
Unregister-DMGPPermissionFilter [-Name] <String[]> [<CommonParameters>]
```

## DESCRIPTION
Removes a GP Permission Filter.

## EXAMPLES

### EXAMPLE 1
```
Get-DMGPPermissionFilter | Unregister-DMGPPermissionFilter
```

Removes all registered GP Permission Filter.

## PARAMETERS

### -Name
The name of the filter to remove.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
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
