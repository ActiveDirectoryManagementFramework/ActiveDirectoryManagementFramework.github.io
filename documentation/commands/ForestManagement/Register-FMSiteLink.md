---
external help file: ForestManagement-help.xml
Module Name: ForestManagement
online version:
schema: 2.0.0
---

# Register-FMSiteLink

## SYNOPSIS
Register a new sitelink configuration.

## SYNTAX

```
Register-FMSiteLink [-Site1] <String> [-Site2] <String> [-Cost] <Int32> [[-Interval] <Int32>]
 [-Description] <String> [[-Option] <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Register a new sitelink configuration.

## EXAMPLES

### EXAMPLE 1
```
Register-FMSiteLink -Site1 MySite -Site2 MyOtherSite -Cost 80 -Description '2019 | 1GB/s' -Option 1
```

Registers a new sitelink between MySite and MyOtherSite at a cost of 80, registering it as instant replication and adding docs on its bandwidth.

## PARAMETERS

### -Site1
The first sitename in the pair of sites to be linked.

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

### -Site2
The second sitename in the pair of sites to be linked.

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

### -Cost
The cost of the connection between the two sites.

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

### -Interval
The replication interval (in minutes) between two sites.
Defaults to 15 minutes.
Cannot be less than 15 minutes.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: 15
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Description
A description to add to the sitelink.
For example, consider including a timestamp and the available bandwidth.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 5
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Option
Any options for the sitelink.
This is a bitmap with currently only one relevant setting:
00000001 : Change Notify (Changes replicate instantly, rather than the configured interval.
Only use for high-bandwidth connections)

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
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
