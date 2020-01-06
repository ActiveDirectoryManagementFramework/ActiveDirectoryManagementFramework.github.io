---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Get-DMNameMapping

## SYNOPSIS
List the registered name mappings

## SYNTAX

```
Get-DMNameMapping [[-Name] <String>] [<CommonParameters>]
```

## DESCRIPTION
List the registered name mappings
Mapped names are used for stringr replacement when invoking domain configurations.

## EXAMPLES

### EXAMPLE 1
```
Get-DMNameMapping
```

List all registered mappings

## PARAMETERS

### -Name
The name to filter by.
Defaults to '*'

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
