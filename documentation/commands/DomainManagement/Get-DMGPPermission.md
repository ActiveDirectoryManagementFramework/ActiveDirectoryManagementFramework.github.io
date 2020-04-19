---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Get-DMGPPermission

## SYNOPSIS
Lists registered GP permission rules.

## SYNTAX

```
Get-DMGPPermission [[-GpoName] <String>] [[-Identity] <String>] [[-Filter] <String>] [-IsGlobal]
 [<CommonParameters>]
```

## DESCRIPTION
Lists registered GP permission rules.
These represent the desired state for how access to Group Policy Objects should be configured.

## EXAMPLES

### EXAMPLE 1
```
Get-DMGPPermmission
```

Returns all registered permissions.

## PARAMETERS

### -GpoName
The name of the GPO the rule was assigned to.

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

### -Identity
The name of trustee receiving permissions.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Filter
The filter string assigned to the access rule to return.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IsGlobal
Only return rules that apply to ALL GPOs globally.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
