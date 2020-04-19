# Contexts (Advanced)

## Before we start

This is the documentation page for the more advanced aspects of ADMF Contexts.
It assumes you have already read and understood the [Context Basics](../basics/contexts.html).

## Folder Structure

The basic folder structure of a Context looks like this:

```text
.
├───dc
├───domain
│   ├───accessrules
│   ├───acls
│   ├───builtinsids
│   ├───gplinks
│   ├───gppermissionfilters
│   ├───gppermissions
│   ├───gpregistrysettings
│   ├───groupmemberships
│   ├───grouppolicies
│   ├───groups
│   ├───names
│   ├───objectcategories
│   ├───objects
│   ├───organizationalunits
│   ├───psos
│   └───users
└───forest
    ├───ntAuthStore
    ├───schema
    ├───schemaldif
    ├───sitelinks
    ├───sites
    └───subnets
```

Basically, for each Category (dc / domain / forest) it has a top-level subfolder, each [Component](../components/components.html) of its respective Category has its own sub-folder.

You can omit any [Component](../components/components.html) folder you do not use.
Most [Components](../components/components.html) use Json format for their configuration-files (see individual [Component](../components/components.html) descriptions for guidance on the actual content).

Each such Json file can contain one or multiple settings.
Each [Component](../components/components.html) folder can contain zero, one or multiple configuration files, which will be loaded in alphabetical order _within a single Context._
Any configuration file with an erroneous setting will fail the Context load.
This immediately interrupts Context processing, clears all configuration already loaded and terminates with an error reporting just which file caused the issue.

## Domain Content Mode

Directly within the `domain` Category-folder you can create a configuration file defining the [Content Mode](../basics/contentmode.html).

The file is named `content_mode.json` and governs, what folders are considered "under management", affecting where the ADMF is willing to remove objects not defined in configuration.

## PreImport & PostImport

In the root folder of the Context, there can be two additional scriptfiles:

+ PreImport.ps1
+ PostImport.ps1

These will be automatically created if you use `New-AdmfContext` to generate a new configuration context.
These files allow executing code, both before and after applying the Context's configuration settings.

Any unhandled error in either file will cause the Context load to fail, rollback and report.

> Performance considerations

If you do not need those files, consider deleting them.
The files are optional and running them costs a little performance, even if they do not do anything.

Both files receive two parameters, their parameter signature should look like this:

```powershell
param (
	[PSFComputer]
	$Server,
	
	[System.Management.Automation.PSCredential]
	$Credential
)
```

The Server parameter will always contain a value, pointing either at domain controller or domain.
The Credential parameter may be empty.

## Pre-Checking Contexts

When picking the Contexts to load using the Context Selection GUI (either through directly invoking or testing configuration or using `Set-AdmfContext -Interactive`), all Contexts are displayed in a form using checkboxes.

The human user is then responsible for picking the correct Contexts for the task.

Human Beings make mistakes.

So wouldn't it be useful, if we could detect which Context-checkbox should be checked by default?

In the Context root folder, the file `contextPromptChecked.ps1` can be used to determine the initial check state for a given Context.

> Scenario: Environment Contexts

Imagine a company infrastructure that has three separate environments: `Production`, `QualityAssurance` and `Development`.
Each environment has different requirements - IPSec rules for one - and thus each has its own Context that builds on a common default Context.

In this scenario, based on name, ip configuration or other considerations, we could automatically detect, which environment we are targeting and start the Selection GUI with the correct environment already checked.
At the same time, we _know_ that our default Context will always be needed, so why not always start with it checked?

> Defining `contextPromptChecked.ps1`

The `contextPromptChecked.ps1` script-file (which is optional - not including it in the Context will default the Context to "unchecked") accepts a `Server` and `Credential` parameter and needs to return a boolean value - $true means the Context should be checked in the GUI.

Note: If the script other objects - which can easily happen by accident - it will consider the output $true, even if you intended to return $false.
That is because PowerShell has a rather liberal approach to just what it considers $true.

> Example Implementation: Always checked

```powershell
param (
	[PSFComputer]
	$Server,
	
	[System.Management.Automation.PSCredential]
	$Credential
)

$true
```

## The Context File

In the Context root folder, there must be a `context.json` file.
This file is automatically generated when running `New-AdmfContext` and contains the meta-information needed to ensure, Contexts are correctly processed.

> Example Context File:

```json
{
    "Version":  "1.0.0",
    "Weight":  75,
    "Description":  "Development environment specific context",
    "Author":  "Friedrich Weinmann",
    "Prerequisites":  [
        "Default"
    ],
    "MutuallyExclusive":  [
        "Production",
        "QualityAssurance"
    ],
    "Group":  "Environment"
}
```

This Context ...

+ Has weight 75, meaning it will be loaded after Contexts with a lower weight.
+ Requires the `Default` Context to be selected in order for it to be used. In the Selection GUI this will prevent the `Development` Context to be selected so long as `Default` is not checked.
+ Cannot be selected together with the `Production` or `QualityAssurance` Contexts - selecting either of these three will disable the other two.
+ Is grouped in the `Environment` group. The only effect this has is it being displayed together with other Contexts with the same group label in the Selection GUI.
