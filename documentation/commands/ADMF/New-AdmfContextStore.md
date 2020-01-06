---
external help file: ADMF-help.xml
Module Name: ADMF
online version:
schema: 2.0.0
---

# New-AdmfContextStore

## SYNOPSIS
Creates a new Context Store.

## SYNTAX

```
New-AdmfContextStore [-Name] <String> [-Path] <String> [[-Scope] <ConfigScope>] [-EnableException]
 [<CommonParameters>]
```

## DESCRIPTION
Creates a new Context Store.
Context Stores are locations where configuration contexts are stored and retrieved from.

These contexts are stored using the PSFramework configuration system:
https://psframework.org/documentation/documents/psframework/configuration.html
Making it possible to deploy them using GPO, SCCM or other computer or profile management solutions.

## EXAMPLES

### EXAMPLE 1
```
New-AdmfContextStore -Name 'company' -Path '\\contoso\system\ad\contexts'
```

Creates a new context named 'company', pointing at '\\\\contoso\system\ad\contexts'

## PARAMETERS

### -Name
The name of the store to create.
Must not exist yet.

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

### -Path
The path where the context is pointing at.
Must be an existing folder.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Scope
Where to persist the store.
by default, this is stored in HKCU, making the store persistently available to the user.
For more information on scopes, and what location they corespond with, see:
https://psframework.org/documentation/documents/psframework/configuration/persistence-location.html

```yaml
Type: ConfigScope
Parameter Sets: (All)
Aliases:
Accepted values: UserDefault, UserMandatory, SystemDefault, SystemMandatory, FileUserLocal, FileUserShared, FileSystem

Required: False
Position: 3
Default value: UserDefault
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
