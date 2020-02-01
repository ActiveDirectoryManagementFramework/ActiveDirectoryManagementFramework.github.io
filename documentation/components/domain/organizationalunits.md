# Organizational Units

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

Name of the OU to register.
Subject to string insertion.

### Description

Description for the OU to register.
Subject to string insertion.

### Path

The path to where the OU should be.
Subject to string insertion.

### OldNames

Previous names the OU had.
During invocation, if it is not found but an OU in the same path with a listed old name IS, it will be renamed.
Subject to string insertion.

### Present

Whether the OU should be present.
Defaults to $true
