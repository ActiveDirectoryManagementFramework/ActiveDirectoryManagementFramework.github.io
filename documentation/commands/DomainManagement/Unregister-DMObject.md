---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Unregister-DMObject

## SYNOPSIS
Unregisters a configured active directory objects.

## SYNTAX

```
Unregister-DMObject [-Identity] <String[]> [<CommonParameters>]
```

## DESCRIPTION
Unregisters a configured active directory objects.

## EXAMPLES

### EXAMPLE 1
```
Get-DMObject | Unregister-DMObject
```

Clears all configured AD objects.

## PARAMETERS

### -Identity
The paths to the object to unregister.
Requires the full, unresolved identity as dn (CN=\<Name\>,\<Path\>).

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
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
