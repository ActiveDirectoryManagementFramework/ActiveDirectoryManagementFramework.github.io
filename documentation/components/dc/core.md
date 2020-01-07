# Core deployment settings

You can deploy new forests, child-domains or member-DCs using the following commands:

```powershell
Install-DCChildDomain
Install-DCDomainController
Install-DCRootDomain
```

There are a few considerations specific to deploying domain controllers:

+ Should it use AD integrated DNS?
+ Do we want to reboot after promoting a DC?
+ What paths to use for database, logs or sysvol?

These can be configured by using a configuration file, however those can also be defined per parameter when calling any of the Install-DC* commands.
To configure any of these settings, create a file directly in the `dc` folder of a context named `dc_config.json` and define the values.

Example configuration file content:

```json
{
    "NoDNS":  false,
    "NoReboot":  false,
    "LogPath":  "C:\\Windows\\NTDS",
    "SysvolPath":  "C:\\Windows\\SYSVOL",
    "DatabasePath":  "C:\\Windows\\NTDS"
}
```

These in fact are the default values used when no configuration is provided.
Only define properties you want to define - a partial configuration is totally fine.
