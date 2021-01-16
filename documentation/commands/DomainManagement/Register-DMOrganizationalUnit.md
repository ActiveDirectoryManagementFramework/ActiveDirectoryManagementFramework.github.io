---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Register-DMOrganizationalUnit

## SYNOPSIS
Registers an organizational unit, defining it as a desired state.

## SYNTAX

```
Register-DMOrganizationalUnit [-Name] <String> [-Description] <String> [-Path] <String> [[-Optional] <Boolean>]
 [[-OldNames] <String[]>] [[-Present] <Boolean>] [<CommonParameters>]
```

## DESCRIPTION
Registers an organizational unit, defining it as a desired state.

## EXAMPLES

### EXAMPLE 1
```
Get-Content .\organizationalUnits.json | ConvertFrom-Json | Write-Output | Register-DMOrganizationalUnit
```

Reads a json configuration file containing a list of objects with appropriate properties to import them as organizational unit configuration.

## PARAMETERS

### -Name
Name of the OU to register.
Subject to string insertion.

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

### -Description
Description for the OU to register.
Subject to string insertion.

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

### -Path
The path to where the OU should be.
Subject to string insertion.

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

### -Optional
By default, organizational units must exist if defined.
Setting this to true makes them optional instead - they will not be created but are tolerated if they exist.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -OldNames
Previous names the OU had.
During invocation, if it is not found but an OU in the same path with a listed old name IS, it will be renamed.
Subject to string insertion.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: @()
Accept pipeline input: False
Accept wildcard characters: False
```

### -Present
Whether the OU should be present.
Defaults to $true

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
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
