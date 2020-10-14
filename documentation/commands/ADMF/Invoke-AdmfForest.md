---
external help file: ADMF-help.xml
Module Name: ADMF
online version:
schema: 2.0.0
---

# Invoke-AdmfForest

## SYNOPSIS
Applies the currently desired configuration to the targeted forest.

## SYNTAX

```
Invoke-AdmfForest [[-Server] <ComputerParameter>] [[-Credential] <PSCredential>]
 [[-Options] <UpdateForestOptions[]>] [[-CredentialProvider] <String>] [-ContextPrompt] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Applies the currently desired configuration to the targeted forest.
By default, this will only include sites, sitelinks and subnets.

To switch to a full application, use the "-Options All" parameter.

## EXAMPLES

### EXAMPLE 1
```
Invoke-AdmfForest -Server contoso.com -Options All
```

Applies the full forest configuration to the contoso.com domain.

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
Which aspects to actually update.
Defaults to "default" (Sites, SiteLinks & Subnets)
Also available:
- ServerRelocate (reassigns domain controllers to correct sites, if necessary)
- Schema (applies core schema updates)
- SchemaLdif (applies product Ldif files, such as SkypeForBusiness)
To update everything, use "All".

```yaml
Type: UpdateForestOptions[]
Parameter Sets: (All)
Aliases:
Accepted values: Sites, Subnets, SiteLinks, Topology, ServerRelocate, Schema, SchemaLdif, NTAuthStore, Default, ForestLevel, ExchangeSchema, SchemaDefaultPermissions, AllSchema, All

Required: False
Position: 3
Default value: Default
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
