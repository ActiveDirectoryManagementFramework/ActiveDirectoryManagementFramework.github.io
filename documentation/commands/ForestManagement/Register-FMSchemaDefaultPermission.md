---
external help file: ForestManagement-help.xml
Module Name: ForestManagement
online version:
schema: 2.0.0
---

# Register-FMSchemaDefaultPermission

## SYNOPSIS
Registers a new desired schema default permission access rule.

## SYNTAX

```
Register-FMSchemaDefaultPermission [-ClassName] <String> [-Identity] <String> [-ActiveDirectoryRights] <String>
 [[-AccessControlType] <AccessControlType>] [[-InheritanceType] <ActiveDirectorySecurityInheritance>]
 [[-ObjectType] <String>] [[-InheritedObjectType] <String>] [[-Mode] <String>] [[-ContextName] <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Registers a new desired schema default permission access rule.
These access rules are then used / applied when when creating a new object of the class affected.

These settings apply only to new objects created of the affected class, not already existing ones.
Using this you could for example add a group to have full control over all newly created group policy objects.

## EXAMPLES

### EXAMPLE 1
```
Get-Content .\sdp.json | ConvertFrom-Json | Write-Output | Register-FMSchemaDefaultPermission
```

Loads all entries from the specified json file and registers them.

## PARAMETERS

### -ClassName
The name of the object class in schema this applies to.

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

### -Identity
The principal to which the access rule applies.
Supports limited string resolution.

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

### -ActiveDirectoryRights
The rights granted.

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

### -AccessControlType
Allow or Deny?
Defaults to: Allow

```yaml
Type: AccessControlType
Parameter Sets: (All)
Aliases:
Accepted values: Allow, Deny

Required: False
Position: 4
Default value: Allow
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -InheritanceType
How is this privilege inherited by child objects?

```yaml
Type: ActiveDirectorySecurityInheritance
Parameter Sets: (All)
Aliases:
Accepted values: None, All, Descendents, SelfAndChildren, Children

Required: False
Position: 5
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ObjectType
What object types does this permission apply to?

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: <All>
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -InheritedObjectType
What object types does this permission apply to?
Used for extended properties.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: <All>
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Mode
How access rules are actually applied:
- Additive: Only add new access rules, but do not touch existing ones
- Defined: Add new access rules, remove access rules not defined in configuration that apply to a principal that has access rules defined.
- Constrained: Add new access rules, remove all access rules not defined in configuration

All Modes of all settings for a given class are used when determining the effective Mode applied to that class.
The most restrictive Mode applies.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: None
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
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
