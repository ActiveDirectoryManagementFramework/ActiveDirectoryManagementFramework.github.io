# Content Mode Basics

## Synopsis

Active Directory is a living service, the content of which is in a perpetual state of change.
This makes it impossible to fully define every single aspect of it in configuration - user objects, client computers and many other minutiae are not the direct responsibility of the Active Directory team.

However, if we cannot delete everything not defined in configuration, we must be able to draw the line _somewhere,_ define "These OUs belong to the AD team" or "Those OUs and their content belong to other teams".

That is what the domain content mode defines.

> Content Mode is only applied to the domain Categories. Forest settings (Sites, Schema, ...) are unaffected and follow their own rules.

## Description

The content mode is defined by the following properties:

+ Mode
+ Include
+ Exclude
+ UserExcludePattern

### Mode

The mode defines, whether we consider anything at all beyond what we define:

+ *Additive:* Do not consider anything outside of configuration.
+ *Constrained:* Consider content in OUs defined by the Include & Exclude rules

If multiple [Contexts](contexts.html) define this property, the last one wins.

> Default mode if no [Context](contexts.html) defines it: Additive

### Include/Exclude

Using the Include & Exclude string arrays, we can then define a list of OUs to "take under management" or "exclude from management".
That is, define OU structures, which are subject to having undefined objects deleted from, or OUs which are exempt from that.

> OUs are defined by their distinguished name. Note that %DomainDN% is automatically available as a name label.

Settings from multiple [Contexts](contexts.html) will be merged.
If only Exclude rules are defined, the system implicitly creates an Include rule for "%DomainDN%".
If a later context then adds an Include rule, this no longer happens, possibly failing to apply your intent.
If you wish to mix both - or know there is a risk of it happening - and still want everything to be under management by default, manually define "%DomainDN%" as include rule.

### UserExcludePattern

Some users are hard to pre-define, and thus need to be excluded from prevention without being able to pre-determine their names explicitly.
Very common case: Exchange System Mailbox users.
For those you can define name patterns (using regex) to spare them from deletion.

## Defining Content Mode

To define the Content Mode, place a json file named "content_mode.json" in the domain folder of the [Context](contexts.html).
Unused properties are optional.

> Example configuration: All OUs are under management except for Resources, Clients and Company

```json
{
    "Mode":  "Constrained",
    "Include":  [],
    "Exclude":  [
        "OU=Resources,%DomainDN%",
        "OU=Clients,%DomainDN%",
        "OU=Company,%DomainDN%"
    ],
    "UserExcludePattern":  []
}
```

Equally legal and has the same effect:

```json
{
    "Mode":  "Constrained",
    "Exclude":  [
        "OU=Resources,%DomainDN%",
        "OU=Clients,%DomainDN%",
        "OU=Company,%DomainDN%"
    ]
}
```

> Example configuration: Only the Tier 0 OU is under management

```json
{
    "Mode":  "Constrained",
    "Include":  [
        "OU=Tier 0,%DomainDN%"
    ],
    "Exclude":  [],
    "UserExcludePattern":  []
}
```

## Beyond the Content Mode

The content mode does not affect what you can explicitly define in configuration.
That means, you absolutely may define OUs, user objects, groups or whatever else in organizational units you do not take under exclusive management.

Further, some settings have a localized management effect:
Notably, if you define any access rules on an object, no matter whether it is under management or not, it will remove all non-defined, non-inherited, non-default permissions.

> Scenario: Defining Tier 0

Assuming you want to only define a Tier 0 environment for secure administration and not affect the rest of the architecture in the same way, you would define the following content mode:

```json
{
    "Mode":  "Constrained",
    "Include":  [
        "OU=Tier 0,%DomainDN%"
    ],
    "Exclude":  [],
    "UserExcludePattern":  []
}
```

And then define access rule settings for the domain object itself.
