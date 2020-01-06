---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Resolve-DMObjectCategory

## SYNOPSIS
Resolves what object categories apply to a given AD Object.

## SYNTAX

```
Resolve-DMObjectCategory [-ADObject] <Object> [[-Server] <ComputerParameter>] [[-Credential] <PSCredential>]
 [<CommonParameters>]
```

## DESCRIPTION
Resolves what object categories apply to a given AD Object.

## EXAMPLES

### EXAMPLE 1
```
Resolve-DMObjectCategory @parameters -ADObject $adobject
```

Resolves the object categories that apply to $adobject

## PARAMETERS

### -ADObject
The AD Object for which to resolve the object categories.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Server
The server / domain to work with.

```yaml
Type: ComputerParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
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
Position: 3
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
