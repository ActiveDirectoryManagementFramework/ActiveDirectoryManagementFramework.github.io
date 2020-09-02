# Forest Level

## Description

The Forest Level Component enables defining a desired [functional level](https://docs.microsoft.com/en-us/windows-server/identity/ad-ds/active-directory-functional-levels) for the managed forest.
The [functional level](https://docs.microsoft.com/en-us/windows-server/identity/ad-ds/active-directory-functional-levels) defines what Active Directory features are available to the forest.

## Defining Forest Level

To do define the Forest Level, place a file named `firest_level.json` straight in the forest folder.

This file should be a simple json object with a single property: Level.

Example content:

```json
{
    "Level":  "2016"
}
```

Supported values: 2008R2, 2012, 2012R2 or 2016

> It is impossible to downgrade a forest functional level, so even if you define a low level, it will not be applied if the domain is already at a higher level.

> It is impossible to upgrade the forest to a level not yet reached by all member domains.
In order to upgrade the forest functional level, be sure to first update every single domain.
