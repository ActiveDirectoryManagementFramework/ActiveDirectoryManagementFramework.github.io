# Schema (ldif file)

## Description

Sometimes it becomes convenient to roll out schema extensions using an Ldif file.
For example, several Microsoft products require such an extension (Skype for Business or SCCM, to name a couple of names).

While those extension scripts could be converted into regular schema extension configs, *this is often not supported!!!*
This makes applying the ldif file mandatory to staying in support.

Simply drop the relevant ldif files in the `forest/schemaldif` folder, using a file-name that represents what they contain.
The Forest Management module will parse them and be able to determine in most cases, whether they have already been applied (and in the correct version), then only run them if required.

> When working with the AD Schema, keep in mind the [special considerations for privileges](../../advanced/schema-privilege-management.html)
