---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Unregister-DMOrganizationalUnit

## SYNOPSIS
Removes an organizational unit from the list of registered OUs.

## SYNTAX

### DN (Default)
```
Unregister-DMOrganizationalUnit -DistinguishedName <String> [<CommonParameters>]
```

### NamePath
```
Unregister-DMOrganizationalUnit -Name <String> -Path <String> [<CommonParameters>]
```

## DESCRIPTION
Removes an organizational unit from the list of registered OUs.
This effectively removes it from the definition of the desired OU state.

## EXAMPLES

### EXAMPLE 1
```
Get-DMOrganizationalUnit | Unregister-DMOrganizationalUnit
```

Removes all registered organizational units from the configuration

## PARAMETERS

### -Name
The name of the OU to unregister.

```yaml
Type: String
Parameter Sets: NamePath
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Path
The path of the OU to unregister.

```yaml
Type: String
Parameter Sets: NamePath
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -DistinguishedName
The full Distinguished name of the OU to unregister.

```yaml
Type: String
Parameter Sets: DN
Aliases:

Required: True
Position: Named
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
