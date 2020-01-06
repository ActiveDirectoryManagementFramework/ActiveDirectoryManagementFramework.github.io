---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Convert-DMSchemaGuid

## SYNOPSIS
Converts names to guid and guids to name as defined in the active directory schema.

## SYNTAX

```
Convert-DMSchemaGuid [[-Name] <String[]>] [[-OutType] <String>] [[-Server] <ComputerParameter>]
 [[-Credential] <PSCredential>] [<CommonParameters>]
```

## DESCRIPTION
Converts names to guid and guids to name as defined in the active directory schema.
Can handle both attributes as well as rights.
Uses mapping data generated from active directory.

## EXAMPLES

### EXAMPLE 1
```
Convert-DMSchemaGuid -Name Public-Information -OutType GuidString
```

Converts the right "Public-Information" into its guid representation (guid returned as a string type)

## PARAMETERS

### -Name
The name to convert.
Can be both string or guid.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: Guid

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -OutType
The data tape to emit:
- Name: Humanly readable name
- Guid: Guid object
- GuidString: Guid as a string

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: Guid
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
Position: 3
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
Position: 4
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
