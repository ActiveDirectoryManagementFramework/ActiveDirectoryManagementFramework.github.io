---
external help file: ForestManagement-help.xml
Module Name: ForestManagement
online version:
schema: 2.0.0
---

# Unregister-FMCertificate

## SYNOPSIS
Removes a certificate definition for the NTAuthStore.

## SYNTAX

```
Unregister-FMCertificate [[-Thumbprint] <String[]>] [[-Certificate] <X509Certificate2[]>] [<CommonParameters>]
```

## DESCRIPTION
Removes a certificate definition for the NTAuthStore.
See Register-FMCertificate tfor details on defining a certificate.

## EXAMPLES

### EXAMPLE 1
```
Get-FMCertificate | Unregister-FMCertificate
```

Clears all certificates from the list of defined NTAuth certificates

## PARAMETERS

### -Thumbprint
The thumbprint of the certificate to remove.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Certificate
The certificate to remove.

```yaml
Type: X509Certificate2[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
