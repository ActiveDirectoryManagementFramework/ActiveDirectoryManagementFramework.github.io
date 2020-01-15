# Name Mapping

## Synopsis

[Contexts](contexts-advanced.html) are designed to be domain agnostic.
That is, that you can apply one configuration-set to any number of different domains.
In order to make this possible, it was necessary to provide a way to insert the relevant names.

Rather than hard-code a few such insertions, we decided to provide a freely extensible system for mapping names (or labels) to text values.

Many properties on many [Components](../components/components.html) support this name mapping, as should be documented on each such property.

For example, by defining the label `%environment%` as `"DEV"`, any setting using this in any supporting property will then have this label expanded.

## Why?

There are two main benefits/use-cases to this system:

+ Inserting domain-specific information
+ Separating name definition from name use. For example being able to user environment-specific names in another [Context](contexts-advanced.html), rather than being forced to specify all specific objects in each environment.

> *Scenario:*
> 
> One [Context](contexts-advanced.html) that contains the default baseline for all domains.
> Three [Contexts](contexts-advanced.html) for the specific environment (prod, dev and test).
> 
> This allows naming objects in the `default` [Context](contexts-advanced.html) that have environment-specific names and define what the name maps to in each of the environment [Contexts](contexts-advanced.html), rather than having to define (and maintain) the same objects in each of the three environment [Contexts](contexts-advanced.html), avoiding undesirable duplication.

## Default Names / Labels

The system automatically picks up certain names from the target domain and fills them in.
To manually load those names - for example for reference purposes during [Context](contexts-advanced.html) design - use the following command:

```powershell
Set-DMDomainContext -Server contoso.com
```

You can get a list of name mappings by using this command:

```powershell
Get-DMNameMapping
```

For example, for the domain `corp.contoso.com` (sub-domain of `contoso.com`), these would be the default name mappings:

| %RootDomainFqdn% | contoso.com |
| %RootDomainName% | contoso |
| %DomainFqdn% | corp.contoso.com |
| %RootDomainDN% | DC=contoso,DC=com |
| %ForestFqdn% | contoso.com |
| %DomainDN% | DC=corp,DC=contoso,DC=com |
| %DomainName% | corp |

## Defining Name Mappings

The recommended way to define name mappings is using the `domain/names` node in a given [Context](contexts-advanced.html).
This folder can contain any number of json files mapping names.

Example json content:

```json
[
    {
        "Name": "%Environment%",
        "Value": "DEV"
    }
]
```

Alternatively, you can manipulate the registered name-mappings using the following commands:

```powershell
Get-DMNameMapping
Register-DMNameMapping
Unregister-DMNameMapping
```

## Using Name Mappings

In supporting properties of implementing [Components](../components/components.html) you can use the label as you defined it and have the value inserted at runtime.

Example [AccessRule configuration](../components/domain/accessrules.html) using such labels:

```json
[
    {
        "Path":  "OU=Tiering,%DomainDN%",
        "ActiveDirectoryRights":  "ReadProperty, WriteProperty",
        "InheritanceType":  "None",
        "ObjectType":  "<All>",
        "InheritedObjectType":  "<All>",
        "AccessControlType":  "Allow",
        "Identity":  "%DomainName%\\Domain-Admins"
    }
]
```
