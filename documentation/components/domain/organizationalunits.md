# Organizational Units

## Description

> Add Content

## Example Configuration

> Add Content

```json
[
    {
        "Name":  "Admins",
        "Description":  "Will be applied to all tier 0 Accounts",
        "MinPasswordLength":  30,
        "SubjectGroup":  "PSO-Policy-T0-Accounts",
        "LockoutThreshold":  5,
        "MaxPasswordAge":  "90.00:00:00",
        "ComplexityEnabled":  true,
        "LockoutDuration":  "00:30:00",
        "LockoutObservationWindow":  "00:30:00",
        "MinPasswordAge":  "1.00:00:00",
        "PasswordHistoryCount":  24
    }
]
```

## Tools

```powershell

```

## Properties

### Name

Name of the OU to register.

> Subject to string insertion.

### Description

Description for the OU to register.

> Subject to string insertion.

### Path

The path to where the OU should be.

> Subject to string insertion.

### OldNames

Previous names the OU had.
During invocation, if it is not found but an OU in the same path with a listed old name IS, it will be renamed.

> Subject to string insertion.

### Present

Whether the OU should be present.
Defaults to $true
