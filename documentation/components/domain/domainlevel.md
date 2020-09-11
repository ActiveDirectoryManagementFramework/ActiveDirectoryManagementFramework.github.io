# Domain Level

## Description

The Domain Level Component enables defining a desired [functional level](https://docs.microsoft.com/en-us/windows-server/identity/ad-ds/active-directory-functional-levels) for the managed domain.
The [functional level](https://docs.microsoft.com/en-us/windows-server/identity/ad-ds/active-directory-functional-levels) defines what Active Directory features are available to the domain.

## Defining Domain Level

To do define the Domain Level, place a file named `domain_level.json` straight in the domain folder.

This file should be a simple json object with a single property: Level.

Example content:

```json
{
    "Level":  "2016"
}
```

Supported values: 2008R2, 2012, 2012R2 or 2016

> It is impossible to downgrade a domain functional level, so even if you define a low level, it will not be applied if the domain is already at a higher level.
