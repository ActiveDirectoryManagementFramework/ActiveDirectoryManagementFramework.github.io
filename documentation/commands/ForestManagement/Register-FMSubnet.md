---
external help file: ForestManagement-help.xml
Module Name: ForestManagement
online version:
schema: 2.0.0
---

# Register-FMSubnet

## SYNOPSIS
Registers a new subnet assignment.

## SYNTAX

```
Register-FMSubnet [-SiteName] <String> [-Name] <String> [-Description] <String> [-Location] <String>
 [<CommonParameters>]
```

## DESCRIPTION
Registers a new subnet assignment.
Subnets are assigned to sites.

## EXAMPLES

### EXAMPLE 1
```
Register-FMSubnet -SiteName MySite -Name '1.2.3.4/32'
```

Assigns the subnet '1.2.3.4/32' to the site 'MySite'

## PARAMETERS

### -SiteName
Name of the site to which subnets are being assigned.

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

### -Name
Subnet to assign.
Must be a subnet in the following notation:
\<ipv4address\>/\<subnetsize\>
E.g.: 1.2.3.4/24

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

### -Description
Description to add to the subnet

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

### -Location
Location, where the subnet is at.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 4
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
