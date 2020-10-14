---
external help file: ForestManagement-help.xml
Module Name: ForestManagement
online version:
schema: 2.0.0
---

# Unregister-FMSchemaDefaultPermission

## SYNOPSIS
Removes schema default permissions from the list of registered configurationsets.

## SYNTAX

```
Unregister-FMSchemaDefaultPermission [-ClassName] <String> [-Identity] <String>
 [-ActiveDirectoryRights] <String> [-AccessControlType] <AccessControlType>
 [-InheritanceType] <ActiveDirectorySecurityInheritance> [-ObjectType] <String> [-InheritedObjectType] <String>
 [<CommonParameters>]
```

## DESCRIPTION
Removes schema default permissions from the list of registered configurationsets.

## EXAMPLES

### EXAMPLE 1
```
Get-FMSchemaDefaultPermission | Unregister-FMSchemaDefaultPermission
```

Clear all configured default schema permissions.

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

```yaml
Type: AccessControlType
Parameter Sets: (All)
Aliases:
Accepted values: Allow, Deny

Required: True
Position: 4
Default value: None
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

Required: True
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

Required: True
Position: 6
Default value: None
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

Required: True
Position: 7
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
