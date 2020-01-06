---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Unregister-DMGroup

## SYNOPSIS
Removes a group that had previously been registered.

## SYNTAX

```
Unregister-DMGroup [[-Name] <String[]>] [<CommonParameters>]
```

## DESCRIPTION
Removes a group that had previously been registered.

## EXAMPLES

### EXAMPLE 1
```
Get-DMGroup | Unregister-DMGroup
```

Clears all registered groups.

## PARAMETERS

### -Name
The name of the group to remove.

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
