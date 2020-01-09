# Processing Order

## Synopsis

The order in which [Components](../components/components.html) are applied during invocation matters.
Several actions build upon each other and some [Components](../components/components.html) require multi-part operations in order to run smoothly, as one step may depend on completion of multiple others.

The processing order is specific to a given Category (domain / forest).

If you use the provided invocation commands (`Invoke-AdmfDomain` and `Invoke-AdmfForest`) you do not need to worry about the order, as these commands will automatically use the correct order.

## Domain

```powershell
Invoke-AdmfDomain
```

> 1. Organizational Units: Crate & Update (Option: `OUSoft`)

```powershell
Invoke-DMOrganizationalUnit
```

As a first step, we want to create and customize organizational units, as those are what all the other bits get put in.

However, we do _not_ want to delete undesirable OUs yet, as we might  first need to mvoe content out of them (and maybe into some of the newly created OUs).

> 2. Groups (Option: `Group`)

```powershell
Invoke-DMGroup
```

Create, Update and Delete group objects.

> 3. Users (Option: `User`)

```powershell
Invoke-DMUser
```

Create, Update and Delete user objects.

> 4. Group Membership (Option: `GroupMembership)

```powershell
Invoke-DMGroupMembership
```

Assigns members to groups.
Members can be anything that can legally be a member of a group.

> 5. Finegrained Password Policies (Option: `PSO`)

```powershell
Invoke-DMPasswordPolicy
```

Create, Update and Delete finegrained password policies.

> 6. Group Policy Objects: Create & Update (Option: `GroupPolicy`)

```powershell
Invoke-DMGroupPolicy
```

Creates and updates group policy objects.
This allows ensuring the correct GPOs exist.
However the old ones cannot be deleted until the new policies are properly linked, otherwise it could happen that connectivity is lost (e.g.: Updating GPOs that include the IPSec ruleset).

> 7. Group Policy Links: Create & Update, Disable undesirable links (Option: `GPLinkDisable`)

```powershell
Invoke-DMGPLink -Disable
```

This assigns the new & correct GPLinks and link order.
Undesired links however are only disabled, not removed.

Previous Group Policy objects that are no longer desired are identified by having been linked into managed objects, but no longer being desired to be linked anywhere.
Were we to remove all the Group Policy Links right away, these could not be identified anymore.

> 8. Group Policy Objects: Delete (Option: `GroupPolicyDelete`)

```powershell
Invoke-DMGroupPolicy -Delete
```

After the new policies have been correctly linked, we can now move to delete undesired Group Policy Objects.
All Group Policy Objects that have only disabled links and include a link into an OU that is [under management](../basics/contentmode.html) and also are not defined in configuration will be removed.

It also creates new GPOs if needed, but step 6 should have handled that.

> 9. Group Policy Links: Remove (Option: `GPLink`)

```powershell
Invoke-DMGPLink
```

Applies all remaining desired GPLinks, removes all undesired links (disabled or not so).
Final cleanup in the group policy application cycle.

> 10. Organizational Units: Delete (Option: `OUHard`)

```powershell
Invoke-DMOrganizationalUnit -Delete
```

Now that all content objects have been taken care of, we finally attempt to delete all OUs that hsould no longer exist.
If the OUs in question still have content objects, this operation will fail, with a warning and log entry clearly identifying this.

> 11. Generic Objects (Option: `Object`)

```powershell
Invoke-DMObject
```

Create and update any custom objects desired.
This could be literally any kind of object.

As this [Component](../components/domain/objects.html) does not support any delete operations at this time, performing it before step 10 is not necessary, but also not harmful.

> 12. Access Control Lists (Option: `Acl`)

```powershell
Invoke-DMAcl
```

Applies the defined ACL configuration, concerning itself mostly with inheritance and ownership of an object.
For actual security delegations, see [AccessRules](../components/domain/accessrules.html)

> 13. Access Rules (Option: `AccessRule`)

```powershell
Invoke-DMAccessRule
```

Applies the desired access rules to the configured objects.

## Forest

> 1. Sites (Option: `Sites`)

```powershell
Invoke-FMSite
```

Apply the defined sites.

Note: This will fail to delete sites that still contain a domain controller

> 2. Site Links (Option: `SiteLinks`)

```powershell
Invoke-FMSiteLink
```

Establish the defined sitelinks, discard undesirables.

> 3. Subnets

```powershell
Invoke-FMSubnet
```

Create, Update and Delete subnets as configured.

> 4. Server Subnet Assignment (Option: `ServerRelocate`)

```powershell
Invoke-FMServer
```

This calculates for each domain controller the ideal site assignment, based on subnets of a site and ip address of the domain controller.
If the domain controller is in an inappropriate site, it will instead be moved to site with the smallest subnet it is part of.

> 5. Schema Extension (Option: `Schema`)

```powershell
Invoke-FMSchema
```

Applies, and corrects custom schema attributes and classes.

> 6. Schema Extension (LDIF) (Option: `SchemaLdif`)

```powershell
Invoke-FMSchemaLdif
```

Applies any pending ldf files.
