# Credential Providers

## Description

Credential providers are used for translating the credentials to use for all actions performed against active directory.

For example, the ADMF could be extended to integrate a password safe solution:
When connecting to a target domain, this provider scriptblock would retrieve the required credentials from a password safe solution.

Custom privilege grant workflows can also be integrated with that.
For example, you could temporarily grant Schema Admin permissions before updating Schema [Components](../components/components.html), and afterwards revoke them again.

Credential Providers are integrated into the ADMF wrapper commands:

+ Test-AdmfDomain
+ Test-AdmfForest
+ Invoke-AdmfDomain
+ Invoke-AdmfForest

> They are _not_ integrated into the individual [Component](../components/components.html) commands, such as `Invoke-DMUser` or `Test-FMSchema`!

## Implementing a Credential Provider

A credential provider consists of two scriptblocks:

+ A PreScript that is executed before running any commands. It must return either a PSCredential object (if applicable) or $null (if default windows credentials should be used instead).
+ A PostScript that is executed after all component commands have been executed. It need not return anything.

Both scriptblocks receive a single input object, with two properties:

+ Server: The computer / domain targeted
+ Credential: The credentials originally provided (if any - this may be $null instead!)

### Example: Basic Secrets Management

```powershell
Register-AdmfCredentialProvider -Name Secrets -PreScript {
    Param (
        $Data
    )

    Get-Secret $data.Server
}
```

Then later you would use it like this:

```powershell
Test-AdmfDomain -Server contoso.com -CredentialProvider Secrets
```

### Example: Temporary Schema Admin

```powershell
Register-AdmfCredentialProvider -Name Schema -PreScript {
    Param (
        $Data
    )

    $parameters = $Data | ConvertTo-PSFhashTable -Include Server, Credential
    $pdcEmulator = (Get-ADDomain @parameters).PDCEmulator
    $parameters.Server = $pdcEmulator

    $password = & (Get-Module DomainManagement) { New-Password -Length 256 -AsSecureString }

    $user = New-ADUser @parameters -SamAccountName "tempSchemaAdmin" -Name "tempSchemaAdmin" -AccountPassword $password -Enabled $true
    $group = Get-ADGroup @parameters -Identity 'Schema Admins'
    Add-ADPrincipalGroupMembership @parameters -Identity $user -MemberOf $group
    [PSCredential]::new("tempSchemaAdmin@$((Get-ADDomain @parameters).DNSRoot)", $password)
} -PostScript {
    Param (
        $Data
    )

    $parameters = $Data | ConvertTo-PSFhashTable -Include Server, Credential
    $pdcEmulator = (Get-ADDomain @parameters).PDCEmulator
    $parameters.Server = $pdcEmulator

    Remove-ADUser @parameters -Identity 'tempSchemaAdmin'
}
```

This credential provider will create a temporary account and adds it to the Schema Admins.
After processing is done, it will then delete the account again.

## The Default Provider

There is a default Credential provider implemented in the ADMF itself:

```powershell
Register-AdmfCredentialProvider -Name default -PreScript {
    param (
        $Data
    )
    $Data.Credential
}
```

This provider is used in all calls where no other Credential Provider was specified.
If you want to change the default Credential Provider, define a new Credential Provider under the name "default", overwriting the previous Provider.
Just keep in mind, that any error might leave you unable to perform _any_ authentication until fixed!
