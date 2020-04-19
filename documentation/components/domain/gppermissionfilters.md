# Group Policy Permission Filters

## Description

Permission filters are the conditions you can use for selecting, which GPOs are assigned what permission in the [Group Policy Permission Component](gppermissions.html), when using its `Filter` property.

Filter conditions can answer any of the following questions:

+ Is the GPO defined in the currently loaded configuration?
+ Is the GPO linked to this specific OU, or anywhere below it, or to any OU directly below it?
+ Is the GPO named like this? (Exact comparison / Wildcard / Regex)

## Example Configurations

A filter condition that matches all GPOs defined in configuration:

```json
{
    "Name":  "IsManaged",
    "Managed":  true
}
```

A filter condition that applies to all GPOs linked to the OU "Tier 0" and all OUs under it:

```json
{
    "Name":  "Tier0Linked",
    "Path":  "OU=Tier 0,%DomainDN%",
    "PathScope":  "SubTree"
}
```

A filter condition that applies to either the Default Domain Policy or the Default Domain Controllers Policy.

```json
{
    "Name":  "DefaultPolicies",
    "GpName":  "^Default Domain Policy$|Default Domain Controllers Policy",
    "GpNameMode":  "Regex"
}
```

## Properties

### Name

Name of the filter rule.

> Must only contain letters, numbers and underscore.

### Reverse

Reverses the result of the rule.
This combined with another condition allows reversing the result.
For example, combined with a Path condition, this would make the filter match any GPO NOT linked to that path.

### Managed

> ParameterSet: Managed

Matches GPOs that are defined by ADMF ($true) or not so ($false).

### Path

> ParameterSet: Path

> This parameter uses [name resolution](../../advanced/name-mapping.html).

Matches GPOs that have been linked to the specified organizational unit (or potentially OUs beneath it).

### PathScope

> ParameterSet: Path

Defines how the path rule is applied:

Base|Only the specified OU's linked GPOs are evaluated (default).
OneLevel|Only the OU's directly beneath the specified OU are evaluated for linked GPOs.
SubTree|All OUs under the specified path are avaluated for linked GPOs.

### PathOptional

> ParameterSet: Path

Whether the path is optional.
By default, when evaluating a path filter, processing of GP permission terminates if the designated path does not exist, as we cannot guarantee a consistent permission-set being applied.
With this setting enabled, instead processing silently continues.

> Note: Even if this is enabled, a silent log entry will be added anyway for tracking purposes.

### GPName

> ParameterSet: Name

> This parameter uses [name resolution](../../advanced/name-mapping.html).

Name of the GP to filter for.
This can be a wildcard or regex match, depending on the -GPNameMode parameter, however by default an exact match is required.

### GPNameMode

> ParameterSet: Name

How exactly the GPName parameter is applied:

Explicit|An exact name equality is required (default)
Wildcard|Supports wildcard comparisons (using the -like operator)
Regex|Supports regex matching (using the -match operator)

None of the three options is case sensitive.
