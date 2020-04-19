---
external help file: ForestManagement-help.xml
Module Name: ForestManagement
online version:
schema: 2.0.0
---

# Register-FMNTAuthStore

## SYNOPSIS
Register NTAuthStore certificates

## SYNTAX

### Certificate
```
Register-FMNTAuthStore -Certificate <X509Certificate2> [<CommonParameters>]
```

### Authorative
```
Register-FMNTAuthStore [-Authorative] [<CommonParameters>]
```

## DESCRIPTION
Register NTAuthStore certificates
This is the ideal / desired state for the NTAuthStore certificate configuration.
Forests will be brought into this state by using Invoke-FMNTAuthStore.

## EXAMPLES

### EXAMPLE 1
```
Register-FMNTAuthStore -Certificate $NTAuthStoreCertificate
```

Register a certiciate.

### EXAMPLE 2
```
Register-FMNTAuthStore -Authorative
```

Sets our current configuration as authorative, removing all non-listed certificates from the store.

## PARAMETERS

### -Certificate
The certifcate to apply.

```yaml
Type: X509Certificate2
Parameter Sets: Certificate
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Authorative
Should the NTAuthStore configuration overwrite the existing configuration, rather than adding to it (default).

```yaml
Type: SwitchParameter
Parameter Sets: Authorative
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
