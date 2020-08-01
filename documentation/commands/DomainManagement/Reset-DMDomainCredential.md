---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Reset-DMDomainCredential

## SYNOPSIS
Resets cached credentials for contacting domains.

## SYNTAX

### Credential
```
Reset-DMDomainCredential -Credential <PSCredential> [<CommonParameters>]
```

### Domain
```
Reset-DMDomainCredential -Domain <String> [<CommonParameters>]
```

### Name
```
Reset-DMDomainCredential -UserName <String> [<CommonParameters>]
```

### All
```
Reset-DMDomainCredential [-All] [<CommonParameters>]
```

## DESCRIPTION
Resets cached credentials for contacting domains.
Use this command when invalidating credentials you used.
For example in ADMF the credential provider:
If you create one that uses a temporary account, then delete it when done, you need to reset the cache when connecting with your default credentials.

## EXAMPLES

### EXAMPLE 1
```
Reset-DMDomainCredential -All
```

Clear all cached credentials

## PARAMETERS

### -Credential
Clear all cache entries using this credential object.

```yaml
Type: PSCredential
Parameter Sets: Credential
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Domain
Clear the cached credentials for the target domain.

```yaml
Type: String
Parameter Sets: Domain
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserName
Clear all cached credentials using this username.

```yaml
Type: String
Parameter Sets: Name
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -All
Clear ALL cached credentials

```yaml
Type: SwitchParameter
Parameter Sets: All
Aliases:

Required: True
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
