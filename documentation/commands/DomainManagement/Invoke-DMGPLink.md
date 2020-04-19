---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Invoke-DMGPLink

## SYNOPSIS
Applies the desired group policy linking configuration.

## SYNTAX

```
Invoke-DMGPLink [[-InputObject] <Object>] [[-Server] <ComputerParameter>] [[-Credential] <PSCredential>]
 [-Disable] [-EnableException] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Applies the desired group policy linking configuration.
Use Register-DMGPLink to define the desired state.

Note: Invoke-DMGroupPolicy uses links to safely determine GPOs it can delete!
It will look for GPOs that have been linked to managed folders in order to avoid fragile name lookups.
Removing the old links before cleaning up the associated GPOs might leave orphaned GPOs in your domain.
To avoid deleting old links, use the -Disable parameter.

Recommended execution order:
- Invoke GPOs (without deletion)
- Invoke GPLinks (with -Disable)
- Invoke GPOs (with deletion)
- Invoke GPLinks (without -Disable)

## EXAMPLES

### EXAMPLE 1
```
Invoke-DMGPLink
```

Configures the current domain's group policy links as desired.

## PARAMETERS

### -InputObject
Test results provided by the associated test command.
Only the provided changes will be executed, unless none were specified, in which ALL pending changes will be executed.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Server
The server / domain to work with.

```yaml
Type: ComputerParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Credential
The credentials to use for this operation.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Disable
By default, undesired links are removed.
With this parameter set it will instead disable undesired links.
Use this in order to not lose track of previously linked GPOs.

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

### -EnableException
This parameters disables user-friendly warnings and enables the throwing of exceptions.
This is less user friendly, but allows catching exceptions in calling scripts.

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

### -WhatIf
If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
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
