---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Unregister-DMGroupMembership

## SYNOPSIS
Removes entries from the list of desired group memberships.

## SYNTAX

```
Unregister-DMGroupMembership [-Name] <String> [-ItemType] <String> [-Group] <String> [<CommonParameters>]
```

## DESCRIPTION
Removes entries from the list of desired group memberships.

## EXAMPLES

### EXAMPLE 1
```
Get-DMGroupMembership | Unregister-DMGroupMembership
```

Removes all configured desired group memberships.

## PARAMETERS

### -Name
Name of the identity being granted group membership

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

### -ItemType
The type of object the identity being granted group membership is.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Group
The group being granted membership in.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
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
