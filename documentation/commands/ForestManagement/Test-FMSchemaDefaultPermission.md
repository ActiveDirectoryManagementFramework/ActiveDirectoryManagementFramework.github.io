---
external help file: ForestManagement-help.xml
Module Name: ForestManagement
online version:
schema: 2.0.0
---

# Test-FMSchemaDefaultPermission

## SYNOPSIS
Validates, whether the target forest has the defined default permissions applied in its schema.

## SYNTAX

```
Test-FMSchemaDefaultPermission [[-Server] <ComputerParameter>] [[-Credential] <PSCredential>]
 [-EnableException] [<CommonParameters>]
```

## DESCRIPTION
Validates, whether the target forest has the defined default permissions applied in its schema.
Returns a list of all actions that would be taken by the associated Invoke-* command.

## EXAMPLES

### EXAMPLE 1
```
Test-FMSchemaDefaultPermission -Server contoso.com
```

Validates, whether the contoso.com forest has the defined default permissions applied in its schema.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
