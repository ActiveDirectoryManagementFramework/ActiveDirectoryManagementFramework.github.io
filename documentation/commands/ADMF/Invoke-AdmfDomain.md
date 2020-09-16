---
external help file: ADMF-help.xml
Module Name: ADMF
online version:
schema: 2.0.0
---

# Invoke-AdmfDomain

## SYNOPSIS
Brings a domain into compliance with the desired state.

## SYNTAX

```
Invoke-AdmfDomain [[-Server] <ComputerParameter>] [[-Credential] <PSCredential>]
 [[-Options] <UpdateDomainOptions[]>] [[-CredentialProvider] <String>] [-ContextPrompt] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Brings a domain into compliance with the desired state.
It implements a wide variety of settings against the targeed domain,
whether it be OUs, groups, users, gpos, acls or many more items.

Note on order:
- OU Creation and Updating should be done first, but DELETING ous (OUHard) should be one of the last operations performed.
- Acl & Access operations should be performed last
- Managing group policy yields best results in this order:
  1.
Create new GPO
  2.
Create Links, only disabling undesired links
  3.
Delete unneeded GPO
  4.
Delete undesired links
  This is due to the fact that "unneeded GPO" are detected by being linked into managed GPOs.

## EXAMPLES

### EXAMPLE 1
```
Invoke-AdmfDomain
```

Brings the current domain into compliance with the desired state.

## PARAMETERS

### -Server
The server / domain to work with.

```yaml
Type: ComputerParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
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
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Options
The various operations that are supported.
By default "default" operations are executed against the targeted domain.
  	- Acl : The basic permission behavior of an object (e.g.: Owner, Inheritance)
  	- GPLink : Manages the linking of group policies.
  	- GPPermission : Managing permissions on group policy objects.
  	- GroupPolicy : Deploying and updating GPOs.
  	- GroupMembership : Assigning group membership
  	- Group : Creating groups
  	- OUSoft : Creating & modifying OUs, but not deleting them
- OUHard : Creating, Modifying & Deleting OUs.
This exists in order to be able to create
		   new OUs, then move all objects over and only when done deleting undesired OUs.
		   Will NOT delete OUs that contain objects.!
- PSO : Implementing Finegrained Password Policies
- Object : Custom AD object
  	- User : Managing User objects
- GPLinkDisable : Creating GP Links, but only disabling undesired links.
				  This is needed in order to detect undesired GPOs to delete:
				  Those linked when they shouldn't be!
  	- GroupPolicyDelete : Deploy, update and delete Group Policy objects.

```yaml
Type: UpdateDomainOptions[]
Parameter Sets: (All)
Aliases:
Accepted values: AccessRule, Acl, GPLink, GPPermission, GroupPolicy, GroupMembership, Group, OUSoft, OUHard, PSO, Security, User, AllContent, GPLinkDisable, AllLinks, GroupPolicyDelete, AllGP, Object, Default, DomainLevel, All

Required: False
Position: 3
Default value: Default
Accept pipeline input: False
Accept wildcard characters: False
```

### -CredentialProvider
The credential provider to use to resolve the input credentials.
See help on Register-AdmfCredentialProvider for details.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: Default
Accept pipeline input: False
Accept wildcard characters: False
```

### -ContextPrompt
Force displaying the Context selection User Interface.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: Ctx

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
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
