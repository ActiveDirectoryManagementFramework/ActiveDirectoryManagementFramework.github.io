---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Set-DMRedForestContext

## SYNOPSIS
Sets the basic information of the red forest.

## SYNTAX

### Access (Default)
```
Set-DMRedForestContext [-Server <String>] [-Credential <PSCredential>] [-EnableException] [<CommonParameters>]
```

### Name
```
Set-DMRedForestContext -FQDN <String> -Name <String> [-EnableException] [<CommonParameters>]
```

## DESCRIPTION
Sets the basic information of the red forest.
This is used to provide for replacement variables usable on all properties of all domain objects supporting string resolution.

There are two ways to gather this information:
- Collect it from a forest (default; Collects from the current user's forest by default)
- Explicitly provide the values.

## EXAMPLES

### EXAMPLE 1
```
Set-DMRedForestContext
```

Configures the current forest as red forest.

## PARAMETERS

### -Server
The server / domain to work with.

```yaml
Type: String
Parameter Sets: Access
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Credential
The credentials to use for this operation.

```yaml
Type: PSCredential
Parameter Sets: Access
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FQDN
FQDN of the forest.

```yaml
Type: String
Parameter Sets: Name
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Name of the forest (usually the same as the FQDN)

```yaml
Type: String
Parameter Sets: Name
Aliases:

Required: True
Position: Named
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
