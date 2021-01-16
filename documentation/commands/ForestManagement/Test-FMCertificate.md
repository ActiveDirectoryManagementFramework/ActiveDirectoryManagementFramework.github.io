---
external help file: ForestManagement-help.xml
Module Name: ForestManagement
online version:
schema: 2.0.0
---

# Test-FMCertificate

## SYNOPSIS
Tests, whether the certificate stores are in the desired state.

## SYNTAX

```
Test-FMCertificate [[-Server] <ComputerParameter>] [[-Credential] <PSCredential>] [<CommonParameters>]
```

## DESCRIPTION
Tests, whether the certificate stores are in the desired state, that is, all defined certificates are already in place.
Use Register-FMCertificate to define desired the desired state.

## EXAMPLES

### EXAMPLE 1
```
Test-FMCertificate -Server contoso.com
```

Checks whether the contoso.com forest has all the certificates it should

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
