---
external help file: ForestManagement-help.xml
Module Name: ForestManagement
online version:
schema: 2.0.0
---

# Test-FMSite

## SYNOPSIS
Tests a target foret's site configuration with the desired state.

## SYNTAX

```
Test-FMSite [[-Server] <ComputerParameter>] [[-Credential] <PSCredential>] [<CommonParameters>]
```

## DESCRIPTION
Tests a target foret's site configuration with the desired state.

## EXAMPLES

### EXAMPLE 1
```
Test-FMSite
```

Checks whether the current forest is compliant with the desired site configuration.

## PARAMETERS

### -Server
The server / domain to work with.

```yaml
Type: ComputerParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Credential
The credentials to use for this operation.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
