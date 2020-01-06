---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Register-DMGroupMembership

## SYNOPSIS
Registers a group membership assignment as desired state.

## SYNTAX

### Entry (Default)
```
Register-DMGroupMembership -Name <String> -Domain <String> -ItemType <String> -Group <String>
 [<CommonParameters>]
```

### Empty
```
Register-DMGroupMembership -Group <String> -Empty <Boolean> [<CommonParameters>]
```

## DESCRIPTION
Registers a group membership assignment as desired state.
Any group with configured membership will be considered "managed" where memberships are concerned.
This will causse all non-registered memberships to be configured for purging.

## EXAMPLES

### EXAMPLE 1
```
Get-Content $configPath | ConvertFrom-Json | Write-Output | Register-DMGroupMembership
```

Imports all defined groupmemberships from the targeted json configuration file.

## PARAMETERS

### -Name
The name of the user or group to grant membership in the target group.

```yaml
Type: String
Parameter Sets: Entry
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Domain
Domain the entity is from, that is being granted group membership.

```yaml
Type: String
Parameter Sets: Entry
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ItemType
The type of object being granted membership.

```yaml
Type: String
Parameter Sets: Entry
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Group
The group to define members for.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Empty
Whether the specified group should be empty.
By default, groups are only considered when at least one member has been defined.
Flagging a group for being empty will clear all members from it.

```yaml
Type: Boolean
Parameter Sets: Empty
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
