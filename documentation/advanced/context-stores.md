# Context Stores

## Synopsis

A Context Store is a directory where the Active Directory Management Framework looks for [Contexts](contexts-advanced.html).
You can define any number of them and they are backed by the [PSFramework Configuration System](https://psframework.org/documentation/documents/psframework/configuration.html).

This allows you to define a Context Store in various ways:

+ Interactively in using the console
+ A module could publish one on import
+ Per Group Policy (for example to define a central Context Store the entire team uses)

## Consuming Context Stores

Once a Context Store has been defined (see below), using it is as simple as:

```powershell
New-AdmfContext -Name ExampleContext -Store MyContext
```

This will then create a new [Context](contexts-advanced.html) scaffold in the path of the Context Store.

## Interactive Use

To interactively create a Context Store:

```powershell
New-AdmfContextStore -Name MyContext -Path C:\temp
```

## Module Defined

As a PowerShell module, publishing a context on import requires adding a single line to your module-code:

```powershell
Set-PSFConfig -FullName 'ADMF.Context.Store.ContextStoreName' -Value "$script:ModuleRoot\Contexts" -Validation string -Initialize -Description "ADMF Context Store published by the <ModuleName> module"
```

This enables the Context Store as soon as the module has been imported.

> This assumes, the module defines a script-scope variable $script:ModuleRoot, pointing at the module folder.

## Group Policy Defined

> Per User Setting

Using group policy, distribute the following registry key:

```text
Key:   HKEY_CURRENT_USER\Software\Microsoft\WindowsPowerShell\PSFramework\Config\Default
Name:  ADMF.Context.Store.ContextStoreName
Type:  REG_SZ
Value: String:\\server\share\contexts
```

> Per Computer Setting

Using group policy, distribute the following registry key:

```text
Key:   HKEY_LOCAL_MACHINE\Software\Microsoft\WindowsPowerShell\PSFramework\Config\Default
Name:  ADMF.Context.Store.ContextStoreName
Type:  REG_SZ
Value: String:\\server\share\contexts
```
