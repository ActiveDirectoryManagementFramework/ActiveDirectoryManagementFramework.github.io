---
external help file: ForestManagement-help.xml
Module Name: ForestManagement
online version:
schema: 2.0.0
---

# Unregister-FMSite

## SYNOPSIS
Removes a site from the list of registered sites.

## SYNTAX

```
Unregister-FMSite [-Name] <String[]> [<CommonParameters>]
```

## DESCRIPTION
Removes a site from the list of registered sites.

## EXAMPLES

### EXAMPLE 1
```
Unregister-FMSite -Name "MySite"
```

Removes the site "MySite" from the list of registered sites

## PARAMETERS

### -Name
Name of the site to unregister

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
