---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Test-DMDomainLevel

## SYNOPSIS
Tests whether the target domain has at least the desired functional level.

## SYNTAX

```
Test-DMDomainLevel [[-Server] <ComputerParameter>] [[-Credential] <PSCredential>] [<CommonParameters>]
```

## DESCRIPTION
Tests whether the target domain has at least the desired functional level.

## EXAMPLES

### EXAMPLE 1
```
Test-DMDomainLevel -Server contoso.com
```

Tests whether the domain contoso.com has at least the desired functional level.

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
