---
external help file: ForestManagement-help.xml
Module Name: ForestManagement
online version:
schema: 2.0.0
---

# Register-FMExchangeSchema

## SYNOPSIS
Registers an exchange version to apply to the forest's schema and configuration.

## SYNTAX

### Version
```
Register-FMExchangeSchema -LocalImagePath <String> -ExchangeVersion <String> [-OrganizationName <String>]
 [-SchemaOnly] [-ContextName <String>] [<CommonParameters>]
```

### Details
```
Register-FMExchangeSchema -LocalImagePath <String> -RangeUpper <Int32> [-ObjectVersion <Int32>]
 [-OrganizationName <String>] [-SchemaOnly] [-ContextName <String>] [<CommonParameters>]
```

## DESCRIPTION
Registers an exchange version to apply to the forest's schema and configuration.
Updating both requires both Schema Admin and Enterprise Admin permissions.

Domain-Level changes to Exchange are handled by the DomainManagement module.

## EXAMPLES

### EXAMPLE 1
```
Register-FMExchangeSchema -LocalImagePath 'C:\ISO\exchange-2019-cu6.iso' -ExchangeVersion '2019CU6'
```

Registers the Exchange 2019 CU6 exchange version as exchange forest settings to be applied.

## PARAMETERS

### -LocalImagePath
The path where to find the Exchange ISO file
Must be local on the remote server connected to!
Updating the Exchange AD settings is only supported when executed through the installer contained in that ISO file without exceptions.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExchangeVersion
The version of the Exchange server to apply.
E.g.
2016CU6
We map Exchange versions to their respective identifiers in AD:
RangeUpper in schema and ObjectVersion in configuration.
This parameter is to help avoiding to have to look up those values.
If your version is not supported by us yet, look up those numbers and explicitly bind it to -RangeUpper and -ObjectVersion isntead.

```yaml
Type: String
Parameter Sets: Version
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RangeUpper
The explicit RangeUpper schema attribute property, found on the ms-Exch-Schema-Version-Pt class in schema.

```yaml
Type: Int32
Parameter Sets: Details
Aliases:

Required: True
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -ObjectVersion
The object version on the msExchOrganizationContainer type object in the configuration.
Do NOT confuse that with the ObjectVersion of the exchange object in the default Naming Context (regular domain space).

```yaml
Type: Int32
Parameter Sets: Details
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -OrganizationName
The name of the Exchange Organization.
Only used for CREATING a new Exchange deployment.
Make sure to customize this if you are picky about names like that.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: Exchange Organization
Accept pipeline input: False
Accept wildcard characters: False
```

### -SchemaOnly
Whether to only apply the schema updates.
Enabling this will mean no configuration scope changes are applied and the root domain also will not be pre-configured for Exchange.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ContextName
The name of the context defining the setting.
This allows determining the configuration set that provided this setting.
Used by the ADMF, available to any other configuration management solution.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: <Undefined>
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
