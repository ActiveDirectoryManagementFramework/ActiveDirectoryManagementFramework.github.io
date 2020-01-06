---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Register-DMGPLink

## SYNOPSIS
Registers a group policy link as a desired state.

## SYNTAX

```
Register-DMGPLink [-PolicyName] <String> [-OrganizationalUnit] <String> [-Precedence] <Int32>
 [<CommonParameters>]
```

## DESCRIPTION
Registers a group policy link as a desired state.

## EXAMPLES

### EXAMPLE 1
```
Get-Content $configPath | ConvertFrom-Json | Write-Output | Register-DMGPLink
```

Import all GPLinks stored in the json file located at $configPath.

## PARAMETERS

### -PolicyName
The name of the group policy being linked.
Supports string expansion.

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

### -OrganizationalUnit
The organizational unit (or domain root) being linked to.
Supports string expansion.

```yaml
Type: String
Parameter Sets: (All)
Aliases: OU

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Precedence
Numeric value representing the order it is linked in.
The lower the number, the higher on the list, the more relevant the setting.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
