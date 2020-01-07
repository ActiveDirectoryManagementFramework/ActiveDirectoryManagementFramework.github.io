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

+ [AccessRules](accessrules.html)
+ [Acls](acls.html)
+ [Group Policy Links](gplinks.html)
+ [Group-Memberships](groupmemberships.html)
+ [Group Policy Objects](grouppolicies.html)
+ [Groups](groups.html)
+ [Object Categories](object-categories.html)
+ [Objects](objects.html)
+ [Organizational Units](organizationalunits.html)
+ [Finegrained Password Policies](password-policies.html)
+ [Users](users.html)

## Forest

Forest level settings are global settings found in the schema and configuration naming contexts.
These apply to _all_ domains in a given forest.

+ [Schema (ldif)](schema-ldif.html)
+ [Schema](schema.html)
+ [Domain Controller Site-Assignment](servers.html)
+ [Sitelinks](sitelinks.html)
+ [Sites](sites.html)
+ [Subnets](subnets.html)
