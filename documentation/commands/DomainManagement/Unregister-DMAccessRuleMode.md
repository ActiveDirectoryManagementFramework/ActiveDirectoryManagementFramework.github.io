---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Unregister-DMAccessRuleMode

## SYNOPSIS
Removes previously registered AccessRule processing modes.

## SYNTAX

```
Unregister-DMAccessRuleMode [[-Identity] <String>] [[-Path] <String>] [[-ObjectCagegory] <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Removes previously registered AccessRule processing modes.
Prioritizes Identity over Path over ObjectCategory.

## EXAMPLES

### EXAMPLE 1
```
Get-DMAccessRuleMode | Unregister-DMAccessRuleMode
```

Clears all registered AccessRule processing modes.

## PARAMETERS

### -Identity
The Identity of the AccessRule processing mode to remove.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Path
The Path of the AccessRule processing mode to remove.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ObjectCagegory
The ObjectCategory of the AccessRule processing mode to remove.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
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
