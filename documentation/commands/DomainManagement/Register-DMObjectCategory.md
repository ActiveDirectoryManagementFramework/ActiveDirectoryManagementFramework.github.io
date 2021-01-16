---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Register-DMObjectCategory

## SYNOPSIS
Registers a new object category.

## SYNTAX

### Filter (Default)
```
Register-DMObjectCategory -Name <String> -ObjectClass <String> -Property <String[]> -TestScript <ScriptBlock>
 -Filter <String> [-SearchBase <String>] [-SearchScope <String>] [-ContextName <String>] [<CommonParameters>]
```

### LdapFilter
```
Register-DMObjectCategory -Name <String> -ObjectClass <String> -Property <String[]> -TestScript <ScriptBlock>
 -LdapFilter <String> [-SearchBase <String>] [-SearchScope <String>] [-ContextName <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Registers a new object category.
Object categories are a way to apply settings to a type of object based on a ruleset / filterset.
For example, by registering an object category "Domain Controllers" (with appropriate filters / conditions),
it becomes possible to define access rules that apply to all domain controllers, but not all computers.

Note: Not all setting types support categories yet.

## EXAMPLES

### EXAMPLE 1
```
Register-DMObjectCategory -Name DomainController -ObjectClass computer -Property PrimaryGroupID -TestScript { $args[0].PrimaryGroupID -eq 516 } -LDAPFilter '(&(objectCategory=computer)(primaryGroupID=516))'
```

Registers an object category applying to all domain controller's computer object in AD.

## PARAMETERS

### -Name
The name of the category.
Must be unique.
Will NOT be resolved.

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

### -ObjectClass
The ObjectClass of the object.
This is the AD attribute of the object.
Each object category can only apply to one class of object, in order to protect system performance.

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

### -Property
The properties needed for this category.
This attribute is used to optimize object reetrieval in case of multiple categories applying to the same class of object.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -TestScript
Scriptblock used to determine, whether the input object is part of the category.
Receives the AD object with the requested attributes as input object / argument.

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Filter
A filter used to find all objects in AD that match this category.

```yaml
Type: String
Parameter Sets: Filter
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -LdapFilter
An LDAP filter used to find all objects in AD that match this category.

```yaml
Type: String
Parameter Sets: LdapFilter
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -SearchBase
The path under which to look for objects of this category.
Defaults to domain wide.
Supports string resolution.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: %DomainDN%
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -SearchScope
How deep to search for objects of this category under the chosen searchbase.
Supported Values:
- Subtree: All items under the searchbase.
(default)
- OneLevel: All items directly under the searchbase.
- Base: Only the searchbase itself is inspected.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: Subtree
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
