---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Register-DMGPPermission

## SYNOPSIS
Registers a GP permission as the desired state.

## SYNTAX

### ExplicitNoChange
```
Register-DMGPPermission -GpoName <String> [-NoPermissionChange] [-Managed] [-ContextName <String>]
 [<CommonParameters>]
```

### Explicit
```
Register-DMGPPermission -GpoName <String> -Identity <String> -ObjectClass <String> -Permission <String> [-Deny]
 [-Managed] [-ContextName <String>] [<CommonParameters>]
```

### FilterNoChange
```
Register-DMGPPermission -Filter <String> [-NoPermissionChange] [-Managed] [-ContextName <String>]
 [<CommonParameters>]
```

### Filter
```
Register-DMGPPermission -Filter <String> -Identity <String> -ObjectClass <String> -Permission <String> [-Deny]
 [-Managed] [-ContextName <String>] [<CommonParameters>]
```

### AllNoChange
```
Register-DMGPPermission [-All] [-NoPermissionChange] [-Managed] [-ContextName <String>] [<CommonParameters>]
```

### All
```
Register-DMGPPermission [-All] -Identity <String> -ObjectClass <String> -Permission <String> [-Deny] [-Managed]
 [-ContextName <String>] [<CommonParameters>]
```

## DESCRIPTION
Registers a GP permission as the desired state.

Permissions can be applied in three ways:
- Explicitly to a specific GPO
- To ALL GPOs
- To GPOs that match a specific filter string.

For defining filter conditions, see the help on Register-DMGPPermissionFilter.

Another important concept is the "Managed" concept.
By default, all GPOs are considered unmanaged, where GP Permissions are concerned.
This means, any additional permissionss that have been applied are ok.
By setting a GPO's permissions under management - by applying a permission rule that uses the -Managed parameter - any permissions not defined for it will be removed.

## EXAMPLES

### EXAMPLE 1
```
Get-Content .\gpopermissions.json | ConvertFrom-Json | Write-Output | Register-DMGPPermission
```

Reads all settings from the provided json file and registers them.

## PARAMETERS

### -GpoName
Name of the GPO this permission applies to.
Subject to string insertion.

```yaml
Type: String
Parameter Sets: ExplicitNoChange, Explicit
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Filter
The filter condition governing, what GPOs these permissions apply to.
A filter string can consist of the following elements:
- Names of filter conditions
- Logical operators
- Parenthesis

Example filter strings:
- 'IsManaged'
- 'IsManaged -and -not (IsDomainDefault -or IsDomainControllerDefault)'
- '-not (IsManaged) -and (IsTier1 -or IsSupport)'

```yaml
Type: String
Parameter Sets: FilterNoChange, Filter
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -All
This access rule applies to ALL GPOs.

```yaml
Type: SwitchParameter
Parameter Sets: AllNoChange, All
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Identity
The group or user to assign permissions to.
Subject to string insertion.

```yaml
Type: String
Parameter Sets: Explicit, Filter, All
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ObjectClass
What kind of object the assigned identity is.
Can be any legal object class in AD.
Only object classes that have a SID should be chosen though (otherwise, assigning permissions to it gets kind of difficult).

```yaml
Type: String
Parameter Sets: Explicit, Filter, All
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Permission
What kind of permission to grant.

```yaml
Type: String
Parameter Sets: Explicit, Filter, All
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Deny
Whether to create a Deny rule, rather than an Allow rule.

```yaml
Type: SwitchParameter
Parameter Sets: Explicit, Filter, All
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -NoPermissionChange
Disable application of a set of permissions.
Setting this flag allows defining a rule that only applies the "Managed" state (see below).

```yaml
Type: SwitchParameter
Parameter Sets: ExplicitNoChange, FilterNoChange, AllNoChange
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Managed
Whether the affected GPOs should be considered "Under Management".
A GPO "Under Management" will have all non-defined permissions removed.

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
