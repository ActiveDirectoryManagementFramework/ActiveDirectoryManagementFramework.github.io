# Schema Update: Privilege Management

## Synopsis

One of the special tasks in Active Directory administration is the management of Schema.
It is special, because by default not even Domain Admins have the required privileges to implement changes.
By default, the Schema Admin group should be empty, causing nobody to actually have permanent privileges to update the Schema.

This offered a challenge when implementing a solution that is supposed to update _all_ of AD as smoothly as possible.
To facilitate different workflows, we support a variety of ways to solve the issue:

+ Use current account
+ Use explicit credentials
+ Use temporary account
+ Use explicit account

## Special Configuration

In opposite to the [Components](../components/components.html), Schema privilege management is directly implemented using the [PSFramework Configuration System](https://psframework.org/documentation/documents/psframework/configuration.html).

This requires defining the configuration not directly in Json, but using an explicit command call as part of the [PreImport or PostImport scripts](contexts-advanced.html).

You can either define the setting using `Set-PSFConfig` or use [`Import-PSFConfig` and a json file](https://psframework.org/documentation/documents/psframework/configuration/persistence-manual-export-import.html).
The examples in this documentation will use the simpler `Set-PSFConfig` method.

> The PSFramework Configuration system works similar to the way [Component Configuration](../components/components.html) works, in that the last to define a setting wins.
> Still keep in mind to reverse a setting if multiple [Contexts](contexts-advanced.html) try to govern Schema credential management, as each of the following settings is independent from each other.

## Use current account

The default method of performing schema updates assumes that the current account has the required permissions to perform the necessary task.
This does not require providing any configuration, but will also fail in default domain environments.

## Use explicit credentials

```powershell
Set-PSFConfig -FullName ForestManagement.Schema.AutoCreate.Credential -Value $credential
```

Define the explicit credentials to use for Schema update management only.
This setting supersedes all other settings, causing them to be ignored.

> This option is _not_ used together with `AutoGrant` or `AutoRevoke` introduced later in this article.

## Use temporary account

```powershell
Set-PSFConfig -FullName ForestManagement.Schema.AutoCreate.TempAdmin -Value $true
```

This will create a temporary account that based on its name can be clearly associated with the user performing the change.
The account exists only for the duration of the update task and will be deleted when done.

This option supersedes using an explicit account.

## Use explicit account

This is the most versatile option to define Schema update credential management.
It allows adding many separate options as desired.

```powershell
Set-PSFConfig -FullName ForestManagement.Schema.Account.Name -Value $accountName
```

This will define the account to use.
The account will then have its password automatically set to a highly complex and lengthy password (at the moment there is no way to explicitly provide the password).

Without additional settings, it is assumed that the account in question is a Schema Admin.

## Additional Options

Additional options allow tuning how the credential management behaves.

Most options are designed for use with the `Use explicit account` mode only (see individual notes).

### Automatic Grant and Revocation

```powershell
Set-PSFConfig -FullName ForestManagement.Schema.Account.AutoGrant -Value $true
Set-PSFConfig -FullName ForestManagement.Schema.Account.AutoRevoke -Value $true
```

Adding either setting will have the account be automatically added to Schema Admins before performing the update and/or automatically removed again once done.

> Automatic Grant only applies to the `Use explicit account` mode.

### Automatic Enable and Disable

```powershell
Set-PSFConfig -FullName ForestManagement.Schema.Account.AutoEnable -Value $true
Set-PSFConfig -FullName ForestManagement.Schema.Account.AutoDisable -Value $true
```

Adding either setting will have the account enabled before use and/or disabled after.

> Automatic Enable only applies to the `Use explicit account` mode.

### Automatic Account Creation

```powershell
Set-PSFConfig -FullName ForestManagement.Schema.Account.AutoCreate -Value $true
```

Adding this setting will automatically create the account if needed.

> Used for scenarios where you do not want to define the user object as a [User Component](../components/domain/users.html) and still be sure the user exists.
> For example in a dedicated Schema-only [Context](contexts-advanced.html).

> Automatic Account Creation only applies to the `Use explicit account` mode.

### Update Description

```powershell
Set-PSFConfig -FullName ForestManagement.Schema.Account.AutoDescription -Value "Account was last used on $(Get-Date -Format yyyy-MM-dd)"
```

Adding this setting will have the account automatically update its description field when used.
This enables a slight bit of automatic documentation in AD, but keep in mind that there is nothing to prevent a user with sufficient rights to use the account outside of this solution, so it cannot be relied on for auditing purposes.

### Reset Password after use

```powershell
Set-PSFConfig -FullName ForestManagement.Schema.Password.AutoReset -Value $true
```

This makes the solution reset the password to a complex 128 characters random password after use.
