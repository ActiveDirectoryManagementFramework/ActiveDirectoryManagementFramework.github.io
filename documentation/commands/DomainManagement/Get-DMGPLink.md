---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Get-DMGPLink

## SYNOPSIS
Returns the list of registered group policy links.

## SYNTAX

```
Get-DMGPLink [[-PolicyName] <String>] [[-OrganizationalUnit] <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns the list of registered group policy links.
Use Register-DMGPLink to register new group policy links.

## EXAMPLES

### EXAMPLE 1
```
Get-DMGPLink
```

Returns all registered GPLinks

## PARAMETERS

### -PolicyName
The name of the GPO to filter by.

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

### -OrganizationalUnit
The name of the OU the GPO is assigned to.

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
