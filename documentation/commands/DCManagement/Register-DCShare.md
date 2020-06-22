---
external help file: DCManagement-help.xml
Module Name: DCManagement
online version:
schema: 2.0.0
---

# Register-DCShare

## SYNOPSIS
Registers an SMB share that should exist on DCs.

## SYNTAX

```
Register-DCShare [-Name] <String> [-Path] <String> [[-Description] <String>] [[-FullAccess] <String[]>]
 [[-WriteAccess] <String[]>] [[-ReadAccess] <String[]>] [[-AccessMode] <String>] [[-ServerRole] <String>]
 [[-ContextName] <String>] [<CommonParameters>]
```

## DESCRIPTION
Registers an SMB share that should exist on DCs.

## EXAMPLES

### EXAMPLE 1
```
Get-Content .\shares.json | ConvertFrom-Json | Write-Output | Register-DCShare
```

Reads all share definitions from json and imports the definitions.

## PARAMETERS

### -Name
The name of the share.
Supports string resolution.

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

### -Path
The path the share points to.
Supports string resolution.

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
The description of the share.
Supports string resolution.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -FullAccess
The principals to grant full access to.
Supports string resolution.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -WriteAccess
The principals to grant write access to.
Supports string resolution.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ReadAccess
The principals to grant read access to.
Supports string resolution.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -AccessMode
How share access rules are processed.
Supports three configurations:
- Constrained: The default access mode, will remove any excess access rules.
- Additive: Ignore any access rules already on the share, even if not configured
- Defined: Ignore any access rules already on the share, even if not configured UNLESS the identity on those rules has an access level defined for it.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: Constrained
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ServerRole
What domain controller to apply this to:
- All:  All DCs in the enterprise
- FSMO: Only DCs that have any FSMO role
- PDC:  Only the PDCEmulator

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: All
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ContextName
The name of the context defining the setting.
This allows determining the configuration set that provided this setting.
Used by the ADMF, available to any other configuration management solution.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: <Undefined>
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
