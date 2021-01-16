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

### path (Default)
```
Register-DMAcl -Path <String> -Owner <String> [-NoInheritance <Boolean>] [-Optional <Boolean>]
 [-ContextName <String>] [<CommonParameters>]
```

### category
```
Register-DMAcl -ObjectCategory <String> -Owner <String> [-NoInheritance <Boolean>] [-Optional <Boolean>]
 [-ContextName <String>] [<CommonParameters>]
```

### DefaultOwner
```
Register-DMAcl -Owner <String> [-DefaultOwner] [-ContextName <String>] [<CommonParameters>]
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
Parameter Sets: path
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ObjectCategory
Assign ACL settings based on the ObjectCategory of an object.

```yaml
Type: String
Parameter Sets: category
Aliases:

Required: True
Position: Named
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
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -NoInheritance
Whether inheritance should be disabled on the ADObject.
Defaults to $false

```yaml
Type: Boolean
Parameter Sets: path, category
Aliases:

Required: False
Position: Named
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
Parameter Sets: path, category
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -DefaultOwner
Whether to make this the default owner for objects not specified under either a path or an object category.

```yaml
Type: SwitchParameter
Parameter Sets: DefaultOwner
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
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
Position: Named
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
