---
external help file: DCManagement-help.xml
Module Name: DCManagement
online version:
schema: 2.0.0
---

# Unregister-DCShare

## SYNOPSIS
Removes a specific share from the list of registered shares.

## SYNTAX

```
Unregister-DCShare [-Name] <String[]> [<CommonParameters>]
```

## DESCRIPTION
Removes a specific share from the list of registered shares.

## EXAMPLES

### EXAMPLE 1
```
Get-DCShare | Unregister-DCShare
```

Clears all registered shares.

## PARAMETERS

### -Name
The exact name of the share to unregister.

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
