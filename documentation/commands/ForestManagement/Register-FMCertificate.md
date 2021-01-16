---
external help file: ForestManagement-help.xml
Module Name: ForestManagement
online version:
schema: 2.0.0
---

# Register-FMCertificate

## SYNOPSIS
Register directory services certificates

## SYNTAX

### Certificate
```
Register-FMCertificate -Type <String> -Certificate <X509Certificate2> [<CommonParameters>]
```

### Authorative
```
Register-FMCertificate -Type <String> -Authorative <Boolean> [<CommonParameters>]
```

### Remove
```
Register-FMCertificate -Type <String> -Remove <String> [<CommonParameters>]
```

## DESCRIPTION
Register directory services certificates

## EXAMPLES

### EXAMPLE 1
```
Register-FMCertificate -Certificate $certificate -Type RootCA
```

Register a certiciate as RootCA certificate.

### EXAMPLE 2
```
Register-FMCertificate -Authorative -Type RootCA
```

Sets our current configuration as authorative, removing all non-listed certificates from the store.

### EXAMPLE 3
```
Register-FMCertificate -Remove $cert.Thumbprint -Type SubCA
```

Registers a certificate for removal from the SubCA list.

## PARAMETERS

### -Type
The kind of certificate this is.
Can be: NTAuthCA, RootCA, SubCA, CrossCA or KRA.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

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
Should the certificate configuration overwrite the existing configuration, rather than adding to it (default).

```yaml
Type: Boolean
Parameter Sets: Authorative
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Remove
Thumbprint of a certificate to remove rather than add.

```yaml
Type: String
Parameter Sets: Remove
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
