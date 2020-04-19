# Group Policy Permissions

## Description

Define permissions that should apply to group policy objects.

This can operate in two different modes:

+ Add permissions (without affecting existing ones)
+ Control permissions (what is configured is _all_ there should be - excess rules will be removed)

The mode can be selected on a per-GPO basis and is defined through the `Managed` property in configuration.

> When creating a new context with the `-DefaultAccessRules` parameter enabled, default GPO permissions (and associated permission filters) are also defined.

## Example Configuration

Define a global (=All GPOs) FullControl right for the group "SEC-GPO-Admins":

```json
{
    "All": true,
    "Identity":  "%DomainName%\SEC-GPO-Admins",
    "ObjectClass":  "Group",
    "Permission":  "GpoEditDeleteModifySecurity"
}
```

Define an access rule, that grants the ClientAdmin group full control over the GPO Client-G-Security-Baseline:

```json
{
    "GpoName":  "Client-G-Security-Baseline",
    "Identity":  "%DomainName%\ClientAdmins",
    "ObjectClass":  "Group",
    "Permission":  "GpoEditDeleteModifySecurity"
}
```

Define a permission rule, that defines all affected GPOs as "under management":
Undefined accessrules will be removed!

```json
{
    "Filter":  "IsManaged -or Tier0Linked -or Tier1Linked",
    "NoPermissionChange":  true,
    "Managed":  true
}
```

## Properties

### GpoName

> ParameterSet: Explicit
>
> This parameter uses [name resolution](../../advanced/name-mapping.html).

Name of the GPO this permission applies to.

### Filter

> ParameterSet: Filter

The filter condition governing, what GPOs these permissions apply to.

Filters can be a filter string that would be legal powershell, however they can contain only a few items:

+ Parenthesis
+ Logical operators (-and, -or, -xor, -not)
+ Filter names (either as if they were a command or a an argument)

They must be syntactically correct as far as PowerShell is concerned.

For example, these would both be legal filters:

+ `IsManaged -and Tier0`
+ `-not (IsManaged) -or (Tier1 -and UserScope)`

All filters must be defined when testing GP Permissions.
To define a filter, see the [gppermissionfilters Component](gppermissionfilters.html).

Were a filter string accepted where a filter condition has not been defined, we could not be sure the permissions were correctly resolved, which might lead to critical security configuration errors.
Due to this any configuration error will lead to terminating the test and not providing any actions!

Group Policy Permissions and their filters need not be defined in the same Context, but they _will_ be evaluated at test time.

All filter conditions currently supported come down to these distinct types:

+ Is the GPO defined in the currently loaded configuration?
+ Is the GPO linked to this specific OU, or anywhere below it, or to any OU directly below it?
+ Is the GPO named like this? (Exact comparison / Wildcard / Regex)

The name chosen for a condition is arbitrary, but can only contain letters, numbers and underscore.

### All

> ParameterSet: All

This access rule applies to ALL GPOs.

### Identity

> Parameter SubSet: Permission
>
> This parameter uses [name resolution](../../advanced/name-mapping.html).

The principal (group, user, computer, ...) to assign permissions to.

### ObjectClass

> Parameter SubSet: Permission

What kind of object the assigned identity is.
Can be any legal object class in AD.
Only object classes that have a SID should be chosen though (otherwise, assigning permissions to it gets kind of difficult).

### Permission

> Parameter SubSet: Permission

What kind of permission to grant.

Supported permissions:

+ GpoApply
+ GpoRead
+ GpoEdit
+ GpoEditDeleteModifySecurity
+ GpoCustom

> Note: `GpoCustom` is the equivalent of `GpoEditDeleteModifySecurity` minus the deletion rights.
> This is the default permission level of Domain Admins and Enterprise Admins on the Default Domain Policy.

### Deny

> Parameter SubSet: Permission

Whether to create a Deny rule, rather than an Allow rule.

### NoPermissionChange

> Parameter SubSet: No Permission Change

This specific single rule will not add any permissions.
Setting this flag allows defining a rule that only applies the "Managed" state (see below).

### Managed

Whether the affected GPOs should be considered "Under Management".
A GPO "Under Management" will have all non-defined permissions removed.

All GPOs are considered unmanaged unless affected by a GPPermission rule that says they are to be managed.
Any single setting that declares "management" will trigger the control behavior.
Later [Contexts'](../../basics/contexts.html) settings cannot change that!
