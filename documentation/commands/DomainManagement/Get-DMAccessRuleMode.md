---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Get-DMAccessRuleMode

## SYNOPSIS
Retrieve registered AccessRule processing modes.

## SYNTAX

```
Get-DMAccessRuleMode [[-Path] <String>] [[-ObjectCategory] <String>] [<CommonParameters>]
```

## DESCRIPTION
Retrieve registered AccessRule processing modes.
These are used to define, how AccessRules will be processed.

## EXAMPLES

### EXAMPLE 1
```
Get-DMAccessRuleMode
```

List all registered AccessRule processing modes.

## PARAMETERS

### -Path
Filter by the path the AccessRule processing mode applies to.

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

### -ObjectCategory
Filter by the object category the AccessRule processing mode applies to.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
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
