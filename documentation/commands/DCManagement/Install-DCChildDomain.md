---
external help file: DCManagement-help.xml
Module Name: DCManagement
online version:
schema: 2.0.0
---

# Install-DCChildDomain

## SYNOPSIS
Installs a child domain.

## SYNTAX

```
Install-DCChildDomain [[-ComputerName] <ComputerParameter>] [[-Credential] <PSCredential>]
 [-DomainName] <String> [-ParentDomainName] <String> [[-NetBiosName] <String>]
 [[-SafeModeAdministratorPassword] <SecureString>] [[-EnterpriseAdminCredential] <PSCredential>] [-NoDNS]
 [-NoReboot] [[-LogPath] <String>] [[-SysvolPath] <String>] [[-DatabasePath] <String>] [-NoResultCache]
 [-EnableException] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Installs a child domain.

## EXAMPLES

### EXAMPLE 1
```
Install-DCChildDomain -ComputerName 10.1.2.3 -Credential $cred -DomainName corp -ParentDomainName contoso.com
```

Will install the childdomain corp.contoso.com under the domain contoso.com on the server 10.1.2.3.

## PARAMETERS

### -ComputerName
The server to promote to a DC hosting a new subdomain.

```yaml
Type: ComputerParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: Localhost
Accept pipeline input: False
Accept wildcard characters: False
```

### -Credential
The credentials to use for connecting to the DC-to-be.

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

### -DomainName
The name of the domain to install.
Note: Only specify the first DNS element, not the full fqdn of the domain.
(The component usually representing the Netbios Name)

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ParentDomainName
The FQDN of the parent domain.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NetBiosName
The NetBios name of the domain.
Will use the DomainName if not specified.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SafeModeAdministratorPassword
The SafeModeAdministratorPassword specified during domain creation.
If not specified, a random password will be chosen.
The password is part of the return values.

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: (New-Password -Length 32 -AsSecureString)
Accept pipeline input: False
Accept wildcard characters: False
```

### -EnterpriseAdminCredential
The Credentials of an Enterprise administrator.
Will prompt for credentials if not specified.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: (Get-Credential -Message "Enter credentials for Enterprise Administrator to create child domain")
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoDNS
Disables installation and configuration of the DNS role as part of the installation.

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

### -NoReboot
Prevents reboot of the server after installation.
Note: Generally a reboot is required before proceeding, disabling this will lead to having to manually reboot the computer.

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

### -LogPath
The path where the NTDS logs should be stored.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SysvolPath
The path where SYSVOL should be stored.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DatabasePath
The path where the NTDS database is being stored.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoResultCache
Disables caching of the command's return object.
By default, this command will cache the return object as a global variable.

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
