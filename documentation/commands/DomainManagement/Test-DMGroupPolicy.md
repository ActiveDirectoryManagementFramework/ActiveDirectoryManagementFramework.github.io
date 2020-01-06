---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Test-DMGroupPolicy

## SYNOPSIS
Tests whether the current domain has the desired group policy setup.

## SYNTAX

```
Test-DMGroupPolicy [[-Server] <ComputerParameter>] [[-Credential] <PSCredential>] [-EnableException]
 [<CommonParameters>]
```

## DESCRIPTION
Tests whether the current domain has the desired group policy setup.
Based on timestamps and IDs it will detect for existing OUs, whether the currently deployed version:
- Is based on the latest GPO version
- has been changed since being last deployed (In which case it is configured to restore itself to its intended state)
Ignores GPOs not linked to managed OUs.

## EXAMPLES

### EXAMPLE 1
```
Test-DMGroupPolicy -Server contoso.com
```

Validates that the contoso domain's group policies are in the desired state

## PARAMETERS

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
