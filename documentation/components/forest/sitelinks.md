# Sitelinks

## Description

Define the [link between two sites](https://docs.microsoft.com/en-us/windows-server/identity/ad-ds/plan/creating-a-site-link-design).

> Implementing a multilateral sitelink with 3+ sites is not supported at the moment.

When defining _any_ sitelinks, the ADMF assumes this to be an exhaustive list of _all_ sitelinks.
Links that are not defined will be deleted.

Sitelinks are purely logical constructs defined in active directory, not actual network connections.
They are used by domain controllers to determine the ideal replication topology.
They are also used by other services to determine the ideal domain controller to connect to.

> Sitelink names

The ADMF determines the ideal sitelink name based on sites involved (using a `<site1>-<site2>` naming pattern).
This may cause it to delete and recreate existing links, if their name does not match this convention.

> Roadmap: [Adding custom names support](https://github.com/ActiveDirectoryManagementFramework/ForestManagement/issues/2)
>
> Roadmap: [Adding support for more than 2 sites](https://github.com/ActiveDirectoryManagementFramework/ForestManagement/issues/3)

## Example Configuration

A sample sitelink configuration:

```json
[
    {
        "Site1":  "ContosoNA",
        "Site2":  "ContosoEU",
        "Cost":  750,
        "Interval":  15,
        "Option":  null,
        "Description":  "NA-EU Link | 2020 | 1MB/s"
    }
]
```

This will define a new sitelink:

+ Between ContosoNA and ContosoEU
+ At a high replication cost of 750 (a pretty slow link)
+ With a replication interval of 15 minutes
+ Without any special options (Setting it to 1 would have caused it to ignore the usual replication interval and treated it as a local link instead for replication purposes)

## Tools

> Content Pending

## Properties

### Site1

The first sitename in the pair of sites to be linked.

### Site2

The second sitename in the pair of sites to be linked.

### Cost

The cost of the connection between the two sites.

### Interval

Optional: true | Default: 15

The replication interval (in minutes) between two sites.
Defaults to 15 minutes.
Cannot be less than 15 minutes.

### Description

A description to add to the sitelink.
For example, consider including a timestamp and the available bandwidth.

### Option

Any options for the sitelink.
This is a bitmap with currently only one relevant setting:

+ 00000001 : Change Notify (Changes replicate instantly, rather than the configured interval. Only use for high-bandwidth connections)
