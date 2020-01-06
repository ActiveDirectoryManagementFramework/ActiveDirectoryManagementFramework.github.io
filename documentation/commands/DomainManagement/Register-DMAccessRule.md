---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Register-DMAccessRule

## SYNOPSIS
Registers a new access rule as a desired state.

## SYNTAX

### Path (Default)
```
Register-DMAccessRule -Path <String> -Identity <String> -ActiveDirectoryRights <String>
 [-AccessControlType <AccessControlType>] [-InheritanceType <ActiveDirectorySecurityInheritance>]
 [-ObjectType <String>] [-InheritedObjectType <String>] [-Optional <Boolean>] [<CommonParameters>]
```

### Category
```
Register-DMAccessRule -ObjectCategory <String> -Identity <String> -ActiveDirectoryRights <String>
 [-AccessControlType <AccessControlType>] [-InheritanceType <ActiveDirectorySecurityInheritance>]
 [-ObjectType <String>] [-InheritedObjectType <String>] [-Optional <Boolean>] [<CommonParameters>]
```

## DESCRIPTION
Registers a new access rule as a desired state.
These are then compared with a domain's configuration when executing Test-DMAccessRule.
See that command for more details on this procedure.

## EXAMPLES

### EXAMPLE 1
```
Register-DMAccessRule -ObjectCategory DomainControllers -Identity '%DomainName%\Domain Admins' -ActiveDirectoryRights GenericAll
```

Grants the domain admins of the target domain FullControl over all domain controllers, without any inheritance.

## PARAMETERS

### -Path
The path to the AD object to govern.
This should be a distinguishedname.
This path uses name resolution.
For example %DomainDN% will be replaced with the DN of the target domain itself (and should probably be part of everyy single path).

```yaml
Type: String
Parameter Sets: Path
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ObjectCategory
Instead of a path, define a category to apply the rule to.
Categories are defined using Register-DMObjectCategory.
This allows you to apply rules to a category of objects, rather than a specific path.
With this you could apply a rule to all domain controller objects, for example.

```yaml
Type: String
Parameter Sets: Category
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Identity
The identity to apply the rule to.
Use the string '\<Parent\>' to apply the rule to the parent object of the object affected by this rule.

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

### -ActiveDirectoryRights
The actual rights to grant.
This is a \[string\] type to allow some invalid values that happen in the field and are still applied by AD.

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

### -AccessControlType
Whether this is an Allow or Deny rule.

```yaml
Type: AccessControlType
Parameter Sets: (All)
Aliases:
Accepted values: Allow, Deny

Required: False
Position: Named
Default value: Allow
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -InheritanceType
How the Access Rule is being inherited.

```yaml
Type: ActiveDirectorySecurityInheritance
Parameter Sets: (All)
Aliases:
Accepted values: None, All, Descendents, SelfAndChildren, Children

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ObjectType
Name or Guid of property or right affected by this rule.
Access Rules are governed by ObjectType and InheritedObjectType to affect what objects to affect (e.g.
Computer, User, ...),
what properties to affect (e.g.: User-Account-Control) or what extended rights to grant.
Which in what combination applies depends on the ActiveDirectoryRights set.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: <All>
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -InheritedObjectType
Name or Guid of property or right affected by this rule.
Access Rules are governed by ObjectType and InheritedObjectType to affect what objects to affect (e.g.
Computer, User, ...),
what properties to affect (e.g.: User-Account-Control) or what extended rights to grant.
Which in what combination applies depends on the ActiveDirectoryRights set.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: <All>
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Optional
The path this access rule object is assigned to is optional and need not exist.
This makes the rule apply only if the object exists, without triggering errors if it doesn't.
It will also ignore access errors on the object.
Note: Only if all access rules assigned to an object are set to $true, will the object be considered optional.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
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
