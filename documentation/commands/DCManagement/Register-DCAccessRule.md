---
external help file: DCManagement-help.xml
Module Name: DCManagement
online version:
schema: 2.0.0
---

# Register-DCAccessRule

## SYNOPSIS
Registers an access rule for FileSystem paths on a domain controller.

## SYNTAX

### ACE
```
Register-DCAccessRule -Path <String> -Identity <String> -Rights <FileSystemRights> [-Type <AccessControlType>]
 [-Inheritance <InheritanceFlags>] [-Propagation <PropagationFlags>] [-AccessMode <String>]
 [-ServerRole <String>] [-ContextName <String>] [<CommonParameters>]
```

### Empty
```
Register-DCAccessRule -Path <String> -Empty <Boolean> [-ServerRole <String>] [-ContextName <String>]
 [<CommonParameters>]
```

## DESCRIPTION
Registers an access rule for FileSystem paths on a domain controller.

## EXAMPLES

### EXAMPLE 1
```
Get-Content .\accessrules.json | ConvertFrom-Json | Write-Output | Register-DCAccessRule
```

Reads all access rule definitions from json and imports the definitions.

## PARAMETERS

### -Path
The path to the filesystem object to grant permissions on.
Supports string resolution.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Identity
What identity / principal to grant access.
Supports string resolution.

```yaml
Type: String
Parameter Sets: ACE
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Rights
What file system right to grant.

```yaml
Type: FileSystemRights
Parameter Sets: ACE
Aliases:
Accepted values: ListDirectory, ReadData, WriteData, CreateFiles, CreateDirectories, AppendData, ReadExtendedAttributes, WriteExtendedAttributes, Traverse, ExecuteFile, DeleteSubdirectoriesAndFiles, ReadAttributes, WriteAttributes, Write, Delete, ReadPermissions, Read, ReadAndExecute, Modify, ChangePermissions, TakeOwnership, Synchronize, FullControl

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Type
Whether this is an allow or a deny rule.
Defaults to Allow.

```yaml
Type: AccessControlType
Parameter Sets: ACE
Aliases:
Accepted values: Allow, Deny

Required: False
Position: Named
Default value: Allow
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Inheritance
Who and how are access rules inherited.
Defaults to 'ContainerInherit, ObjectInherit', meaning everything beneath the path inherits as well.

```yaml
Type: InheritanceFlags
Parameter Sets: ACE
Aliases:
Accepted values: None, ContainerInherit, ObjectInherit

Required: False
Position: Named
Default value: ContainerInherit, ObjectInherit
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Propagation
How access rules are being propagated.
Defaults to "None", the windows default behavior.

```yaml
Type: PropagationFlags
Parameter Sets: ACE
Aliases:
Accepted values: None, NoPropagateInherit, InheritOnly

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Empty
This path should have no explicit ACE defined.

```yaml
Type: Boolean
Parameter Sets: Empty
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -AccessMode
How filesystem access rules are processed.
Supports three configurations:
- Constrained: The default access mode, will remove any excess access rules.
- Additive: Ignore any access rules already on the path, even if not configured
- Defined: Ignore any access rules already on the path, even if not configured UNLESS the identity on those rules has an access level defined for it.

```yaml
Type: String
Parameter Sets: ACE
Aliases:

Required: False
Position: Named
Default value: Constrained
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ServerRole
What domain controller to apply this to:
- All:  All DCs in the enterprise
- FSMO: Only DCs that have any FSMO role
- PDC:  Only the PDCEmulator

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: All
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ContextName
The name of the context defining the setting.
This allows determining the configuration set that provided this setting.
Used by the ADMF, available to any other configuration management solution.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: <Undefined>
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
