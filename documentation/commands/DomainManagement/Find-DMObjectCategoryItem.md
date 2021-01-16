---
external help file: DomainManagement-help.xml
Module Name: DomainManagement
online version:
schema: 2.0.0
---

# Find-DMObjectCategoryItem

## SYNOPSIS
Searches for items that are part of an object category.

## SYNTAX

```
Find-DMObjectCategoryItem [-Name] <String> [[-Property] <String[]>] [[-Server] <ComputerParameter>]
 [[-Credential] <PSCredential>] [-EnableException] [<CommonParameters>]
```

## DESCRIPTION
Searches for items that are part of an object category.
Caution: A combination of inefficient filters and large scope can lead to significant performance delays in large environments!

## EXAMPLES

### EXAMPLE 1
```
Find-DMObjectCategoryItem -Name 'CAServer'
```

Find all objects that are part of the CAServer category.

## PARAMETERS

### -Name
The name of the object category to search items for.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Property
Properties to include when retrieving matching items.
Ensure the property is legal for all potential matches.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
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
Position: 3
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
Position: 4
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
