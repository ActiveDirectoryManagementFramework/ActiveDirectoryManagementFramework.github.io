---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Test-DMGPRegistrySetting

## SYNOPSIS
Validates, whether a GPO's defined registry settings have been applied.

## SYNTAX

```
Test-DMGPRegistrySetting [-PolicyName] <String> [-PassThru] [[-Server] <ComputerParameter>]
 [[-Credential] <PSCredential>] [<CommonParameters>]
```

## DESCRIPTION
Validates, whether a GPO's defined registry settings have been applied.
To define a GPO, use Register-DMGroupPolicy
To define a GPO's associated registry settings, use Register-DMGPRegistrySetting

Note: While it is theoretically possible to define a GPO registry setting without defining the GPO it is attached to, these settings will not be applied anyway, as processing is directly tied into the Group Policy invocation process.

## EXAMPLES

### EXAMPLE 1
```
Test-DMGPRegistrySetting @parameters -PolicyName $policy
```

Tests, whether the specified GPO has all the desired registry keys configured.

## PARAMETERS

### -PolicyName
Name of the GPO to scan for compliance.
Subject to advanced string insertion.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PassThru
Returns result objects, rather than boolean values.
Useful for better reporting and integration into the test-* workflow.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
