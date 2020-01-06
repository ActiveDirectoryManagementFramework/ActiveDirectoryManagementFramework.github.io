---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Get-DMOrganizationalUnit

## SYNOPSIS
Returns the list of configured Organizational Units.

## SYNTAX

```
Get-DMOrganizationalUnit [[-Name] <String>] [[-Path] <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns the list of configured Organizational Units.
Does not in any way retrieve data from a domain.
The returned list of OUs represent the desired state for each domain of the current context.

## EXAMPLES

### EXAMPLE 1
```
Get-DMOrganizationalUnit
```

Return all configured OUs.

## PARAMETERS

### -Name
Name of the OU to filter by.

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

### -Path
Path of the OU to filter by.

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
