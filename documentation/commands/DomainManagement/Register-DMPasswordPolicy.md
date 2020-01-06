---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Register-DMPasswordPolicy

## SYNOPSIS
Register a new Finegrained Password Policy as the desired state.

## SYNTAX

```
Register-DMPasswordPolicy [-Name] <String> [-DisplayName] <String> [-Description] <String>
 [-Precedence] <Int32> [-MinPasswordLength] <Int32> [-SubjectGroup] <String[]> [-LockoutThreshold] <Int32>
 [-MaxPasswordAge] <TimeSpanParameter> [[-ComplexityEnabled] <Boolean>]
 [[-LockoutDuration] <TimeSpanParameter>] [[-LockoutObservationWindow] <TimeSpanParameter>]
 [[-MinPasswordAge] <TimeSpanParameter>] [[-PasswordHistoryCount] <Int32>]
 [[-ReversibleEncryptionEnabled] <Boolean>] [[-SubjectDomain] <String>] [[-Present] <Boolean>]
 [<CommonParameters>]
```

## DESCRIPTION
Register a new Finegrained Password Policy as the desired state.
These policies are then compared to the current state in a domain.

## EXAMPLES

### EXAMPLE 1
```
Get-Content $configPath | ConvertFrom-Json | Write-Output | Register-DMPasswordPolicy
```

Imports all the configured policies from the defined config json file.

## PARAMETERS

### -Name
The name of the PSO.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -DisplayName
The display name of the PSO.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Description
The description for the PSO.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Precedence
The precedence rating of the PSO.
The lower the precedence number, the higher the priority.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: 4
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -MinPasswordLength
The minimum number of characters a password must have.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: 5
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -SubjectGroup
The group that the PSO should be assigned to.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 6
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -LockoutThreshold
How many bad password entries will lead to account lockout?

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: 7
Default value: 0
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -MaxPasswordAge
The maximum age a password may have before it must be changed.

```yaml
Type: TimeSpanParameter
Parameter Sets: (All)
Aliases:

Required: True
Position: 8
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ComplexityEnabled
Whether complexity rules are applied to users affected by this policy.
By default, complexity rules requires 3 out of: "Lowercase letter", "Uppercase letter", "number", "special character".
However, custom password filters may lead to very validation rules.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: True
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -LockoutDuration
If the account is being locked out, how long will the lockout last.

```yaml
Type: TimeSpanParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: 1h
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -LockoutObservationWindow
What is the time window before the bad password count is being reset.

```yaml
Type: TimeSpanParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
Default value: 1h
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -MinPasswordAge
How soon may a password be changed again after updating the password.

```yaml
Type: TimeSpanParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: 12
Default value: 30m
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -PasswordHistoryCount
How many passwords are kept in memory to prevent going back to a previous password.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 13
Default value: 24
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ReversibleEncryptionEnabled
Whether the password should be stored in a manner that allows it to be decrypted into cleartext.
By default, only un-reversible hashes are being stored.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 14
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -SubjectDomain
The domain the group is part of.
Defaults to the target domain.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 15
Default value: %DomainFqdn%
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Present
Whether the PSO should exist.
Defaults to $true.
If this is set to $false, no PSO will be created, instead the PSO will be removed if it exists.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 16
Default value: True
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
