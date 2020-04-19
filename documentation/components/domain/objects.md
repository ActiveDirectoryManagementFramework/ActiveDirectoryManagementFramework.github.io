# Objects

## Description

It is not really possible to handle every special case with a dedicated [Component](../components.html).
For those scenarios, the Object [Component](../components.html) might help:
It allows to freely define AD objects (but cannot delete them!)

> These objects are not constrained to the Domain Naming Context - it is very much possible to define forest wide objects in the Configuration NC, such as Exchange Service Connection Points.

## Example Configuration

Defines a service connection point under the domain-root:

```json
{
    "Path":  "%DomainDN%",
    "Name":  "Core Connection",
    "ObjectClass":  "serviceConnectionPoint",
    "Attributes":  {
        "keywords":  [ "keyword1", "keyword2", "c6195500-2607-44f6-b9d1-85b5601f125f" ],
        "serviceBindingInformation":  "https://core.%DomainFqdn%"
    },
    "AttributesToResolve":  [
        "serviceBindingInformation"
    ]
}
```

## Properties

### Path

> This parameter uses [name resolution](../../advanced/name-mapping.html).

The Path to the OU in which to place the object.

### Name

> This parameter uses [name resolution](../../advanced/name-mapping.html).

Name of the object to define.

### ObjectClass

The class of the object to define.

### Attributes

Attributes (and their value) to include in the object.

### AttributesToResolve

The names of all attributes in configuration, for which you want to perform [name resolution](../../advanced/name-mapping.html), before comparing with the actual object in AD.
