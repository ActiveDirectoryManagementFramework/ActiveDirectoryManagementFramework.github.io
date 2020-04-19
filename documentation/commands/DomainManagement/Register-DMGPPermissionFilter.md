---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Register-DMGPPermissionFilter

## SYNOPSIS
Registers a GP Permission filter rule.

## SYNTAX

### Managed
```
Register-DMGPPermissionFilter -Name <String> [-Reverse] -Managed <Boolean> [-ContextName <String>]
 [<CommonParameters>]
```

### Path
```
Register-DMGPPermissionFilter -Name <String> [-Reverse] -Path <String> [-PathScope <String>] [-PathOptional]
 [-ContextName <String>] [<CommonParameters>]
```

### GPName
```
Register-DMGPPermissionFilter -Name <String> [-Reverse] -GPName <String> [-GPNameMode <String>]
 [-ContextName <String>] [<CommonParameters>]
```

## DESCRIPTION
Registers a GP Permission filter rule.
These rules are used to apply GP Permissions not on any one specific object but on any number of GPOs that match the defined rule.
For example it is possible to define rules that match GPOs by name, that apply to all GPOs defined in configuration or to GPOs linked under a specific OU structure.

## EXAMPLES

### EXAMPLE 1
```
Get-Content .\gppermissionfilter.json | ConvertFrom-Json | Write-Output | Register-DMGPPermissionFilter
```

Reads all registered filters from the input file and registers them for use in testing Group Policy Permissionss.

## PARAMETERS

### -Name
Name of the filter rule.
Must only contain letters, numbers and underscore.

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

### -Reverse
Reverses the result of the rule.
This combined with another condition allows reversing the result.
For example, combined with a Path condition, this would make the filter match any GPO NOT linked to that path.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Managed
Matches GPOs that are defined by ADMF ($true) or not so ($false).

```yaml
Type: Boolean
Parameter Sets: Managed
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Path
Matches GPOs that have been linked to the specified organizational unit (or potentially OUs beneath it).
Subject to name insertion.

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

### -PathScope
Defines how the path rule is applied:
- Base:     Only the specified OU's linked GPOs are evaluated (default).
- OneLevel: Only the OU's directly beneath the specified OU are evaluated for linked GPOs.
- SubTree:  All OUs under the specified path are avaluated for linked GPOs.

```yaml
Type: String
Parameter Sets: Path
Aliases:

Required: False
Position: Named
Default value: Base
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -PathOptional
Whether the path is optional.
By default, when evaluating a path filter, processing of GP permission terminates if the designated path does not exist, as we cannot guarantee a consistent permission-set being applied.
With this setting enabled, instead processing silently continues.
(Even if this is enabled, a silent log entry will be added  for tracking purposes!)

```yaml
Type: SwitchParameter
Parameter Sets: Path
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -GPName
Name of the GP to filter for.
This can be a wildcard or regex match, depending on the -GPNameMode parameter, however by default an exact match is required.
Subject to name insertion.

```yaml
Type: String
Parameter Sets: GPName
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -GPNameMode
How exactly the GPName parameter is applied:
- Explicit: An exact name equality is required (default)
- Wildcard: Supports wildcard comparisons (using the -like operator)
- Regex:    Supports regex matching (using the -match operator)
None of the three options is case sensitive.

```yaml
Type: String
Parameter Sets: GPName
Aliases:

Required: False
Position: Named
Default value: Explicit
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ContextName
The name of the context defining the setting.
This allows determining the configuration set that provided this setting.
Used by the ADMF, available to any other configuration management solution.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: <Undefined>
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
