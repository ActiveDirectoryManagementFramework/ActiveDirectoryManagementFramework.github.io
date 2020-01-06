---
external help file: ADMF-help.xml
Module Name: ADMF
online version:
schema: 2.0.0
---

# New-AdmfContext

## SYNOPSIS
Creates a new configuration context for ADMF.

## SYNTAX

### Store (Default)
```
New-AdmfContext -Name <String> [-Store <String>] [-Weight <Int32>] [-Description <String>] [-Author <String>]
 [-Group <String>] [-Prerequisite <String[]>] [-MutuallyExclusive <String[]>] [-DefaultAccessRules]
 [-IncludeTemplate] [-Force] [-EnableException] [<CommonParameters>]
```

### Path
```
New-AdmfContext -Name <String> [-OutPath <String>] [-Weight <Int32>] [-Description <String>] [-Author <String>]
 [-Group <String>] [-Prerequisite <String[]>] [-MutuallyExclusive <String[]>] [-DefaultAccessRules]
 [-IncludeTemplate] [-Force] [-EnableException] [<CommonParameters>]
```

## DESCRIPTION
Creates a new configuration context for ADMF.
Contexts are a set of configuration settings.
You can combine multiple contexts at the same time, merging the settings they contain.

For more details on how contexts work, see:

	Get-Help about_ADMF_Context

## EXAMPLES

### EXAMPLE 1
```
New-AdmfContext -Name 'newContext'
```

Creates a new context named "newContext"

### EXAMPLE 2
```
New-AdmfContext -Name 'Contoso_Baseline' -Store Company -Weight 10 -Author "Sad Joey" -DefaultccessRules -Description "Default baseline for contoso company forests"
```

Creates a new context ...
- Named "Contoso_Baseline"
- In the context store "Company"
- With the weight 10 (very low, causing it to be one of the first to be applied)
- By Sad Joey (a great and non-sad person)
- that contains the default access rules
- has a useful description of what it is for

## PARAMETERS

### -Name
The name of the context to create.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Store
The context store to create the context in.
Context Stores are registered filesystem locations where ADMF will look for contexts.
Defaults to the default store found in %AppData%.

```yaml
Type: String
Parameter Sets: Store
Aliases:

Required: False
Position: Named
Default value: Default
Accept pipeline input: False
Accept wildcard characters: False
```

### -OutPath
Create the context in a target path, rather than a registered store.
Keep in mind, that this will require the context to be manually moved to a registered location in order for it to become available to use.

```yaml
Type: String
Parameter Sets: Path
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Weight
The priority of the context.
This is used to determine the import order when importing multiple contexts.
The higher the value, the later in the import order.
Default: 50

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 50
Accept pipeline input: False
Accept wildcard characters: False
```

### -Description
Add a description to your context (for documentation purposes only).

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: <Insert description-text here>
Accept pipeline input: False
Accept wildcard characters: False
```

### -Author
The author of the context (for documentation purposes only)

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: <Insert your name here>
Accept pipeline input: False
Accept wildcard characters: False
```

### -Group
The group to assign the context to.
By default, will be part of the "Default" group.
Groups are only relevant fpr the itneractive context selection menu, where they govern the visual display style / grouping.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: Default
Accept pipeline input: False
Accept wildcard characters: False
```

### -Prerequisite
Contexts the current context depends on / requires.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: @()
Accept pipeline input: False
Accept wildcard characters: False
```

### -MutuallyExclusive
Contexts that are mutually exclusive with each other.
E.g.: Where the user has to select between one of several environments.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: @()
Accept pipeline input: False
Accept wildcard characters: False
```

### -DefaultAccessRules
A new Active Directory environment comes with more deployed security delegations than defined in the schema.
Several containers - especially the BuiltIn container - have a lot of extra access rules.
When deploying a restrictive domain content mode, where these objects fall under management, it becomes necessary to also configure these delegations, lest they be removed.
Setting this switch will include all the default delegations in your new context.

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

### -IncludeTemplate
Whether to include example configuration files in the context.
These must all be corrected or removed later on, but offer some initial guidance in how a configuration set for a given setting type might look like.

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

### -Force
This command refuses to replace an existing context by default.
Using force, it is a bit more brutish and will kill any previously existing context with the same name in the target store.

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
