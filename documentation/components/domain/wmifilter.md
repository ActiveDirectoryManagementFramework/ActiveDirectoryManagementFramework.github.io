# WMI Filters

## Description

WMI Filters are a component in Active Directory that can be used on [Group Policy Objects](grouppolicies.html), in order to further narrow down, what targets they actually apply to.
If the local WMI request returns results, the respective Windows Computer considers the requirements of the filter met and will apply the policy.

> WMI Filters and [Content Mode](../../basics/contentmode.html)

As WMI Filters exist in their own section of the Domain Naming Context and not the easily managed scope of the OU structure, it becomes impossible to handle via the path Include/Exclude settings of the [Content Mode](../../basics/contentmode.html).
By default, WMI Filters not defined via ADMF will not be touched.
This behavior can be changed however, by setting the `RemoveUnknownWmiFilter` [Content Mode](../../basics/contentmode.html) property to `$true`.

## Example Configuration

All configuration entries can be provided in either json or psd1 format, the following two configuration entries are hence equivalent:

> Json

```json
{
    "Name": "Windows10",
    "Description": "Requires Windows 10 OS Version",
    "Query": "SELECT * FROM Win32_OperatingSystem WHERE Caption like \"Microsoft Windows 10%\""
}
```

> Psd1

```powershell
@{
    Name = "Windows10"
    Description = "Requires Windows 10 OS Version"
    Query = 'SELECT * FROM Win32_OperatingSystem WHERE Caption like "Microsoft Windows 10%"'
}
```

## Properties

### Name

Name of the WMI Filter (must be unique in domain).

### Description

A description of the WMI filter

### Query

The filter query/ies to apply.
Can be multiple queries, defaults to the WMI namespace defined in the namespace parameter.
To specify a namespace with the query, use this notation: {namespace};{query}
(without the curly braces).

Examples:

+ `SELECT * FROM Win32_OperatingSystem WHERE Caption like "Microsoft Windows 10%"`
+ `root\CIMv2;SELECT * FROM Win32_OperatingSystem WHERE Caption like "Microsoft Windows 10%"`

### Namespace

The WMI namespace in which the queries will be executed by default.

> Defaults to: `root\CIMv2`

### Author

The author of the WMI filter. Purely documentational.

> Defaults to: undefined

### CreatedOn

The timestamp the WMI filter was defined at. Purely documentational.

> Defaults to: `Get-Date`
