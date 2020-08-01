---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Resolve-DMAccessRuleMode

## SYNOPSIS
Resolves the AccessRule processing mode that applies to the specified ADObject.

## SYNTAX

```
Resolve-DMAccessRuleMode [-ADObject] <Object> [[-Server] <ComputerParameter>] [[-Credential] <PSCredential>]
 [<CommonParameters>]
```

## DESCRIPTION
Resolves the AccessRule processing mode that applies to the specified ADObject.

## EXAMPLES

### EXAMPLE 1
```
Resolve-DMAccessRuleMode @parameters -ADObject $adObject
```

Resolves the AccessRule processing mode that applies to the specified ADObject.

## PARAMETERS

### -ADObject
The AD Object for which to resolve the AccessRule processing mode.

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

### System.String
## NOTES

## RELATED LINKS
