---
external help file: ForestManagement-help.xml
Module Name: ForestManagement
online version:
schema: 2.0.0
---

# Unregister-FMSchemaLdif

## SYNOPSIS
Removes a registered ldif file from the configured state.

## SYNTAX

```
Unregister-FMSchemaLdif [[-Name] <String[]>] [<CommonParameters>]
```

## DESCRIPTION
Removes a registered ldif file from the configured state.

## EXAMPLES

### EXAMPLE 1
```
Get-FMSchemaLdif | Unregister-FMSchemaLdif
```

Unregisters all registered ldif files.

## PARAMETERS

### -Name
The name to select the ldif file by.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
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
