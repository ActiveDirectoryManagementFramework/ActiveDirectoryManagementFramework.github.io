---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Register-DMCallback

## SYNOPSIS
Registers a scriptblock to be called when invoking any Test- or Invoke- command.

## SYNTAX

```
Register-DMCallback [-Name] <String> [-ScriptBlock] <ScriptBlock> [<CommonParameters>]
```

## DESCRIPTION
Registers a scriptblock to be called when invoking any Test- or Invoke- command.
This enables extending the module and ensuring correct configuration loading.
The scriptblock will receive four arguments:
- The Server targeted (if any)
- The credentials used to do the targeting (if any)
- The Forest the two earlier pieces of information map to (if any)
- The Domain the two earlier pieces of information map to (if any)
Any and all of these pieces of information may be empty.
Any exception in a callback scriptblock will block further execution!

For more details on this system, call:
Get-Help about_DM_callbacks

## EXAMPLES

### EXAMPLE 1
```
Register-DMCallback -Name MyCompany -Scriptblock $scriptblock
```

Registers the scriptblock stored in $scriptblock under the name 'MyCompany'

## PARAMETERS

### -Name
The name of the callback to register (multiple can be active at any given moment).

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

### -ScriptBlock
The scriptblock containing the callback logic.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
