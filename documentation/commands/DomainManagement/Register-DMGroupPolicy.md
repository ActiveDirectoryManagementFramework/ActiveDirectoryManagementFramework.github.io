---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Register-DMGroupPolicy

## SYNOPSIS
Adds a group policy object to the list of desired GPOs.

## SYNTAX

```
Register-DMGroupPolicy [-DisplayName] <String> [-Description] <String> [-ID] <String> [-Path] <String>
 [-ExportID] <String> [<CommonParameters>]
```

## DESCRIPTION
Adds a group policy object to the list of desired GPOs.
These are then tested for using Test-DMGroupPolicy and applied by using Invoke-DMGroupPolicy.

## EXAMPLES

### EXAMPLE 1
```
Get-Content gpos.json | ConvertFrom-Json | Write-Output | Register-DMGroupPolicy
```

Reads all gpos defined in gpos.json and registers each as a GPO object.

## PARAMETERS

### -DisplayName
Name of the GPO to add.

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

### -Description
Description of the GPO in question,.

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

### -ID
The GPO Id GUID.

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

### -Path
Path to where the GPO export can be found.

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

### -ExportID
The tracking ID assigned to the GPO in order to detect its revision.
#TODO: Migrate export command and add documentation.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
