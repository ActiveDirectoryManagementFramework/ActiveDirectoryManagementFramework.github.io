# Components Descriptions

## Synopsis

This section offers detailed explanation on how to configure and use each individual kind of object you can control using the Active Directory Management Framework.
As such, this is the reference library for your use when building your [configuration contexts](../advanced/contexts-advanced.html).

## Domain Controller

Settings that govern how domain controllers should be deployed and configured.
For advanced OS configuration consider moving to DSC instead.

+ [Core deployment settings](dc/core.html)

## Domain

Domain level settings primarily target objects found in the domain naming context, rather than forest-wide settings.
A few object types can be used for both however (Access Rules, Custom AD Objects).

+ [AccessRules](domain/accessrules.html)
+ [Acls](domain/acls.html)
+ [Group Policy Links](domain/gplinks.html)
+ [Group-Memberships](domain/groupmemberships.html)
+ [Group Policy Objects](domain/grouppolicies.html)
+ [Groups](domain/groups.html)
+ [Object Categories](domain/object-categories.html)
+ [Objects](domain/objects.html)
+ [Organizational Units](domain/organizationalunits.html)
+ [Finegrained Password Policies](domain/password-policies.html)
+ [Users](domain/users.html)

## Forest

Forest level settings are global settings found in the schema and configuration naming contexts.
These apply to _all_ domains in a given forest.

+ [Schema (ldif)](forest/schema-ldif.html)
+ [Schema](forest/schema.html)
+ [Domain Controller Site-Assignment](forest/servers.html)
+ [Sitelinks](forest/sitelinks.html)
+ [Sites](forest/sites.html)
+ [Subnets](forest/subnets.html)
