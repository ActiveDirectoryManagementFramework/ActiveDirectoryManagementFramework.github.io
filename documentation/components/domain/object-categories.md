# Object Categories

## Description

Object categories are a way to apply settings to a type of object based on a ruleset / filterset.
For example, by registering an object category "Domain Controllers" (with appropriate filters / conditions), it becomes possible to define access rules that apply to all domain controllers, but not all computers.

To define an Object Category in a [Context](../../basics/contexts.html), create `.psd1` (*NOT* `.json`) files in the `domain/objectcategories` folder.

## Example Configuration

An object category targeting Domain Controllers:

```powershell
@{
    Name = 'DomainController'
    ObjectClass = 'computer'
    Property = @('PrimaryGroupID')
    TestScript = { $args[0].PrimaryGroupID -eq 516 }
    LDAPFilter = '(&(objectCategory=computer)(primaryGroupID=516))'
}
```

## Properties

### Name

The name of the category. Must be unique.
Will NOT be resolved.

### ObjectClass

The ObjectClass of the object.
This is the AD attribute of the object.
Each object category can only apply to one class of object, in order to protect system performance.

### Property

The properties needed for this category.
This attribute is used to optimize object retrieval in case of multiple categories applying to the same class of object.

### TestScript

Scriptblock used to determine, whether the input object is part of the category.
Receives the AD object with the requested attributes as input object / argument.

> Use `$args[0]` to refer to the input AD object to be tested.

### Filter

> ParameterSet: Filter

A filter used to find all objects in AD that match this category.

### LdapFilter

> ParameterSet: LdapFilter

An LDAP filter used to find all objects in AD that match this category.

### SearchBase

Optional: Yes | Default: %DomainDN%

The path under which to look for objects of this category.

> This parameter uses [name resolution](../../advanced/name-mapping.html).

### SearchScope

How deep to search for objects of this category under the chosen searchbase.
Supported Values:

|Subtree|All items under the searchbase. (default)|
|OneLevel|All items directly under the searchbase.|
|Base|Only the searchbase itself is inspected.|

## Notes on Filters

Object Categories are applied in two ways:

+ I already have an AD Object and want to know whether it is part of the Object Category (`TestScript`)
+ Active Directory, give me all objects of that category (`Filter` or `LDAPFilter`)

Depending on how any other Component works, either a filter or the TestScript is used.
Thus it is recommended, that both conditions evaluate the same way - Components will not use both ways to validate an object and results may be inconsistent if TestScript and Filter resolve to different results.
