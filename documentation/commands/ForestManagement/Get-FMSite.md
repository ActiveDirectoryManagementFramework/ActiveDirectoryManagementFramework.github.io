---
external help file: ForestManagement-help.xml
Module Name: ForestManagement
online version:
schema: 2.0.0
---

# Get-FMSite

## SYNOPSIS
Returns the list of configured sites.

## SYNTAX

```
Get-FMSite [[-Name] <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns the list of configured sites.
Sites can be configured using Register-FMSite.
Those configurations represent the "Should be" state as defined for the entire organization.

## EXAMPLES

### EXAMPLE 1
```
Get-FMSite
```

Returns all configured sites.

## PARAMETERS

### -Name
Name to filter by.
Defaults to "*"

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
