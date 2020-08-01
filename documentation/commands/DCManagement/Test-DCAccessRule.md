---
external help file: DCManagement-help.xml
Module Name: DCManagement
online version:
schema: 2.0.0
---

# Test-DCAccessRule

## SYNOPSIS
Tests all DCs, whether their NTFS filesystem Access Rules are configured as designed.

## SYNTAX

```
Test-DCAccessRule [[-Server] <ComputerParameter>] [[-Credential] <PSCredential>] [-EnableException]
 [<CommonParameters>]
```

## DESCRIPTION
Tests all DCs, whether their NTFS filesystem Access Rules are configured as designed.
This test ONLY considers paths, that are configured.
In opposite to the DomainManagement AccessRule Component there is no system that considers part of the DCs filesystem as "under management".

## EXAMPLES

### EXAMPLE 1
```
Test-DCAccessRule -Server corp.contoso.com
```

Tests, whether the filesystem Access Rules on all DCs of the corp.contoso.com domain are configured as designed.

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
