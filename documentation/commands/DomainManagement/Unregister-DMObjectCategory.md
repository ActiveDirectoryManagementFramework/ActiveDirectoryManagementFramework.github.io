---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Unregister-DMObjectCategory

## SYNOPSIS
Removes an object category from the list of registered object categories.

## SYNTAX

```
Unregister-DMObjectCategory [-Name] <String[]> [<CommonParameters>]
```

## DESCRIPTION
Removes an object category from the list of registered object categories.
See description on Register-DMObjectCategory for details on object categories in general.

## EXAMPLES

### EXAMPLE 1
```
Get-DMObjectCategory | Unregister-DMObjectCategory
```

Clears all registered object categories.

## PARAMETERS

### -Name
The exact name of the object category to unregister.

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
