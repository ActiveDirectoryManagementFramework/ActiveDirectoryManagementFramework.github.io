---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Invoke-DMDomainData

## SYNOPSIS
Gathers domain specific data.

## SYNTAX

```
Invoke-DMDomainData [[-Name] <String>] [-Reset] [[-Server] <ComputerParameter>] [[-Credential] <PSCredential>]
 [-EnableException] [<CommonParameters>]
```

## DESCRIPTION
Gathers domain specific data.
The gathering scripts are supplied using Register-DMDomainData.
The data is currently consumed only by the extended group policy Component.

## EXAMPLES

### EXAMPLE 1
```
Invoke-DMDomainData @parameters -Name PKIServer
```

Executes the scriptblock stored as PKIServer against the targeted domain.

## PARAMETERS

### -Name
Name of the registered scriptblock to invoke.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Reset
Disable retrieving data from cache.
By default, all data is cached on a per-domain basis.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
