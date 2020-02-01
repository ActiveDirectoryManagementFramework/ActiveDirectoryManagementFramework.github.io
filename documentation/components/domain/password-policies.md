# Finegrained Password Policies

## Description

> Define Finegrained Password Policies objects in configuration.

## Example Configuration

```json
[
    {
        "Name":  "PSO-T0-Accounts",
        "DisplayName":  "Password Policies Object for tier 0 Accounts",
        "Description":  "Will be applied to all tier 0 Accounts",
        "MinPasswordLength":  30,
        "SubjectGroup":  "PSO-Policy-T0-Accounts",
        "LockoutThreshold":  5,
        "MaxPasswordAge":  "90d",
        "ComplexityEnabled":  true,
        "LockoutDuration":  "30m",
        "LockoutObservationWindow":  "30m",
        "MinPasswordAge":  "1d",
        "PasswordHistoryCount":  24
    }
]
```

## Tools

```powershell
$PSOs = Get-ADFineGrainedPasswordPolicy -Filter * | Select-Object *
$PSOs | Select-PSFObject @(
    'Name'
    'Displayname'
    'Description'
    'MinPasswordLength'
    'SubjectGroup'
    'LockoutThreshold'
    'MaxPasswordAge TO String'
    'ComplexityEnabled'
    'LockoutDuration TO String'
    'LockoutObservationWindow TO String'
    'MinPasswordAge TO String'
    'PasswordHistoryCount'
) | ConvertTo-Json
```

## Properties

### Name

The name of the PSO.

### DisplayName

The display name of the PSO.

### Description

The description for the PSO.

### Precedence

The precedence rating of the PSO.
The lower the precedence number, the higher the priority.

### MinPasswordLength

The minimum number of characters a password must have.

### SubjectGroup

The group that the PSO should be assigned to.

### LockoutThreshold

How many bad password entries will lead to account lockout?

### MaxPasswordAge

The maximum age a password may have before it must be changed.

### ComplexityEnabled

Optional: Yes | Default: `true`

Whether complexity rules are applied to users affected by this policy.
By default, complexity rules requires 3 out of: "Lowercase letter", "Uppercase letter", "number", "special character".
However, custom password filters may lead to very validation rules.

### LockoutDuration

Optional: Yes | Default: `1h`

If the account is being locked out, how long will the lockout last.

### LockoutObservationWindow

Optional: Yes | Default: `1h`

What is the time window before the bad password count is being reset.

### MinPasswordAge

Optional: Yes | Default: `30m`

How soon may a password be changed again after updating the password.

### PasswordHistoryCount

Optional: Yes | Default: `24`

How many passwords are kept in memory to prevent going back to a previous password.

### ReversibleEncryptionEnabled

Optional: Yes | Default: `false`

Whether the password should be stored in a manner that allows it to be decrypted into cleartext.
By default, only un-reversible hashes are being stored.

### SubjectDomain

Optional: Yes | Default: `%DomainFqdn%`

The domain the group is part of.
Defaults to the target domain.

### Present

Optional: Yes | Default: `true`

Whether the PSO should exist.
Defaults to $true.
If this is set to $false, no PSO will be created, instead the PSO will be removed if it exists.
