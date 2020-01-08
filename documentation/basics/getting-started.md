# Getting Started

## Introduction

Welcome to the "Getting Started" guide of the Active Directory Management Framework (ADMF).
We are here to get you started in as quick and painless a manner as we can.
Still, it's a large and complex matter, so please bear with us.

The basic idea is for you to define the state you desire - mostly in Json configuration files - and the ADMF makes it happen, or at least tests it.

## Installation

In order to install the ADMF, run the following PowerShell command on an internet facing computer:

```powershell
Install-Module ADMF
```

The ADMF itself does not require internet to work.
If you need to move this code to an offline machine, you can download it and all its dependencies into the current path using the following command:

```powershell
Save-Module ADMF -Path .
```

> Prerequisites:

- PowerShell v5
- ActiveDirectory module

The Active Directory PowerShell module can be installed using RSAT (Client OS) or the Server Manager (Server OS).

## Basic Concepts

The core building block of the ADMF is the [Context](contexts.html), which is basically a container for your configuration files.
For each [Component](../components/components.html) you want to define - site, organizational unit, user, permissions, ... - you can place any number of configuration files, defining any number of such objects.
That means a context can define any number of different [Component](../components/components.html) types and any number of each.

When you want to deploy, test or update a domain, you _load_ those [Contexts](contexts.html), and the settings they define will be used.
You can combine any number of [Contexts](contexts.html), though you can also limit which [Contexts](contexts.html) cannot be combined with each other or that one [Context](contexts.html) absolutely requires another [Context](contexts.html).

> Example Setup

You define the following [Contexts](contexts.html):

+ Default
+ Production
+ QA
+ Development

In the [Context](contexts.html) `Default` you would put the bulk of your domain configuration.
In the [Contexts](contexts.html) `Production`, `QA` and `Development` you would define settings specific to each respective environment.
For example different Group Policy Objects defining different IPSec rules.

## The Categories

The ADMF separates the way it operates to three different categories, governed by at which level they operate:

+ Forest Level: Everything that affects all domains in a forest. Sites, Sitelinks, Schema extensions ... that kind of thing.
+ Domain Level: Everything relating to settings and objects specific to a given domain. Group Policy Objects, Organizational Units, User Accounts, ...
+ Domain Controller Level: Settings related to individual domain controllers, including new deployments of DCs.

## Applying Configuration

Now, you used the [Component guidance](../components/components.html) and the basics for [Context](contexts.html) management to define your own [Contexts](contexts.html) and are ready to use them against your domain?
Alright, for this there exist four commands:

```powershell
Test-AdmfDomain
Test-AdmfForest
Invoke-AdmfDomain
Invoke-AdmfForest
```

The `Test-*`-commands will validate, whether the actual state represents your intention defined in the configuration.
The return objects will explicitly list all intended changes.
The `Invoke-*`-commands will perform all these changes.

> Categories: There are separate `Test-` and `Invoke-` commands per category. There is _not_ yet one available for Domain Controllers, as no settings implemented so far warrant this. That will change in the future however.

The first time you run this command against a specific domain, a popup window will allow you to select the [Contexts](contexts.html) you wish to apply.
If you want to avoid this - for example for unattended execution - you can use `Set-AdmfContext` to select the [Contexts](contexts.html) to load.
Once selected, the ADMF will remember the chosen [Context](contexts.html) until the end of the session.
This is session-specific, so starting a new console will not be aware of a previous choice.

If you want to change the [Context](contexts.html) for a given domain after having picked it once, use `Set-AdmfContext`.
If you want to manually trigger the [Context](contexts.html) selection UI, use `Set-AdmfContext -Interactive` instead.

## Deploying a new Forest / Domain / DC

The deployment of new forests / domains / dcs is the domain of the Domain Controller Category.
It provides commands for this very purpose:

```powershell
Install-DCChildDomain
Install-DCDomainController
Install-DCRootDomain
```

> These commands will not trigger the context prompt.
> If you need to load configuration for DC [Components](../components/components.html), explicitly execute [Set-AdmfContext](../commands/ADMF/Set-AdmfContext.html).

These deployment commands only require WinRM to perform their task.
Their `-ComputerName` parameter is a [PSFComputer](https://psframework.org/documentation/documents/psframework/parameter-classes/computer-parameter.html) parameter class and accepts both strings and PSRemoting sessions.
This allows deploying new forest / domains / dcs via the Hyper-V Host management interface, even if the target computer does not already have network connectivity.

> Deployment commands do _NOT_ apply any other configuration settings! You still need to use the relevant `Invoke-*`-commands afterwards.
