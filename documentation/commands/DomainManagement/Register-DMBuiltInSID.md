---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Register-DMBuiltInSID

## SYNOPSIS
Register a name that points at a well-known SID.

## SYNTAX

```
Register-DMBuiltInSID [-Name] <String> [-SID] <SecurityIdentifier> [<CommonParameters>]
```

## DESCRIPTION
Register a name that points at a well-known SID.
This is used to reliably be able to compare access rules where built-in SIDs fail (e.g.
for Sub-Domains).
This functionality is exposed, in order to be able to resolve these identities, irrespective of name resolution and localization.

## EXAMPLES

### EXAMPLE 1
```
Register-DMBuiltInSID -Name 'BUILTIN\Incoming Forest Trust Builders' -SID 'S-1-5-32-557'
```

Maps the group 'BUILTIN\Incoming Forest Trust Builders' to the SID 'S-1-5-32-557'
Note: This mapping is pre-defined in the module and needs not be applied

## PARAMETERS

### -Name
The name of the builtin entity to map.

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

### -SID
The SID associated with the builtin entity.

```yaml
Type: SecurityIdentifier
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
