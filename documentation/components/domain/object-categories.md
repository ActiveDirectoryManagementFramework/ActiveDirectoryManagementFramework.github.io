# Object Categories

## Description

> Add Content

## Example Configuration

> Add Content

```json

```

## Tools

```powershell

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
This attribute is used to optimize object reetrieval in case of multiple categories applying to the same class of object.

### TestScript

Scriptblock used to determine, whether the input object is part of the category.
Receives the AD object with the requested attributes as input object / argument.

### Filter

A filter used to find all objects in AD that match this category.

### LdapFilter

An LDAP filter used to find all objects in AD that match this category.
