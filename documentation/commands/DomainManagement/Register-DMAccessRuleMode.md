---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Register-DMAccessRuleMode

## SYNOPSIS
Register the processing mode for access rules on a specified object.

## SYNTAX

### Path
```
Register-DMAccessRuleMode -Path <String> [-PathMode <String>] -Mode <String> [<CommonParameters>]
```

### Category
```
Register-DMAccessRuleMode -ObjectCategory <String> -Mode <String> [<CommonParameters>]
```

## DESCRIPTION
Register the processing mode for access rules on a specified object.
This is used by the AccessRule Component exclusively.

## EXAMPLES

### EXAMPLE 1
```
Register-DMAccessRuleMode -Path 'OU=Company,%DomainDN%' -PathMode SubTree -Mode Additive
```

Configures the specified OU and all items beneath it to be in additive mode.
Defined AccessRules will be applied if missing, but previously existing rules remain untouched.

## PARAMETERS

### -Path
The path to the AD object to govern.
This should be a distinguishedname.
This path uses name resolution.
For example %DomainDN% will be replaced with the DN of the target domain itself (and should probably be part of everyy single path).

```yaml
Type: String
Parameter Sets: Path
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -PathMode
Whether to only target a specific path or the target path and all items beneath it.

```yaml
Type: String
Parameter Sets: Path
Aliases:

Required: False
Position: Named
Default value: SingleItem
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ObjectCategory
Instead of a path, define a category to apply the processing mode to.
Categories are defined using Register-DMObjectCategory.
This allows you to apply processing mode to a category of objects, rather than a specific path.
With this you could apply a processing mode to all domain controller objects, for example.

```yaml
Type: String
Parameter Sets: Category
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Mode
Determines, how the AccessRules are applied on the target object:
- Constrained: All non-defined AccessRules will be removed.
- Defined: Only non-defined AccessRules with identities for which a configuration exists on the object will be deleted.
- Additive: Non-defined AccessRules on the targeted object will be ignored.
By default, with no AccessRuleMode defined, all objects are considered to be in Constrained mode.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
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
