---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Register-DMGPLink

## SYNOPSIS
Registers a group policy link as a desired state.

## SYNTAX

### Path
```
Register-DMGPLink -PolicyName <String> -OrganizationalUnit <String> -Precedence <Int32> [-Tier <Int32>]
 [-ProcessingMode <String>] [-Present <Boolean>] [<CommonParameters>]
```

### Filter
```
Register-DMGPLink -PolicyName <String> -OUFilter <String> -Precedence <Int32> [-Tier <Int32>]
 [-ProcessingMode <String>] [-Present <Boolean>] [<CommonParameters>]
```

## DESCRIPTION
Registers a group policy link as a desired state.

## EXAMPLES

### EXAMPLE 1
```
Get-Content $configPath | ConvertFrom-Json | Write-Output | Register-DMGPLink
```

Import all GPLinks stored in the json file located at $configPath.

## PARAMETERS

### -PolicyName
The name of the group policy being linked.
Supports string expansion.

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

### -OrganizationalUnit
The organizational unit (or domain root) being linked to.
Supports string expansion.

```yaml
Type: String
Parameter Sets: Path
Aliases: OU

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -OUFilter
A filter string for an organizational unit.
The filter must be a wildcard-pattern supporting distinguishedname.

```yaml
Type: String
Parameter Sets: Filter
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Precedence
Numeric value representing the order it is linked in.
The lower the number, the higher on the list, the more relevant the setting.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Tier
The tier of a link is a priority ordering on top of Precedence.
While precedence determines order within a given tier, each tier is processed separately.
The higher the tier number, the higher the priority.
In additive mode, already existing linked policies have a Tier 0 priority.
If you want your own policies to be prepended, use Tier 1 or higher.
If you want your own policies to have the least priority however, user Tier -1 or lower.
Default: 1

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 1
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ProcessingMode
In which way GPO links are being processed:
- Additive: Add provided links, but do not modify the existing ones.
- Constrained: Replace existing links that are undesired
By default, constrained mode is being used.
If any single link for a given Organizational Unit is in constrained mode, the entire OU is processed under constraind mode.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: Constrained
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Present
Whether the link should be present at all.
Relevant in additive mode, to retain the capability to delete undesired links.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: True
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
