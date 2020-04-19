---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Test-DMGPPermission

## SYNOPSIS
Tests whether the existing Group Policy permissions reflect the desired state.

## SYNTAX

```
Test-DMGPPermission [[-Server] <ComputerParameter>] [[-Credential] <PSCredential>] [-EnableException]
 [<CommonParameters>]
```

## DESCRIPTION
Tests whether the existing Group Policy permissions reflect the desired state.
Use Register-DMGPPermission and Register-DMGPPermissionFilter to define the desired state.

## EXAMPLES

### EXAMPLE 1
```
Test-DMGPPermission -Server corp.contoso.com
```

Tests whether the domain of corp.contoso.com has the desired GP Permission configuration.

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
