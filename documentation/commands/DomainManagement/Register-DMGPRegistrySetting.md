---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Register-DMGPRegistrySetting

## SYNOPSIS
Register a registry setting that should be applied to a group policy object.

## SYNTAX

### Value (Default)
```
Register-DMGPRegistrySetting -PolicyName <String> -Key <String> -ValueName <String> -Value <Object>
 -Type <String> [<CommonParameters>]
```

### DomainData
```
Register-DMGPRegistrySetting -PolicyName <String> -Key <String> -ValueName <String> -DomainData <String>
 -Type <String> [<CommonParameters>]
```

## DESCRIPTION
Register a registry setting that should be applied to a group policy object.
Note: These settings are only applied to group policy objects deployed through the GroupPolicy Component

## EXAMPLES

### EXAMPLE 1
```
Get-Content .\registrysettings.json | ConvertFrom-Json | Write-Output | Register-DMGPRegistrySetting
```

Imports all the registry value definitions configured in the specified file.

## PARAMETERS

### -PolicyName
Name of the group policy object to attach this setting to.
Subject to advanced string insertion.

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

### -Key
The registry key affected.
Subject to advanced string insertion.

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

### -ValueName
The name of the value to modify.
Subject to advanced string insertion.

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

### -Value
The value to insert into the specified registry-key-value.

```yaml
Type: Object
Parameter Sets: Value
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -DomainData
Instead of offering an explicit value, have the resulting value calculated by a scriptblock executed against the target domain.
In opposite to ADMF Contexts, DomainData data gathering scriptblocks are executed on a per-domain basis.
While a Context supports integrating logic, Contexts themselves are not re-run when switching to another domain with the same Context choice.
DomainData gathering logic can be configured using Register-DMDomainData or defining appropriate configuration in ADMF Contexts.

```yaml
Type: String
Parameter Sets: DomainData
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Type
What kind of registry value should be defined?
Supported types: 'Binary', 'DWord', 'ExpandString', 'MultiString', 'QWord', 'String'

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
