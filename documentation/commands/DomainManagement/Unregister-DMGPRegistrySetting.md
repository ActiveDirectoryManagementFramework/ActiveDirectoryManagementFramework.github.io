---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Unregister-DMGPRegistrySetting

## SYNOPSIS
Removes defined group policy registry settings.

## SYNTAX

```
Unregister-DMGPRegistrySetting [-PolicyName] <String> [-Key] <String> [-ValueName] <String>
 [<CommonParameters>]
```

## DESCRIPTION
Removes defined group policy registry settings.

## EXAMPLES

### EXAMPLE 1
```
Get-DMGPRegistrySetting | Unregister-DMGPRegistrySetting
```

Clears all defined group policy registry settings.

## PARAMETERS

### -PolicyName
The name of the GPO the registry setting has been applied to.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Key
The registry key affected.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ValueName
The name of the value this applies to.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
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
