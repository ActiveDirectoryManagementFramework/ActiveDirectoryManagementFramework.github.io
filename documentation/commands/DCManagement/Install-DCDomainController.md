---
external help file: DCManagement-help.xml
Module Name: DCManagement
online version:
schema: 2.0.0
---

# Install-DCDomainController

## SYNOPSIS
Adds a new domain controller to an existing domain.

## SYNTAX

```
Install-DCDomainController [[-ComputerName] <ComputerParameter>] [[-Credential] <PSCredential>]
 [-DomainName] <String> [[-DomainCredential] <PSCredential>] [[-SafeModeAdministratorPassword] <SecureString>]
 [-NoDNS] [-NoReboot] [[-LogPath] <String>] [[-Sysvolpath] <String>] [[-DatabasePath] <String>]
 [-NoResultCache] [-EnableException] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Adds a new domain controller to an existing domain.
The target computer cannot already be part of the domain.

## EXAMPLES

### EXAMPLE 1
```
Install-DCDomainController -Computer dc2.contoso.com -Credential $localCred -DomainName 'contoso.com' -DomainCredential $domCred
```

Joins the server dc2.contoso.com into the contoso.com domain, as a promoted domain controller using the specified credentials.

## PARAMETERS

### -ComputerName
The target to promote to domain controller.
Accepts and reuses an already established PowerShell Remoting Session.

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
Credentials to use for authenticating to the computer account being promoted.

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
The fully qualified dns name of the domain to join the DC to.

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

### -DomainCredential
Credentials to use when authenticating to the domain.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: (Get-Credential -Message 'Specify domain admin credentials needed to authorize the promotion to domain controller')
Accept pipeline input: False
Accept wildcard characters: False
```

### -SafeModeAdministratorPassword
The password to use as SafeModeAdministratorPassword.
Autogenerates and reports a new password if not specified.

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: (New-Password -Length 32 -AsSecureString)
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoDNS
Disable deploying a DNS service with the new domain controller.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: (Get-PSFConfigValue -FullName 'DCManagement.Defaults.NoDNS')
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoReboot
Prevent reboot after finishing deployment

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: (Get-PSFConfigValue -FullName 'DCManagement.Defaults.NoReboot')
Accept pipeline input: False
Accept wildcard characters: False
```

### -LogPath
The path where the DC will store the logs.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: (Get-PSFConfigValue -FullName 'DCManagement.Defaults.LogPath')
Accept pipeline input: False
Accept wildcard characters: False
```

### -Sysvolpath
The path where the DC will store sysvol.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: (Get-PSFConfigValue -FullName 'DCManagement.Defaults.SysvolPath')
Accept pipeline input: False
Accept wildcard characters: False
```

### -DatabasePath
The path where the DC will store NTDS Database.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: (Get-PSFConfigValue -FullName 'DCManagement.Defaults.DatabasePath')
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoResultCache
Disables caching the result object of the operation.
By default, this command will cache the result of the installation (including the SafeModeAdministratorPassword), to reduce the risk of user error.

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
