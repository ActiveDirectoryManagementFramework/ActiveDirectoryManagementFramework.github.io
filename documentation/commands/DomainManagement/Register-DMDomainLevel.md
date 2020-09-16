---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Register-DMDomainLevel

## SYNOPSIS
Register a domain functional level as desired state.

## SYNTAX

```
Register-DMDomainLevel [[-Level] <String>] [[-ContextName] <String>] [<CommonParameters>]
```

## DESCRIPTION
Register a domain functional level as desired state.

## EXAMPLES

### EXAMPLE 1
```
Register-DMDomainLevel -Level 2016
```

Apply the desired domain level of 2016

## PARAMETERS

### -Level
The level to apply.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
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
Position: 2
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
