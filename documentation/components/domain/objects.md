# Objects

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

### Path

The Path to the OU in which to place the object.
Subject to string insertion.

### Name

Name of the object to define.
Subject to string insertion.

### ObjectClass

The class of the object to define.

### Attributes

Attributes to include in the object.
If you specify a hashtable, keys are mapped to attributes.
If you specify another arbitrary object type, properties are mapped to attributes.

### AttributesToResolve

The names of all attributes in configuration, for which you want to perform string insertion, before comparing with the actual object in AD.
