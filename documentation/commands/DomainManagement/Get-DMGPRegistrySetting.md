---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Get-DMGPRegistrySetting

## SYNOPSIS
Returns the registered group policy registry settings.

## SYNTAX

```
Get-DMGPRegistrySetting [[-PolicyName] <String>] [[-Key] <String>] [[-ValueName] <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns the registered group policy registry settings.

## EXAMPLES

### EXAMPLE 1
```
Get-DMGPRegistrySetting
```

Returns all registered group policy registry settings.

## PARAMETERS

### -PolicyName
The name of the policy to filter by.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: *
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Key
Filter by the key affected.

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

### -ValueName
Filter by the name of the value set.

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
