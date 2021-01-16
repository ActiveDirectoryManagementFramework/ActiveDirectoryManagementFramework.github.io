---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Unregister-DMServiceAccount

## SYNOPSIS
Removes a service account from the list of registered service accounts.

## SYNTAX

```
Unregister-DMServiceAccount [-Name] <String[]> [<CommonParameters>]
```

## DESCRIPTION
Removes a service account from the list of registered service accounts.

## EXAMPLES

### EXAMPLE 1
```
Get-DMServiceAccount | Unregister-DMServiceAccount
```

Clear all configured service accounts.

## PARAMETERS

### -Name
The account to remove.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
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
