---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Test-DMServiceAccount

## SYNOPSIS
Tests whether the currently deployed service accoaunts match the configured desired state.

## SYNTAX

```
Test-DMServiceAccount [[-Server] <ComputerParameter>] [[-Credential] <PSCredential>] [<CommonParameters>]
```

## DESCRIPTION
Tests whether the currently deployed service accoaunts match the configured desired state.
Use Register-DMServiceAccount to define the desired state.

## EXAMPLES

### EXAMPLE 1
```
Test-DMServiceAccount -Server contoso.com
```

Tests whether the service accounts in the contoso.com domain are compliant with the desired state.

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
