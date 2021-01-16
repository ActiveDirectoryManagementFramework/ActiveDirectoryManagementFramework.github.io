---
external help file: ForestManagement-help.xml
Module Name: ForestManagement
online version:
schema: 2.0.0
---

# Get-FMCertificate

## SYNOPSIS
Returns registered Certificates.

## SYNTAX

```
Get-FMCertificate [[-Thumbprint] <String>] [[-Name] <String>] [[-Type] <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns registered Certificates.

## EXAMPLES

### EXAMPLE 1
```
Get-FMCertificate
```

Returns all registered certificates intended for any of the forest certificate stores

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

### -Type
The type of certificate to look for

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
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
