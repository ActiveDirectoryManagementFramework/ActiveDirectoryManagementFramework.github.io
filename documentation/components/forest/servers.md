# Domain Controller Site-Assignment

## Synopsis

As part of the forest update sequence, by default it will also update the site-assignments of all domain controllers in the forest.
However, *there is no configuration to define it!*

Instead, site-assignment is automatically calculated based on subnets and IP addresses.

Specifically ...

+ All domain controllers assigned to a site without a subnet the DC is part of will be moved
+ All domain controllers that are moved will be assigned to the site with the most restrictive subnet the DC is part of.

That means, a domain controller assigned to a site with a fitting subnet will _not_ be moved, even if there is a smaller subnet it would also fit into.

## Sites and Domain Controller Site-Assignment

When applying Forest level configuration [in the proper order](../../advanced/processing-order.html), [sites](sites.html) are created (and [subnets](subnets.html) defined) before assigning [domain controllers](servers.html) to their site.

That way, when setting up a new forest, we first create the necessary infrastructure before trying to fit the DCs into the correct slot.
The one problem this causes is when trying to delete an undesired site that still has a domain controller assigned.
If this happens, a warning will be generated.
A second run of the forest configuration will then cause the deletion to succeed (as now the domain controller was correctly moved).

This is a common issue for initial deployments, as the default site cannot be deleted yet.
