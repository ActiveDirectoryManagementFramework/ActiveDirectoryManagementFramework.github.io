---
external help file: ForestManagement-help.xml
Module Name: ForestManagement
online version:
schema: 2.0.0
---

# Register-FMSite

## SYNOPSIS
Register a new site configuration.

## SYNTAX

```
Register-FMSite [-Name] <String> [-Description] <String> [-Location] <String> [[-OldNames] <String[]>]
 [<CommonParameters>]
```

## DESCRIPTION
Register a new site configuration.
This is the ideal / desired state for the site setup.
Forests will be brought into this state by using Invoke-FMSite.

## EXAMPLES

### EXAMPLE 1
```
Register-FMSite -Name ABCDE -Description "Some Site" -Location 'Atlantis'
```

Registers a new desired site.

## PARAMETERS

### -Name
Name of the site to apply.

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

### -Description
Description the site should have.

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

### -Location
Location the site should be part of.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -OldNames
Previous names for this site.
Forests that have a site still using one of these names will have those sites renamed.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
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
