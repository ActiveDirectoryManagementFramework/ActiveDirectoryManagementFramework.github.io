---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Unregister-DMUser

## SYNOPSIS
Removes a user that had previously been registered.

## SYNTAX

```
Unregister-DMUser [[-Name] <String[]>] [<CommonParameters>]
```

## DESCRIPTION
Removes a user that had previously been registered.

## EXAMPLES

### EXAMPLE 1
```
Get-DMUser | Unregister-DMUser
```

Clears all registered users.

## PARAMETERS

### -Name
The name of the user to remove.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: SamAccountName

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
