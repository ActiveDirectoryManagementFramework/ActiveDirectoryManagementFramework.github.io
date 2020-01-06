---
external help file: ForestManagement-help.xml
Module Name: ForestManagement
online version:
schema: 2.0.0
---

# Unregister-FMSiteLink

## SYNOPSIS
Removes a link between two sites from configuration.

## SYNTAX

```
Unregister-FMSiteLink [-Site1] <String> [-Site2] <String> [<CommonParameters>]
```

## DESCRIPTION
Removes a link between two sites from configuration.

## EXAMPLES

### EXAMPLE 1
```
Unregister-FMSiteLink -Site1 MySite -Site2 MyOtherSite
```

Removes a sitelink from configuration.

## PARAMETERS

### -Site1
The site1 of the link.

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

### -Site2
The site2 of the link.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
