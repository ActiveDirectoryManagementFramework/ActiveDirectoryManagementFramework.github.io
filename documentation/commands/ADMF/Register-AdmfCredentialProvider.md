---
external help file: ADMF-help.xml
Module Name: ADMF
online version:
schema: 2.0.0
---

# Register-AdmfCredentialProvider

## SYNOPSIS
Registers a credential provider used by the ADMF.

## SYNTAX

```
Register-AdmfCredentialProvider [-Name] <String> [-PreScript] <ScriptBlock> [[-PostScript] <ScriptBlock>]
 [<CommonParameters>]
```

## DESCRIPTION
Registers a credential provider used by the ADMF.

Credential providers are used for translating the credentials to use for all actions performed against active directory.
For example, the ADMF could be extended to support a password safe solution:
When connecting to a target domain, this provider scriptblock would retrieve the required credentials from a password safe solution.

A credential provider consists of two scriptblocks:
- A PreScript that is executed before running any commands.
It must return either a PSCredential object (if applicable) or $null (if default windows credentials should be used instead).
- A PostScript that is executed after all component commands have been executed.
It need not return anything.

Both scriptblocks receive a single input object, with two properties:
- Server: The computer / domain targeted
- Credential: The credentials originally provided (if any - this may be $null instead!)

## EXAMPLES

### EXAMPLE 1
```
Register-AdmfCredentialProvider -Name AZKeyVault -PreScript $keyVaultScript
```

Registers the scriptblock defined in $keyVaultScript as "AZKeyVault" provider.

## PARAMETERS

### -Name
The name of the credential provider.
Each name must be unique, registering a provider using an existing name overwrites the previous provider.
The provider "default" exists as part of ADMF and will be used if no other is specified.
Overriding it allows you to change the default provider intentionally,
but may remove your ability to NOT use any credential transformations, so use with care.

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

### -PreScript
The script to execute before performing actions, in order to resolve the correct credentials to use.
- If it returns a credential object, this object will be used for authenticating all AD operations (including WinRM against domain controllers!).
- If it returns nothing / only non-credential objects, instead the default windows identity of the user is used.

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PostScript
This script is executed after performing all actions.
You can use this optional script to perform any cleanup actions if necessary.

```yaml
Type: ScriptBlock
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
