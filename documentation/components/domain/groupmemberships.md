# Group-Memberships

## Description

Group-Memberships are the common tool to assign permissions to individual accounts.

Using this [Component](../components.html) allows defining these.
Each group that has at least one membership defined will be considered "managed":
Members not defined in configuration will be _removed_ from that group when applying the configuration!

> This is true even in [additive mode](../../basics/contentmode.html)!

Group-Memberships can be assigned even to accounts from a different forest, even if no trust exists yet, enabling initial forest configurations from an administrative forest, even before the trust is established.
The membership will only take effect after the trust is established, but requires no further action.

## Example Configuration

This example configuration shows the default configuration for the `Administrators` group in a newly installed domain.
It also shows SID based name resolution, as organizations may rename the account and active directory environments might have localization-specific names.
(Theoretically, Domain Admins and Enterprise Admins could have both also been defined by SID)

```json
[
    {
        "Name":  "Domain Admins",
        "Domain":  "%DomainName%",
        "ItemType":  "group",
        "Group":  "Administrators"
    },
    {
        "Name":  "Enterprise Admins",
        "Domain":  "%RootDomainName%",
        "ItemType":  "group",
        "Group":  "Administrators"
    },
    {
        "Name":  "%DomainSID%-512",
        "Domain":  "%DomainName%",
        "ItemType":  "user",
        "Group":  "Administrators"
    }
]
```

This would be the definition for an empty group:

```json
{
    "Group":  "Schema Admins",
    "Empty":  true
}
```

## Tools

```powershell
Get-ADGroup -Filter * -PipelineVariable group |
    Get-ADGroupMember |
        ForEach-Object {
            [PSCustomObject]@{
                Name = $_.Name
                Domain = '%DomainName%'
                ItemType = $_.objectClass
                Group = $group.Name
            }
        } | ConvertTo-Json
```

This will generate a json file for all group memberships in all groups in the domain.

> Note: The domain property may not always be correct!
> In some cases it may be better to use `%RootDomainName%` instead (e.g. for Enterprise Admins).
> Also groups from other forests will need special handling.

## Properties

### Name

> This parameter uses [name resolution](../../advanced/name-mapping.html).

The name of the user or group to grant membership in the target group.
This parameter also accepts SIDs instead of names.

> %DomainSID% is the placeholder for the domain SID, %RootDomainSID% the one for the forest root domain.

### Domain

> This parameter uses [name resolution](../../advanced/name-mapping.html).

Domain the entity is from, that is being granted group membership.

### ItemType

The type of object being granted membership.
Corresponds to the ObjectClass attribute value of the AD object(user, group, computer, ...).

### ObjectCategory

Rather than specifying an explicit entity, assign all principals in a given Object Cagtegory as group member.

> Note: In order to be applicable, each category member must be a security principal (that has the ObjectSID property).

### Group

> This parameter uses [name resolution](../../advanced/name-mapping.html).

The group to define members for.

### Empty

Whether the specified group should be empty.
By default, groups are only considered when at least one member has been defined.
Flagging a group for being empty will clear all members from it.

### Mode

Optional: yes | Default: Default

How group memberships will be processed:

| Default | Member must exist and be member of the group. |
| MayBeMember | Principal must exist but may be a member. No add action will be generated if not a member, but also no remove action if it already is a member. |
| MemberIfExists | If Principal exists, make it a member. |
| MayBeMemberIfExists | Both existence and membership are optional for this principal. |

### GroupProcessingMode

Optional: yes | Default: Constrained

Governs how _all_ group memberships on the targeted group will be processed.
Supported modes:

| Constrained | Existing Group Memberships not defined will be removed |
| Additive | Group Memberships defined will be applied, but non-configured memberships will be ignored. |

If no setting is defined, it will default to 'Constrained'
