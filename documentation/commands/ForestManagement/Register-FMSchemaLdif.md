---
external help file: ForestManagement-help.xml
Module Name: ForestManagement
online version:
schema: 2.0.0
---

# Register-FMSchemaLdif

## SYNOPSIS
Registers an ldif file for validation and application.

## SYNTAX

```
Register-FMSchemaLdif [-Name] <String> [-Path] <String> [[-Weight] <Int32>]
 [[-MissingObjectExemption] <String[]>] [[-ContextName] <String>] [<CommonParameters>]
```

## DESCRIPTION
Registers an ldif file for validation and application.

## EXAMPLES

### EXAMPLE 1
```
Register-FMSchemaLdif -Name Skype -Path "$PSScriptRoot\skype.ldif"
```

Registers the Skype for Business schema extensions.

## PARAMETERS

### -Name
The name to register the file under.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path
The path to the file to register.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Weight
Ldif files will be applied in a certain order.
The weight of an Ldif file determines, the order it is applied in.
The lower the number, the earlier the file will be applied.

Default: 50

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: 50
Accept pipeline input: False
Accept wildcard characters: False
```

### -MissingObjectExemption
Testing in a forest will cause it to complain about all objects the ldif file tries to modify, not create and doesn't exist.
Using this parameter you can exempt individual classes from triggering this warning.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ContextName
The name of the context defining the setting.
This allows determining the configuration set that provided this setting.
Used by the ADMF, available to any other configuration management solution.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: <Undefined>
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
