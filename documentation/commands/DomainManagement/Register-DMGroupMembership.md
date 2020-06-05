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
Register-DMGroupMembership -Name <String> -Domain <String> -ItemType <String> -Group <String> [-Mode <String>]
 [-ContextName <String>] [<CommonParameters>]
```

### Empty
```
Register-DMGroupMembership -Group <String> -Empty <Boolean> [-Mode <String>] [-ContextName <String>]
 [<CommonParameters>]
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

### -Mode
How group memberships will be processed:
- Default:             Member must exist and be member of the group.
- MayBeMember:         Principal must exist but may be a member.
No add action will be generated if not a member, but also no remove action if it already is a member.
- MemberIfExists:      If Principal exists, make it a member.
- MayBeMemberIfExists: Both existence and membership are optional for this principal.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: Default
Accept pipeline input: False
Accept wildcard characters: False
```

### -ContextName
The name of the context defining the setting.
This allows determining the configuration set that provided this setting.
Used by the ADMF, available to any other configuration management solution.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: <Undefined>
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
