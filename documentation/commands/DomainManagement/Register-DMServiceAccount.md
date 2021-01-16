---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Register-DMServiceAccount

## SYNOPSIS
Register a Group Managed Service Account as a desired state object.

## SYNTAX

```
Register-DMServiceAccount [-Name] <String> [-DNSHostName] <String> [-Description] <String> [-Path] <String>
 [[-ServicePrincipalName] <String[]>] [[-DisplayName] <String>] [[-ObjectCategory] <String[]>]
 [[-ComputerName] <String[]>] [[-ComputerNameOptional] <String[]>] [[-Enabled] <TriBool>]
 [[-Present] <Boolean>] [[-Attributes] <Object>] [[-ContextName] <String>] [<CommonParameters>]
```

## DESCRIPTION
Register a Group Managed Service Account as a desired state object.
This will then be tested for during Test-DMServiceAccount and ensured during Invoke-DMServiceAccount.

## EXAMPLES

### EXAMPLE 1
```
Get-Content .\serviceaccounts.json | ConvertFrom-Json | Write-Output | Register-DMServiceAccount
```

Load up all settings defined in serviceaccounts.json

## PARAMETERS

### -Name
Name of the Service Account.
This must be a legal name, 15 characters or less (no trailing $ needed).
The SamAccountName will be automatically calculated based off this setting (by appending a $).
Supports string resolution.

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

### -DNSHostName
The DNSHostName of the gMSA.
Supports string resolution.

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
Describe what the gMSA is supposed to be used for.
Supports string resolution.

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

### -Path
The path where to place the gMSA.
Supports string resolution.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 4
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ServicePrincipalName
Any service principal names to add to the gMSA.
Supports string resolution.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: @()
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -DisplayName
A custom DisplayName for the gMSA.
Note, this setting will be ignored in the default dsa.msc console!
It only affects other applications that might be gMSA aware and support it.
Supports string resolution.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ObjectCategory
Only thus designated principals are allowed to retrieve the password to the gMSA.
Using this you can grant access to any members of given Object Categories.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ComputerName
Only thus designated principals are allowed to retrieve the password to the gMSA.
Using this you can grant access to an explicit list of computer accounts.
A missing computer will cause a warning, but not otherwise fail the process.
Supports string resolution.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ComputerNameOptional
Only thus designated principals are allowed to retrieve the password to the gMSA.
Using this you can grant access to an explicit list of computer accounts.
A missing computer will be logged but not otherwise noted.
Supports string resolution.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Enabled
Whether the account should be enabled or disabled.
By default, this is 'Undefined', causing the workflow to ignore its enablement state.

```yaml
Type: TriBool
Parameter Sets: (All)
Aliases:
Accepted values: False, True, Undefined

Required: False
Position: 10
Default value: Undefined
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Present
Whether the account should exist or not.
By default, it should.
Set this to $false in order to explicitly delete an existing gMSA.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
Default value: True
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Attributes
Offer additional attributes to define.
This can be either a hashtable or an object and can contain any writeable properties a gMSA can have in your organization.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 12
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ContextName
The name of the context defining the setting.
This allows determining the configuration set that provided this setting.
Used by the ADMF, available to any other configuration management solution.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 13
Default value: <Undefined>
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
