---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Register-DMObject

## SYNOPSIS
Registers a generic object as the desired state for active directory.

## SYNTAX

```
Register-DMObject [-Path] <String> [[-Name] <String>] [-ObjectClass] <String> [[-Attributes] <Object>]
 [[-AttributesToResolve] <String[]>] [<CommonParameters>]
```

## DESCRIPTION
Registers a generic object as the desired state for active directory.
This allows defining custom objects not implemented as a commonly supported type.

## EXAMPLES

### EXAMPLE 1
```
Get-Content .\objects.json | ConvertFrom-Json | Write-Output | Register-DMObject
```

Imports all objects defined in objects.json.

## PARAMETERS

### -Path
The Path to the OU in which to place the object.
Subject to string insertion.

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

### -Name
Name of the object to define.
Subject to string insertion.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ObjectClass
The class of the object to define.

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

### -Attributes
Attributes to include in the object.
If you specify a hashtable, keys are mapped to attributes.
If you specify another arbitrary object type, properties are mapped to attributes.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -AttributesToResolve
The names of all attributes in configuration, for which you want to perform string insertion, before comparing with the actual object in AD.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
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
