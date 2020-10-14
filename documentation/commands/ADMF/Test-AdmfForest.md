---
external help file: ADMF-help.xml
Module Name: ADMF
online version:
schema: 2.0.0
---

# Test-AdmfForest

## SYNOPSIS
Tests whether a forest is configured according to baseline configuration

## SYNTAX

```
Test-AdmfForest [[-Server] <ComputerParameter>] [[-Credential] <PSCredential>]
 [[-Options] <UpdateForestOptions[]>] [[-CredentialProvider] <String>] [-ContextPrompt] [<CommonParameters>]
```

## DESCRIPTION
Tests whether a forest is configured according to baseline configuration

## EXAMPLES

### EXAMPLE 1
```
Test-AdmfForest
```

Test the current forest for baseline compliance.

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

### -Options
What tests to execute.
Defaults to all tests.

```yaml
Type: UpdateForestOptions[]
Parameter Sets: (All)
Aliases:
Accepted values: Sites, Subnets, SiteLinks, Topology, ServerRelocate, Schema, SchemaLdif, NTAuthStore, Default, ForestLevel, ExchangeSchema, SchemaDefaultPermissions, AllSchema, All

Required: False
Position: 3
Default value: All
Accept pipeline input: False
Accept wildcard characters: False
```

### -CredentialProvider
The credential provider to use to resolve the input credentials.
See help on Register-AdmfCredentialProvider for details.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: Default
Accept pipeline input: False
Accept wildcard characters: False
```

### -ContextPrompt
Force displaying the Context selection User Interface.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: Ctx

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
