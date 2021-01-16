---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Unregister-DMGPLink

## SYNOPSIS
Removes a group policy link from the configured desired state.

## SYNTAX

### Path (Default)
```
Unregister-DMGPLink -PolicyName <String> -OrganizationalUnit <String> [<CommonParameters>]
```

### Filter
```
Unregister-DMGPLink -PolicyName <String> -OUFilter <String> [<CommonParameters>]
```

## DESCRIPTION
Removes a group policy link from the configured desired state.

## EXAMPLES

### EXAMPLE 1
```
Get-DMGPLink | Unregister-DMGPLink
```

Clears all configured Group policy links.

## PARAMETERS

### -PolicyName
The name of the policy to unregister.

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

### -OrganizationalUnit
The name of the organizational unit the policy should be unregistered from.

```yaml
Type: String
Parameter Sets: Path
Aliases: OU

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -OUFilter
The filter of the filterbased policy link to remove

```yaml
Type: String
Parameter Sets: Filter
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
