---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Unregister-DMNameMapping

## SYNOPSIS
Removes a registered name mapping.

## SYNTAX

```
Unregister-DMNameMapping [-Name] <String[]> [<CommonParameters>]
```

## DESCRIPTION
Removes a registered name mapping.
Mapped names are used for stringr replacement when invoking domain configurations.

## EXAMPLES

### EXAMPLE 1
```
Get-DMNameMapping | Unregister-DMNameMapping
```

Removes all registered name mappings.

## PARAMETERS

### -Name
The name(s) of the mapping to purge.

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
