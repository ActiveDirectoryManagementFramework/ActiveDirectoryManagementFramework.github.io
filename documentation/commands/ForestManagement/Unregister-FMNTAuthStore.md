---
external help file: ForestManagement-help.xml
Module Name: ForestManagement
online version:
schema: 2.0.0
---

# Unregister-FMNTAuthStore

## SYNOPSIS
Removes a certificate definition for the NTAuthStore.

## SYNTAX

```
Unregister-FMNTAuthStore [[-Thumbprint] <String[]>] [<CommonParameters>]
```

## DESCRIPTION
Removes a certificate definition for the NTAuthStore.
See Register-FMNTAuthStore tfor details on defining a certificate.

## EXAMPLES

### EXAMPLE 1
```
Get-FMNTAuthStore | Unregister-FMNTAuthStore
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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
