# Finegrained Password Policies

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

Whether complexity rules are applied to users affected by this policy.
By default, complexity rules requires 3 out of: "Lowercase letter", "Uppercase letter", "number", "special character".
However, custom password filters may lead to very validation rules.

### LockoutDuration

If the account is being locked out, how long will the lockout last.

### LockoutObservationWindow

What is the time window before the bad password count is being reset.

### MinPasswordAge

How soon may a password be changed again after updating the password.

### PasswordHistoryCount

How many passwords are kept in memory to prevent going back to a previous password.

### ReversibleEncryptionEnabled

Whether the password should be stored in a manner that allows it to be decrypted into cleartext.
By default, only un-reversible hashes are being stored.

### SubjectDomain

The domain the group is part of.
Defaults to the target domain.

### Present

Whether the PSO should exist.
Defaults to $true.
If this is set to $false, no PSO will be created, instead the PSO will be removed if it exists.
