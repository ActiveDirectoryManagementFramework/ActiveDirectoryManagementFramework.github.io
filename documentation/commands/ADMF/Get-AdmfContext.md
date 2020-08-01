---
external help file: ADMF-help.xml
Module Name: ADMF
online version:
schema: 2.0.0
---

# Get-AdmfContext

## SYNOPSIS
Return available contexts.

## SYNTAX

### Search (Default)
```
Get-AdmfContext [-Name <String>] [-Store <String>] [-All] [<CommonParameters>]
```

### Current
```
Get-AdmfContext [-Current] [<CommonParameters>]
```

### Importing
```
Get-AdmfContext [-Importing] [<CommonParameters>]
```

### Server
```
Get-AdmfContext [-DomainTable] [<CommonParameters>]
```

## DESCRIPTION
Return available contexts.
By default, only the latest version of any given context will be returned.

## EXAMPLES

### EXAMPLE 1
```
Get-AdmfContext
```

Returns the latest version of all available contexts.

## PARAMETERS

### -Name
The name of the context to filter by.

```yaml
Type: String
Parameter Sets: Search
Aliases:

Required: False
Position: Named
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -Store
The context stores to look in.

```yaml
Type: String
Parameter Sets: Search
Aliases:

Required: False
Position: Named
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -All
Return all versions of any given context, rather than just the latest version.

```yaml
Type: SwitchParameter
Parameter Sets: Search
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Current
Displays the currently active contexts.

```yaml
Type: SwitchParameter
Parameter Sets: Current
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Importing
Return the contexts that are currently being imported.
Use this to react from within your context's scriptblocks to any other context that is selected.
This parameter only has meaning when used within a context's scriptblocks.

```yaml
Type: SwitchParameter
Parameter Sets: Importing
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -DomainTable
Return a list of which target domain has which contexts assigned in cache.

```yaml
Type: SwitchParameter
Parameter Sets: Server
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
