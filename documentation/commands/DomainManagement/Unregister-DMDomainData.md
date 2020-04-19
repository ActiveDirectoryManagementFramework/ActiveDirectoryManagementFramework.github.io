---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Unregister-DMDomainData

## SYNOPSIS
Removes registered domain data gathering scripts.

## SYNTAX

```
Unregister-DMDomainData [-Name] <String[]> [<CommonParameters>]
```

## DESCRIPTION
Removes registered domain data gathering scripts.
Also deletes all associated cached data.

## EXAMPLES

### EXAMPLE 1
```
Get-DMDomainData | Unregister-DMDomainData
```

Clears all domain data gathering scripts.

## PARAMETERS

### -Name
Name of the domain data gathering script to remove.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
