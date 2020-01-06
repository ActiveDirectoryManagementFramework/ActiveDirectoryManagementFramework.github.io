---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Invoke-DMGroupPolicy

## SYNOPSIS
Brings the group policy settings into compliance with the desired state.

## SYNTAX

```
Invoke-DMGroupPolicy [-Delete] [[-Server] <ComputerParameter>] [[-Credential] <PSCredential>]
 [-EnableException] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Brings the group policy settings into compliance with the desired state.
Define the desired state by using Register-DMGroupPolicy.
Note: The original export will need to be carefully crafted to fit this system.
TODO: Add definition on how to provide the GPO export,

## EXAMPLES

### EXAMPLE 1
```
Invoke-DMGroupPolicy -Server fabrikam.com
```

Brings the group policy settings from the domain fabrikam.com into compliance with the desired state.

### EXAMPLE 2
```
Invoke-DMGroupPolicy -Server fabrikam.com -Delete
```

Brings the group policy settings from the domain fabrikam.com into compliance with the desired state.
Will also delete all deprecated policies linked to the managed infrastructure.

## PARAMETERS

### -Delete
By default, this command will NOT delete group policies, in order to avoid accidentally locking yourself out of the system.
Use this parameter to delete group policies that are no longer needed.

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

### -Server
The server / domain to work with.

```yaml
Type: ComputerParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
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
Position: 2
Default value: None
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
