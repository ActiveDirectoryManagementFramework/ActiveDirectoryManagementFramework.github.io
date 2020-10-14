---
external help file: ADMF-help.xml
Module Name: ADMF
online version:
schema: 2.0.0
---

# Set-AdmfContext

## SYNOPSIS
Applies a set of configuration contexts.

## SYNTAX

### name (Default)
```
Set-AdmfContext -Context <Object[]> [-ReUse] [-DefineOnly] [-Server <ComputerParameter>]
 [-Credential <PSCredential>] [-NoDomain] [-EnableException] [<CommonParameters>]
```

### interactive
```
Set-AdmfContext [-Interactive] [-ReUse] [-DefineOnly] [-Server <ComputerParameter>]
 [-Credential <PSCredential>] [-NoDomain] [-EnableException] [<CommonParameters>]
```

## DESCRIPTION
Applies a set of configuration contexts.
This merges the settings from all selected contexts into one configuration set.

## EXAMPLES

### EXAMPLE 1
```
Set-AdmfContext -Interactive
```

Interactively pick to select the contexts to apply to the user's own domain.

### EXAMPLE 2
```
Set-AdmfContext -Interactive -Server contoso.com
```

Interactively pick to select the contexts to apply to the contoso.com domain.

### EXAMPLE 3
```
Set-AdmfContext -Context Default, Production, Europe -Server eu.contoso.com
```

Configures the contexts Default, Production and Europe to be applied to eu.contoso.com.

## PARAMETERS

### -Context
Name of context or full context object to apply.

```yaml
Type: Object[]
Parameter Sets: name
Aliases: Name

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Interactive
Show an interactive context selection prompt.
This is designed for greater convenience when managing many forests.
The system automatically uses Set-AdmfContext with this parameter when directly testing or invoking against a new domain without first selecting a context to apply.

```yaml
Type: SwitchParameter
Parameter Sets: interactive
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ReUse
ADMF remembers the last contexts assigned to a specific server/domain.
By setting this parameter, it will re-use those contexts, rather than show the prompt again.
This parameter is used by the system to prevent prompting automatically on each call.

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

### -DefineOnly
Do not actually switch configuration sets.
Just register the selected Contexts to the target domain, after validating the selection.

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
Position: Named
Default value: $env:USERDNSDOMAIN
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
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoDomain
If used against a target without a domain, it will skip AD connect and instead use the server name for Context caching purposes.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
