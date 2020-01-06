---
external help file: ADMF-help.xml
Module Name: ADMF
online version:
schema: 2.0.0
---

# Test-AdmfDomain

## SYNOPSIS
Tests a domain for its domain level content and whether it matches the desired state.

## SYNTAX

```
Test-AdmfDomain [[-Server] <ComputerParameter>] [[-Credential] <PSCredential>]
 [[-Options] <UpdateDomainOptions[]>] [<CommonParameters>]
```

## DESCRIPTION
Tests a domain for its domain level content and whether it matches the desired state.
Executes a large battery of tests from the DomainManagement module.
The desired state is defined using configuration files, which the module handles for the user.

## EXAMPLES

### EXAMPLE 1
```
Test-AdmfDomain -Server corp.fabrikam.com
```

Scans the domain corp.fabrikam.com for compliance with the desired state.

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
Which scan to execute.
By default, all tests are run, but it is possibly to selectively choose which to run.

```yaml
Type: UpdateDomainOptions[]
Parameter Sets: (All)
Aliases:
Accepted values: AccessRule, Acl, GPLink, GPPermission, GroupPolicy, GroupMembership, Group, OUSoft, OUHard, PSO, Security, User, AllContent, GPLinkDisable, AllLinks, GroupPolicyDelete, AllGP, Object, Default, All

Required: False
Position: 3
Default value: All
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
