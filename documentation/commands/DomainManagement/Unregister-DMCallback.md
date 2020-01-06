---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Unregister-DMCallback

## SYNOPSIS
Removes a callback from the list of registered callbacks.

## SYNTAX

```
Unregister-DMCallback [-Name] <String[]> [<CommonParameters>]
```

## DESCRIPTION
Removes a callback from the list of registered callbacks.

For more details on this system, call:
Get-Help about_DM_callbacks

## EXAMPLES

### EXAMPLE 1
```
Get-DMCallback | Unregister-DMCallback
```

Unregisters all callback scriptblocks that have been registered.

## PARAMETERS

### -Name
The name of the callback to remove.

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
