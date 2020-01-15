# Access Control Lists

## Description

Access Control Lists allow you to define owner and inheritance on any object desired. While this resource is managed by the DomainManagement module, it is possible to also define rules that apply to the configuration Naming Context.

Any object, that has at least one such rule defined will be assumed to be fully defined. Access Control Lists that are not defined will be marked as not configured.

## Example Configuration

A reasonably simple configuration entry:

```json
[
    {
        "Path":  "OU=Tiering,%DomainDN%",
        "Owner":  "Administrators",
        "NoInheritance":  True,
        "Optional":  True
    }
]
```

This rule will verify and if neccesarry set Administrators as owner and disable Inheritance of the custom Tiering Organizational Unit.

## Properties

### Path

> This parameter uses [name resolution](../../advanced/name-mapping.html).

The distinguished name of the object, on which access rules are applied.

### Owner

Owner of the ADObject. Subject to string insertion. To verify or set the correct owner for an ADObject. 

### NoInheritance

Optional: Yes | Default: false

Whether inheritance should be disabled on the ADObject e.g. special permissions.

### Optional

Optional: Yes | Default: false

A boolean value, accepting either `true` or `false` (note: no quotes in json!).
By default, the Domain Management module will complain about an object not existing when assigning an access rule to an object that ... well, doesn't exist.
Setting `Optional` to `true` will make it ignore it instead.