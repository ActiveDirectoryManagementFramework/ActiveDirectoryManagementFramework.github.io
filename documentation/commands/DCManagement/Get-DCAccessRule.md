---
external help file: DCManagement-help.xml
Module Name: DCManagement
online version:
schema: 2.0.0
---

# Get-DCAccessRule

## SYNOPSIS
Returns the list of registered filesystem access rules.

## SYNTAX

```
Get-DCAccessRule [[-Path] <String>] [[-Identity] <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns the list of registered filesystem access rules.

## EXAMPLES

### EXAMPLE 1
```
Get-DCAccessRule
```

Returns the list of all registered filesystem access rules.

## PARAMETERS

### -Path
Filter by the path it is assigned to.
Defaults to: '*'

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

### -Identity
Filter by the Identity granted permissions to.
Default to: '*'

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
