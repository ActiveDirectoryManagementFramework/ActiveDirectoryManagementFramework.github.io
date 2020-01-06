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
 -Filter <String> [<CommonParameters>]
```

### LdapFilter
```
Register-DMObjectCategory -Name <String> -ObjectClass <String> -Property <String[]> -TestScript <ScriptBlock>
 -LdapFilter <String> [<CommonParameters>]
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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
