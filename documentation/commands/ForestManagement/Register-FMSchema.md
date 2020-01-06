---
external help file: ForestManagement-help.xml
Module Name: ForestManagement
online version:
schema: 2.0.0
---

# Register-FMSchema

## SYNOPSIS
Registers a schema extension attribute.

## SYNTAX

```
Register-FMSchema [-ObjectClass] <String[]> [-OID] <String> [-AdminDisplayName] <String>
 [-LdapDisplayName] <String> [-OMSyntax] <Int32> [-AttributeSyntax] <String> [-SingleValued]
 [-AdminDescription] <String> [-SearchFlags] <Int32> [-PartialAttributeSet] <Boolean> [-AdvancedView] <Boolean>
 [<CommonParameters>]
```

## DESCRIPTION
Registers a schema extension attribute.
These registered attributes will be applied / updated as needed when running Invoke-FMSchema.
Use Test-FMSchema to verify, whether a forest is properly configured.

## EXAMPLES

### EXAMPLE 1
```
Get-Content .\schema.json | ConvertFrom-Json | Write-Output | Register-FMSchema
```

Registers all extension attributes in the json file as schema settings to apply when running Invoke-FMSchema.

## PARAMETERS

### -ObjectClass
The class to assign the new attribute to.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -OID
The unique OID of the attribute.

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

### -AdminDisplayName
The displayname of the attribute as admins see it.

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

### -LdapDisplayName
The name of the attribute as LDAP sees it.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 4
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -OMSyntax
The OM Syntax of the attribute

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: 5
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -AttributeSyntax
The syntax rules of the attribute.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 6
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -SingleValued
Whether the attribute is singlevalued.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -AdminDescription
The human friendly description of the attribute.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 7
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -SearchFlags
The search flags for the attribute.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: 8
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -PartialAttributeSet
Whether the attribute is part of a partial attribute set.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: True
Position: 9
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -AdvancedView
Whether this attribute is only shown in advanced view.
Use this to hide it from the default display, used to simplify display by hiding information not needed for regulaar daily tasks.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: True
Position: 10
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
