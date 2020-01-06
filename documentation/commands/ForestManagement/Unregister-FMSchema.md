---
external help file: ForestManagement-help.xml
Module Name: ForestManagement
online version:
schema: 2.0.0
---

# Unregister-FMSchema

## SYNOPSIS
Removes a configured schema extension.

## SYNTAX

```
Unregister-FMSchema [[-Name] <String[]>] [<CommonParameters>]
```

## DESCRIPTION
Removes a configured schema extension.

## EXAMPLES

### EXAMPLE 1
```
Unregister-FMSchema -Name $names
```

Removes the list of names stored in $names from the registered schema extension configurations.

## PARAMETERS

### -Name
Name(s) of the schema extensions to unregister.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: AdminDisplayName

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
