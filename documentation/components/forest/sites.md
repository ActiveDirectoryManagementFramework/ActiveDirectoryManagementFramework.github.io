# Sites

## Description

Using this forest level component you can define, what sites should exist in your active directory environment.
By defining at least one site, the ADMF assumes all sites to be under management - *any undefined site will be flagged for deletion!*

For more information on sites and their purpose, [see the reference documentation](https://docs.microsoft.com/en-us/windows-server/identity/ad-ds/plan/designing-the-site-topology).

Sites cannot be deleted, so long as at least a single domain controller is assigned to it!

## Example Configuration

```json
[
    {
        "Name":  "ContosoEU",
        "Description":  "Contoso Datacenter in Europe",
        "Location":  "EU CON - Germany, Frankfurt"
    }
]
```

## Tools

> TODO: Add Content

## Sites and Domain Controller Site-Assignment

When applying Forest level configuration [in the proper order](../../advanced/processing-order.html), [sites](sites.html) are created (and [subnets](subnets.html) defined) before assigning [domain controllers](servers.html) to their site.

That way, when setting up a new forest, we first create the necessary infrastructure before trying to fit the DCs into the correct slot.
The one problem this causes is when trying to delete an undesired site that still has a domain controller assigned.
If this happens, a warning will be generated.
A second run of the forest configuration will then cause the deletion to succeed (as now the domain controller was correctly moved).

This is a common issue for initial deployments, as the default site cannot be deleted yet.

## Properties

### Name

The name of the site.

### Description

A useful description explaining what the site represents.

### Location

The physical location of the site.

> This is actually a documentary field and has no technical impact.

### OldNames

Optional: Yes | Default: @()

Previous name(s) the site was known as.
Allows renaming sites.
If more than one previous name is currently in use, instead of renaming one of them, a unique error will be generated and logged.
