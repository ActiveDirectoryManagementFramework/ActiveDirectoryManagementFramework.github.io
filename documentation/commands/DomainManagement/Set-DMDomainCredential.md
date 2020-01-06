---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Set-DMDomainCredential

## SYNOPSIS
Stores credentials stored for accessing the targeted domain.

## SYNTAX

```
Set-DMDomainCredential [-Domain] <String> [-Credential] <PSCredential> [<CommonParameters>]
```

## DESCRIPTION
Stores credentials stored for accessing the targeted domain.
This is NOT used by the main commands, but internally for retrieving data regarding foreign principals in one-way trusts.
Generally, these credentials should never have more than reading access to the target domain.

## EXAMPLES

### EXAMPLE 1
```
Set-DMDomainCredential -Domain contoso.com -Credential $cred
```

Stores the credentials for accessing contoso.com.

## PARAMETERS

### -Domain
The domain to store credentials for.
Does NOT accept wildcards.

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

### -Credential
The credentials to store.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: True
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
