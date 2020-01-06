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
Register-FMSchemaLdif [-Name] <String> [-Path] <String> [<CommonParameters>]
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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
