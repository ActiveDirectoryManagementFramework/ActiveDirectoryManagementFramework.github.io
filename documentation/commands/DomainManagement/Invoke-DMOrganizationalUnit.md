---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Invoke-DMOrganizationalUnit

## SYNOPSIS
Updates the organizational units of a domain to be compliant with the desired state.

## SYNTAX

```
Invoke-DMOrganizationalUnit [[-InputObject] <Object>] [-Delete] [[-Server] <ComputerParameter>]
 [[-Credential] <PSCredential>] [-EnableException] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Updates the organizational units of a domain to be compliant with the desired state.
Use Register-DMOrganizationalUnit to define a desired state before using this command.
Use Test-DMorganizationalUnit to receive details about the changes it will perform.

## EXAMPLES

### EXAMPLE 1
```
Invoke-DMOrganizationalUnit -Server contoso.com
```

Brings the domain contoso.com into OU compliance.

## PARAMETERS

### -InputObject
Test results provided by the associated test command.
Only the provided changes will be executed, unless none were specified, in which ALL pending changes will be executed.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Delete
Implement deletion commands.
By default, when updating an existing deployment you would need to creaate missing OUs first, then move other objects and only delete OUs as the final step.
In order to prevent accidents, by default NO OUs will be deleted.
To enable OU deletion, you must specify this parameter.
This parameter allows you to call it twice in your workflow: Once to prepare it for other objects, and another time to do the cleanup.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Server
The server / domain to work with.

```yaml
Type: ComputerParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
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
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnableException
This parameters disables user-friendly warnings and enables the throwing of exceptions.
This is less user friendly, but allows catching exceptions in calling scripts.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

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
