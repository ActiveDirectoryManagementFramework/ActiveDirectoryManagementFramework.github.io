---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Unregister-DMAccessRule

## SYNOPSIS
Removes a registered accessrule from the list of desired rules.

## SYNTAX

```
Unregister-DMAccessRule [[-RuleObject] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Removes a registered accessrule from the list of desired rules.

## EXAMPLES

### EXAMPLE 1
```
Get-DMAccessRule | Unregister-DMAccessRule
```

Removes all registered Access Rules, clearing the desired state of rules.

## PARAMETERS

### -RuleObject
The rule object to remove.
Must be returned by Get-DMAccessRule

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
