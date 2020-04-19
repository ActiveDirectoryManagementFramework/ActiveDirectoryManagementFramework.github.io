---
external help file: ForestManagement-help.xml
Module Name: ForestManagement
online version:
schema: 2.0.0
---

# Get-FMNTAuthStore

## SYNOPSIS
Returns registered NTAuthStore Certificates.

## SYNTAX

```
Get-FMNTAuthStore [[-Thumbprint] <String>] [[-Name] <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns registered NTAuthStore Certificates.

## EXAMPLES

### EXAMPLE 1
```
Get-FMNTAuthStore
```

Returns all registered certificates intended for the NTAuthStore

## PARAMETERS

### -Thumbprint
The thumbprint of the certificate to filter by.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
The name of the certificate to filter by.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
