---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Register-DMDomainData

## SYNOPSIS
Registers a domain data gathering script.

## SYNTAX

```
Register-DMDomainData [-Name] <String> [-Scriptblock] <ScriptBlock> [[-ContextName] <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Registers a domain data gathering script.
These can be used to provide domain specific data (in contrast to the usual context specific data, which might be applied to multiple domains).

## EXAMPLES

### EXAMPLE 1
```
Import-PowerShellDataFile .\config.psd1 | ForEach-Object { Register-DMDomainData @_ }
```

Registers all configuration settings stored in config.psd1

## PARAMETERS

### -Name
Name under which to register the data gathering script.
Can only contain letters, numbers and underscores.

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

### -Scriptblock
The scriptblock performing the actual gathering.
Receives a hashtable containing Server and - possibly - Credentials.

```yaml
Type: ScriptBlock
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
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
Position: 3
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
