---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Register-DMAcl

## SYNOPSIS
Registers an active directory acl.

## SYNTAX

```
Register-DMAcl [-Path] <String> [-Owner] <String> [[-NoInheritance] <Boolean>] [[-Optional] <Boolean>]
 [<CommonParameters>]
```

## DESCRIPTION
Registers an active directory acl.
This acl will be maintained as configured during Invoke-DMAcl.

## EXAMPLES

### EXAMPLE 1
```
Get-Content .\groups.json | ConvertFrom-Json | Write-Output | Register-DMAcl
```

Reads a json configuration file containing a list of objects with appropriate properties to import them as acl configuration.

## PARAMETERS

### -Path
Path (distinguishedName) of the ADObject the acl is assigned to.
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

### -Owner
Owner of the ADObject.
Subject to string insertion.

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

### -NoInheritance
Whether inheritance should be disabled on the ADObject.
Defaults to $false

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Optional
The path this acl object is assigned to is optional and need not exist.
This makes the rule apply only if the object exists, without triggering errors if it doesn't.
It will also ignore access errors on the object.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
