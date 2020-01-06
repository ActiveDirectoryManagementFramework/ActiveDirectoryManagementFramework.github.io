---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Get-DMCallback

## SYNOPSIS
Returns the list of registered callbacks.

## SYNTAX

```
Get-DMCallback [[-Name] <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns the list of registered callbacks.

For more details on this system, call:
Get-Help about_DM_callbacks

## EXAMPLES

### EXAMPLE 1
```
Get-DMCallback
```

Returns a list of all registered callbacks

## PARAMETERS

### -Name
The name of the callback.
Supports wildcard filtering.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
