---
external help file: ForestManagement-help.xml
Module Name: ForestManagement
online version:
schema: 2.0.0
---

# Unregister-FMSubnet

## SYNOPSIS
Removes a subnet mapping.

## SYNTAX

```
Unregister-FMSubnet [-Name] <String[]> [<CommonParameters>]
```

## DESCRIPTION
Removes a subnet mapping.

## EXAMPLES

### EXAMPLE 1
```
Unregister-FMSubnet -Name "1.2.3.4/32"
```

Removes the subnet "1.2.3.4/32"

## PARAMETERS

### -Name
Name of the subnets to unregister

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
