---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Test-DMAccessRule

## SYNOPSIS
Validates the targeted domain's Access Rule configuration.

## SYNTAX

```
Test-DMAccessRule [[-Server] <ComputerParameter>] [[-Credential] <PSCredential>] [<CommonParameters>]
```

## DESCRIPTION
Validates the targeted domain's Access Rule configuration.
This is done by comparing each relevant object's non-inherited permissions with the Schema-given default permissions for its object type.
Then the remaining explicit permissions that are not part of the schema default are compared with the configured desired state.

The desired state can be defined using Register-DMAccessRule.
Basically, two kinds of rules are supported:
- Path based access rules - point at a DN and tell the system what permissions should be applied.
- Rule based access rules - All objects matching defined conditions will be affected by the defined rules.
To define rules - also known as Object Categories - use Register-DMObjectCategory.
Example rules could be "All Domain Controllers" or "All Service Connection Points with the name 'Virtual Machine'"

This command will test all objects that ...
- Have at least one path based rule.
- Are considered as "under management", as defined using Set-DMContentMode
It uses a definitive approach - any access rule not defined will be flagged for deletion!

## EXAMPLES

### EXAMPLE 1
```
Test-DMAccessRule -Server fabrikam.com
```

Tests, whether the fabrikam.com domain conforms to the configured, desired state.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
