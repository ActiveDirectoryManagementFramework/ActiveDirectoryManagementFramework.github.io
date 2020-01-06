---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Unregister-DMGroupPolicy

## SYNOPSIS
Removes a group policy object from the list of desired gpos.

## SYNTAX

```
Unregister-DMGroupPolicy [-Name] <String[]> [<CommonParameters>]
```

## DESCRIPTION
Removes a group policy object from the list of desired gpos.

## EXAMPLES

### EXAMPLE 1
```
Get-DMGroupPolicy | Unregister-DMGroupPolicy
```

Clears all configured GPOs

## PARAMETERS

### -Name
The name of the GPO to remove from the list of ddesired gpos

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: DisplayName

Required: True
Position: 1
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
