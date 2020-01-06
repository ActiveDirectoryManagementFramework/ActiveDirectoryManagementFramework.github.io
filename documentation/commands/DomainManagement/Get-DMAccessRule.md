---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Get-DMAccessRule

## SYNOPSIS
Returns the list of configured access rules.

## SYNTAX

```
Get-DMAccessRule [[-Identity] <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns the list of configured access rules.
These access rules define the desired state where delegation in a domain is concerned.
This is consumed by Test-DMAccessRule, see the help on that command for more details.

## EXAMPLES

### EXAMPLE 1
```
Get-DMAccessRule
```

Returns a list of all registered accessrules

## PARAMETERS

### -Identity
The Identity to filter by.
This allows swiftly filtering by who is being granted permission.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
