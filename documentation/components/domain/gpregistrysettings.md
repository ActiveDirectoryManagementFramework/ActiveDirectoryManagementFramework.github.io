# Group Policy Registry Settings

## Description

This [Component](../components.html) allows you to define individual registry settings defined for a [Group Policy](grouppolicies.html).

> These registry settings are _only_ applied to Group Policy Objects defined in the ADMF - they will not be applied to GPOs outside of this solution!

## Example Configurations

Extend the group policy "SEC-T0-UserBaseline" by having it set ScreenSaveTimeOut to 300 seconds:

```json
{
    "PolicyName":  "SEC-T0-UserBaseline",
    "Key":  "HKCU\\Software\\Policies\\Microsoft\\Windows\\Control Panel\\Desktop",
    "ValueName":  "ScreenSaveTimeOut",
    "Value":  300,
    "Type":  "DWord"
}
```

Extends the group policy "C-S-CA-EnrollmentPolicy" by using the [Domain Data Component](domaindata.html) to retrieve some data and injecting it into the policy under the specified key as the default value:

```json
{
    "PolicyName":  "C-S-CA-EnrollmentPolicy",
    "Key":  "HKEY_LOCAL_MACHINE\\SOFTWARE\\Policies\\Microsoft\\Cryptography\\PolicyServers",
    "ValueName":  "(Default)",
    "Type":  "String",
    "DomainData":  "PolicyID"
}
```

## Properties

### PolicyName

> This parameter uses [name resolution](../../advanced/name-mapping.html).

Name of the group policy object to attach this setting to.

### Key

> This parameter uses [name resolution](../../advanced/name-mapping.html).

The registry key affected.

### ValueName

> This parameter uses [name resolution](../../advanced/name-mapping.html).

The name of the value to modify.

### Value

> ParameterSet: Value

The value to insert into the specified registry-key-value.

### DomainData

> ParameterSet: DomainData

Instead of offering an explicit value, have the resulting value calculated by a scriptblock executed against the target domain.
In opposite to ADMF [Contexts](../../basics/contexts.html), DomainData data gathering scriptblocks are executed on a per-domain basis.
While a [Context](../../basics/contexts.html) supports integrating logic, [Contexts](../../basics/contexts.html) themselves are not re-run when switching to another domain with the same [Context](../../basics/contexts.html) choice.

DomainData gathering logic can be configured using the [Domain Data Component](domaindata.html).

### Type

What kind of registry value should be defined?
Supported types:

+ Binary
+ DWord
+ ExpandString
+ MultiString
+ QWord
+ String
