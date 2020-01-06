---
external help file: ADMF-help.xml
Module Name: ADMF
online version:
schema: 2.0.0
---

# Export-AdmfGpo

## SYNOPSIS
Creates an export of GPO objects for use in the Domain Management module.

## SYNTAX

```
Export-AdmfGpo [-Path] <String> [-GpoObject] <Object> [[-Domain] <String>] [<CommonParameters>]
```

## DESCRIPTION
Creates an export of GPO objects for use in the Domain Management module.
Use this command to record new GPO data for the module.

## EXAMPLES

### EXAMPLE 1
```
Get-GPO -All | Where-Object DisplayName -like 'AD-D-SEC-T0*' | Export-AdmfGpo -Path .
```

Exports all GPOs named like 'AD-D-SEC-T0*' to the current path

## PARAMETERS

### -Path
The path to which to export the GPOs.

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

### -GpoObject
The GPO objects to export.
Only accepts output of Get-GPO

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Domain
The domain to export from.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: $env:USERDNSDOMAIN
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
