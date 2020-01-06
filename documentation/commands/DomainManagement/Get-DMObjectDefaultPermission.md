---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Get-DMObjectDefaultPermission

## SYNOPSIS
Gathers the default object permissions in AD.

## SYNTAX

```
Get-DMObjectDefaultPermission [-ObjectClass] <String> [[-Server] <ComputerParameter>]
 [[-Credential] <PSCredential>] [<CommonParameters>]
```

## DESCRIPTION
Gathers the default object permissions in AD.
Uses PowerShell remoting against the SchemaMaster to determine the default permissions, as local identity resolution is not reliable.

## EXAMPLES

### EXAMPLE 1
```
Get-DMObjectDefaultPermission -ObjectClass user
```

Returns the default permissions for a user.

## PARAMETERS

### -ObjectClass
The object class to look up.

```yaml
Type: String
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
Default value: <Default>
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
