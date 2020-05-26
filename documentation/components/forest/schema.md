# Schema Attribute

## Description

Using this [Component](../components.html) it becomes possible to define a custom schema attribute.

Please give the attribute documentation careful attention before defining your own extensions, as this process may become hard to reverse.

> When working with the AD Schema, keep in mind the [special considerations for privileges](../../advanced/schema-privilege-management.html)

## Example Configuration

```json
[
    {
        "ObjectClass":  ["user"],
        "OID":  "0.9.2342.19200300.100.1.10",
        "AdminDisplayName":  "Manager",
        "LdapDisplayName":  "manager",
        "OMSyntax":  127,
        "AttributeSyntax":  "2.5.5.1",
        "SingleValued":  true,
        "AdminDescription":  "The manager of a given user",
        "SearchFlags":  1,
        "PartialAttributeSet":  true,
        "AdvancedView":  false
    }
]
```

## Tools

While building this configuration should be rare and significant enough that manual inspection with redundant reviews should be worthwhile, here is one snippet to generate a sample attribute json:

```powershell
$rootDSE = Get-ADRootDSE
$schemaNC = $rootDSE.schemaNamingContext
Get-ADObject -Filter 'Name -eq "manager"' -SearchBase $schemaNC -Properties * |
  Select-PSFObject @(
      'attributeID as OID'
      'AdminDisplayName'
      'LdapDisplayName'
      'OMSyntax'
      'AttributeSyntax'
      'isSingleValued as SingleValued'
      'AdminDescription'
      'SearchFlags'
      'isMemberOfpartialAttributeSet as PartialAttributeSet'
      'showInAdvancedViewOnly as AdvancedView'
  ) | Add-Member -MemberType NoteProperty -Name ObjectClass -Value @() -PassThru |
    ConvertTo-Json
```

Replace the search-filter to pick the attribute you actually want to copy.
Then absolutely remember to update the OID to a new, unique value and add new names at the absolute minimum.

## Properties

### ObjectClass

List of object-class names that should have this property.
For example, pick `"user"` for an attribute that should be added to user objects.

### OID

The unique [Attribute ID](https://docs.microsoft.com/en-us/windows/win32/adschema/a-attributeid) of the attribute.
Object identifier handling can be a complex consideration all by itself.
If your company has no guidance on this, [Microsoft offers guidance on how to obtaining a dedicated root OID](https://docs.microsoft.com/en-us/windows/win32/ad/obtaining-an-object-identifier-from-microsoft).

### AdminDisplayName

The [AdminDisplayName](https://docs.microsoft.com/windows/desktop/ADSchema/a-admindisplayname) is the name commonly seen by a human user.
Should be unique and - to reduce risk for confusion - be equal to the [LdapDisplayName](https://docs.microsoft.com/windows/desktop/ADSchema/a-ldapdisplayname).

### LdapDisplayName

The [LdapDisplayName](https://docs.microsoft.com/windows/desktop/ADSchema/a-ldapdisplayname) must be unique and will be the name you programmatically access the attribute.
For example, if you create an attribtue that is assigned to user objects and then want to search for users that have a specific value for that attribute using PowerShell, this is the name you use for filtering.

### OMSyntax

One part of the syntax notation (together with [AttributeSyntax](https://docs.microsoft.com/windows/desktop/ADSchema/a-attributesyntax)).
Syntaxes define what kind of data can be stored in an attribute.

You can find the list of supported syntaxes [here](https://docs.microsoft.com/en-us/windows/win32/adschema/syntaxes).

> For example, the previously used example - the "manager" attribute - uses the [object(DS-DN)](https://docs.microsoft.com/en-us/windows/win32/adschema/s-object-ds-dn) syntax, resulting in an OMSyntax of `127`.

### AttributeSyntax

The [AttributeSyntax](https://docs.microsoft.com/windows/desktop/ADSchema/a-attributesyntax) - together with the [OMSyntax](https://docs.microsoft.com/windows/desktop/ADSchema/a-omsyntax) - define, what kind of data can be stored in the attribute being defined.

You can find the list of supported syntaxes [here](https://docs.microsoft.com/en-us/windows/win32/adschema/syntaxes).

> For example, the previously used example - the "manager" attribute - uses the [object(DS-DN)](https://docs.microsoft.com/en-us/windows/win32/adschema/s-object-ds-dn) syntax, resulting in an AttributeSyntax of `"2.5.5.1"`.

### SingleValued

Whether the attribute can only store one entry or any number of entries of the defined type.
See [AttributeSyntax](https://docs.microsoft.com/windows/desktop/ADSchema/a-attributesyntax), [OMSyntax](https://docs.microsoft.com/windows/desktop/ADSchema/a-omsyntax) and [Syntax definitions](https://docs.microsoft.com/en-us/windows/win32/adschema/syntaxes) for attribute data types.

### AdminDescription

A sensible description that explains the purpose of this attribute.

### SearchFlags

The searchflags allow governing a lot of details on how this attribute is handled in memory as well as the database.
This is a bitmap property, meaning that any of [its options](https://docs.microsoft.com/en-us/windows/win32/adschema/a-searchflags#remarks) can be combined by adding up their decimal-numeric value.

Their main purpose is to define whether and how the attribute is indexed.
Indexing a property costs DC resources, and slows updating-performance of the property by a small amount.
Only enable indexing, if you expect to use the attribute often in searches as a filter condition.

A few common indexing setups:

| 0 | Not Indexed |
| 1 | Plain Index |
| 5 | Indexed and part of [Ambiguous Name Resolution](https://social.technet.microsoft.com/wiki/contents/articles/22653.active-directory-ambiguous-name-resolution.aspx) |
| 33 | Tuple-Indexed, better performance on searches with leading '*' for double the cost |

Other behaviors you can usefully define using this attribute:

| 8 | Preserve on Tombstone |
| 16 | Copy this attribute's value if the object it belongs to is copied |
| 128 | Attribute is confidential. This requires explicitly granting access, GenericAll permissions will not grant access |

### PartialAttributeSet

Boolean value, determines [whether this attribute is on the global catalog](https://docs.microsoft.com/en-us/windows/win32/ad/attributes-included-in-the-global-catalog).

### AdvancedView

Whether the defined attribute is visible in advanced view of the ADUC mmc console only.
Given that custom attributes will usually only show up in the attribute editor (available in advanced view only), this setting rarely has any effect.
