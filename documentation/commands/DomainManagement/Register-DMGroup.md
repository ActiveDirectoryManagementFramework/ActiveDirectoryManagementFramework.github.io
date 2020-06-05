---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Register-DMGroup

## SYNOPSIS
Registers an active directory group.

## SYNTAX

```
Register-DMGroup [-Name] <String> [[-SamAccountName] <String>] [-Path] <String> [-Description] <String>
 [-Scope] <String> [[-Category] <String>] [[-OldNames] <String[]>] [[-Present] <Boolean>]
 [[-ContextName] <String>] [<CommonParameters>]
```

## DESCRIPTION
Registers an active directory group.
This group will be maintained as configured during Invoke-DMGroup.

## EXAMPLES

### EXAMPLE 1
```
Get-Content .\groups.json | ConvertFrom-Json | Write-Output | Register-DMGroup
```

Reads a json configuration file containing a list of objects with appropriate properties to import them as group configuration.

## PARAMETERS

### -Name
The name of the group.
Subject to string insertion.

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

### -SamAccountName
The SamAccountName of the group.
Defaults to the Name if not otherwise specified.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Path
Path (distinguishedName) of the OU to place the group in.
Subject to string insertion.

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

### -Description
Description of the group.
Subject to string insertion.

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

### -Scope
The scope of the group.
Use DomainLocal for groups that grrant direct permissions and Global for role groups.

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

### -Category
Whether the group should be a security group or a distribution group.
Defaults to security.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: Security
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -OldNames
Previous names the group used to have.
By specifying this name, groups will be renamed if still using an old name.
Conflicts may require resolving.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: @()
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Present
Whether the group should exist.
Defaults to $true
Set to $false for explicitly deleting groups, rather than creating them.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: True
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
