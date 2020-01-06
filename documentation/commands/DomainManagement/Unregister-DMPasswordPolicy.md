---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Unregister-DMPasswordPolicy

## SYNOPSIS
Remove a PSO from the list of desired PSOs that are applied to a domain.

## SYNTAX

```
Unregister-DMPasswordPolicy [-Name] <String[]> [<CommonParameters>]
```

## DESCRIPTION
Remove a PSO from the list of desired PSOs that are applied to a domain.

## EXAMPLES

### EXAMPLE 1
```
Unregister-DMPasswordPolicy -Name "T0 Admin Policy"
```

Removes the "T0 Admin Policy" policy.

## PARAMETERS

### -Name
The name of the PSO to remove.

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
