# Groups

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

### Name

The name of the group.
Subject to string insertion.

### Path

Path (distinguishedName) of the OU to place the group in.
Subject to string insertion.

### Description

Description of the group.
Subject to string insertion.

### Scope

The scope of the group.
Use DomainLocal for groups that grrant direct permissions and Global for role groups.

### Category

Whether the group should be a security group or a distribution group.
Defaults to security.

### OldNames

Previous names the group used to have.
By specifying this name, groups will be renamed if still using an old name.
Conflicts may require resolving.

### Present

Whether the group should exist.
Defaults to $true
Set to $false for explicitly deleting groups, rather than creating them.
