---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Set-DMContentMode

## SYNOPSIS
Configures the way the module handles domain level objects not defined in configuration.

## SYNTAX

```
Set-DMContentMode [[-Mode] <String>] [[-Include] <String[]>] [[-Exclude] <String[]>]
 [[-UserExcludePattern] <String[]>] [<CommonParameters>]
```

## DESCRIPTION
Configures the way the module handles domain level objects not defined in configuration.
Depending on the desired domain configuration, dealing with undesired objects may be desirable.

This module handles the following configurations:
Mode Additive: In this mode, all configured content is considered in addition to what is already there.
Objects not in scope of the configuration are ignored.
Mode Constrained: In this mode, objects not configured are handled based on OU rules:
- Include: If Include OUs are configured, only objects in the specified OUs are under management.
Only objects in these OUs will be considered for deletion if not configured.
- Exclude: If Exclude OUs are configured, objects in the excluded OUs are ignored, all objects outside of these OUs will be considered for deletion if not configured.
If both Include and Exclude OUs are configured, they are merged without applying the implied top-level Include of an Exclude-only configuration.
In this scenario, if a top-level Include is desired, it needs to be explicitly set.

When specifying Include and Exclude OUs, specify the full DN, inserting '%DomainDN%' (without the quotes) for the domain root.

## EXAMPLES

### EXAMPLE 1
```
Set-DMContentMode -Mode 'Constrained' -Include 'OU=Administration,%DomainDN%'
```

Enables Constrained mode and configures the top-level OU "Administration" as an OU under management.

## PARAMETERS

### -Mode
The mode to operate under.
In Additive mode, objects not configured are being ignored.
In Constrained mode, objects not configured may still be under maanagement, depending on Include and Exclude rules.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Include
OUs in which to look for objects under management.
Use this to explicitly list which OUs should be inspected for objects to delete.
Only applied in Constrained mode.
Specify the full DN, inserting '%DomainDN%' (without the quotes) for the domain root.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Exclude
OUs in which to NOT look for objects under management.
All other OUs are subject to management and having undesired objects deleted.
Only applied in Constrained mode.
Specify the full DN, inserting '%DomainDN%' (without the quotes) for the domain root.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserExcludePattern
Regex expressions that are applied to the name property of user objects found in AD.
By default, in Constrained mode, all users found in paths resolved to be under management (through -Include and -Exclude specified in this command) that are not configured will be flagged for deletion.
Using this parameter, it becomes possible to exempt specific accounts or accounts according to a specific pattern from this.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
