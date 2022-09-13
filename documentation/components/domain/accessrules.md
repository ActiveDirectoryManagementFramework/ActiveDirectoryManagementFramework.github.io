# Access Rules

## Description

Access rules allow you to define privilege delegation on any object desired.
While this resource is managed by the DomainManagement module, it is possible to also define rules that apply to the configuration Naming Context.

> It is not necessary to define the Access Rules specified as default access rules for that object type by the Schema

Any object, that has at least one such rule defined will be assumed to be fully defined. Access Rules that are not defined will be removed.
Inherited permissions will be ignored.

## Example Configuration

A reasonably simple configuration entry:

```json
[
    {
        "Path":  "CN=Builtin,%DomainDN%",
        "ActiveDirectoryRights":  "ReadProperty",
        "InheritanceType":  "None",
        "ObjectType":  "00000000-0000-0000-0000-000000000000",
        "InheritedObjectType":  "00000000-0000-0000-0000-000000000000",
        "AccessControlType":  "Allow",
        "Identity":  "Everyone"
    }
]
```

This rule will grant everyone read access on all properties of the BuiltIn Container.

A slightly more complex configuration setting:

```json
[
    {
        "ObjectCategory":  "VirtualMachineObject",
        "ActiveDirectoryRights":  "GenericAll",
        "InheritanceType":  "None",
        "ObjectType":  "<All>",
        "InheritedObjectType":  "<All>",
        "AccessControlType":  "Allow",
        "Identity":  "<Parent>"
    }
]
```

As can be seen here:

+ Rather than specifying a path, we specify an [Object Category](object-categories.html). For more details on object categories, see the related article.
+ The `ObjectType` and `InheritedObjectType` can accept the GUID, but also their string-label. `<All>` is equivalent to `00000000-0000-0000-0000-000000000000`
+ The identity specifies the parent object (in this case, the computer account the VM object is assigned to).

## Tools

The easiest way to generate a rule-set is to copy it from an existing AD object.
Example snippet:

```powershell
$acl = Get-AdsAcl -Path 'OU=UserAccounts,DC=contoso,DC=com'
$acl.Access |
  Where-Object IdentityReference -eq 'contoso\Domain Admins' |
    Select-PSFObject @(
        @{
            Name = 'Path'
            Expression = {
                $acl.DistinguishedName -replace 'DC=.+$','%DomainDN%'
            }
        },
        'ActiveDirectoryRights TO string',
        'InheritanceType TO string',
        'ObjectType',
        'InheritedObjectType',
        'AccessControlType TO string',
        'IdentityReference AS Identity TO string'
    ) | ConvertTo-Json
```

Then update the identity as need to use [Name Mapping / Name Resolution](../../advanced/name-mapping.html).

You can also use `Convert-DMSchemaGuid` to translate the GUIDs into humanly readable names.

## Properties

### Path

> This parameter uses [name resolution](../../advanced/name-mapping.html).

The distinguished name of the object, on which access rules are applied.

This parameter is mutually exclusive with `ObjectCategory`.

### Object Category

The [Object Category](object-categories.html) to which the access rule applies.
Object categories allow dynamically assigning permissions based on object conditions.

However, they only consider objects [Under Management](../../basics/contentmode.html).

This is commonly used for targeting dynamic objects that are hard to match with a path, such as computer objects (could have different names in different domains), as well as meta-objects assigned to them (domain controller meta-objects, DFSR-objects, Virtual Machine SCP, ...).

This parameter is mutually exclusive with `Path`.

### ActiveDirectoryRights

The actual permission granted.

### InheritanceType

Optional: Yes | Default: None

How the permissions are affect child items.

### ObjectType

Optional: Yes | Default: `<All>`

The type of objects to affect.

+ Use `<All>` or `00000000-0000-0000-0000-000000000000` to affect all.
+ Use the specific GUID or associated name for more specific constraints

You can use the `Convert-DMSchemaGuid` to convert a GUID into a name or vice-versa:

```powershell
Convert-DMSchemaGuid -Name 00000000-0000-0000-0000-000000000000 -OutType Name -Server contoso.com
```

> Note: This command is domain-specific and will on the first run cache all GUIDs, taking a considerable amount of time

As custom object class may not have the same GUID in separate forests, using names may be required.

### InheritedObjectType

Optional: Yes | Default: `<All>`

A second object class or attribute reference required for this access rule.
Depending on the `ActiveDirectoryRights` setting this property may represent different things (or not be used at all).

Same rules as ObjectType, accepts a GUID or its name-equivalent.

### AccessControlType

Optional: Yes | Default: Allow

Whether this is an Allow or Deny rule.
Legal Values:

+ Allow
+ Deny

### Identity

> This parameter uses [name resolution](../../advanced/name-mapping.html).

The grantee that is given the permissions defined in the access rule.
Use NT Account notation (`contoso\examplegroup`) to target the user.
As this supports name resolution, notations such as `%DomainName%\examplegroup` are also viable.

> Special notation: `<parent>`

By inserting `<parent>` as identity, it will instead use the parent object as grantee.
This requires the parent to be a security principal (such as a user or computer object).

### Optional

Optional: Yes | Default: false

A boolean value, accepting either `true` or `false` (note: no quotes in json!).
By default, the Domain Management module will complain about an object not existing when assigning an access rule to an object that ... well, doesn't exist.
Setting `Optional` to `true` will make it ignore it instead.

### Present

Whether the access rule should exist or not.
By default, it should.
Set this to $false in order to explicitly delete an existing access rule.
Set this to 'Undefined' to neither create nor delete it, in which case it will simply be accepted if it exists.

Use this field to explicitly override schema default permissions if needed/desired.

### NoFixConfig

By default, Test-DMAccessRule will generate a "FixConfig" result for accessrules that have been explicitly defined but are also part of the Schema Default permissions.
If this setting is enabled, this result object is suppressed.

## Test Results

> Update

Some access rules on this Active Directory object need to be modified.
This can contain one or multiple changes being applied to the specified object.

Tip: Inspect the `Changed` property to get a list of individual changes for the given AD object!

Change types:

+ Delete: An Undesired access rule is being removed from the object
+ Create: A missing access rule is being added to the object
+ Restore: A default permission for the object, as defined in the AD schema, is being re-applied to the object
+ FixConfig: This test result is written, when the configuration contains an access rule, that is already defined in the schema default. In other words, the configured access rule is redundant and can be removed from the configuration (or the schema default, if it should not be in there ...).

Note: To prevent a specific schema default permission to be applied to an object (by generating a restore action), define that access rule and set its "Present" property to $false.

> MissingADObject

The Active Directory object for which Access Rules have been configured does not (yet) exist.
This usually means you have not yet run the specific component of your config that would create the object.

> NoAccess

The used account has insufficient rights to read the security configuration.
This usually means the account has been blocked from reading the ACL in question - try manually fixing those or using a different, higher privileged account instead.
