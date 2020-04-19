# Group Policy Objects

## Description

The Group Policy Object [Component](../components.html) allows defining and deploying Group Policy Objects.
You need to build the GPOs you want in a reference domain and then create the configuration from there (see "Tools" further below).

Current limitations prevent the use of Migration Tables.
This means that at the current time it is not - yet - possible to translate domain specific content through this configuration.

For related [Components](../components.html) see:

+ [Group Policy Links](gplinks.html)
+ [Group Policy Permissions](gppermissions.html)
+ [Group Policy Permission Filters](gppermissionfilters.html)
+ [Group Policy Registry Settings](gpregistrysettings.html)

> Tracking Change / Modification

There are two mechanisms in place that help detecting undesired change or pending updates:

a) When creating the export, exch GPO is assigned an ExportID.
This is stored in a file within the GPO folder in the destination domain when applying the configuration.
When updating the configuration by creating a new export, the ExportID changes.
The system then detects the mismatch and applies the new version.

b) When applying the configuration to a domain, it notes the new `VersionNumber` value on the AD object of the GPO and notes it in the same config file placed in the GPO folder in the domain.
If somebody manually modifies the GPO, this number increments in the AD and the test will catch the mismatch.

> Limitation on Detection

Due to limitations of the current implementation, the ADMF will not detect unlinked GPOs.
Thus, if you do not link your defined GPOs, even after applying the configuration will show them as missing (though they exist in AD).
This is slated to be fixed in future versions of the [Component](../components.html), when the entire GPO process is redefined.

## Tools

Exports all GPOs in the Contoso domain into the current path and prepares them for deployment using ADMF:

```powershell
Get-GPO -Domain contoso.com -All | Export-AdmfGpo -Path . -Domain contoso.com
```

> Copy all files and folders thus created into the `domain/grouppolicies` folder.
> Updating only a few of the GPOs later on requires manually updating the json file generated as part of the export.
