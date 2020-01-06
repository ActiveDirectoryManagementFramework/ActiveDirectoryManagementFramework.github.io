---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Get-DMGroupPolicy

## SYNOPSIS
Returns all registered GPO objects.

## SYNTAX

```
Get-DMGroupPolicy [[-Name] <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns all registered GPO objects.
Thsi represents the _desired_ state, not any actual state.

## EXAMPLES

### EXAMPLE 1
```
Get-DMGroupPolicy
```

Returns all registered GPOs

## PARAMETERS

### -Name
The name to filter by.

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
