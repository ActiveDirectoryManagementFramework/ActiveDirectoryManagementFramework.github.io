---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Unregister-DMAcl

## SYNOPSIS
Removes a acl that had previously been registered.

## SYNTAX

```
Unregister-DMAcl [[-Path] <String[]>] [<CommonParameters>]
```

## DESCRIPTION
Removes a acl that had previously been registered.

## EXAMPLES

### EXAMPLE 1
```
Get-DMAcl | Unregister-DMAcl
```

Clears all registered acls.

## PARAMETERS

### -Path
The path (distinguishedName) of the acl to remove.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
