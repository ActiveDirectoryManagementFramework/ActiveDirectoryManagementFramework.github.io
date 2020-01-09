# Protocols

## Synopsis

This document covers the protocols used for performing Active Directory management and why they are needed.
In short, protocols used:

+ WinRM (Windows Remote Management)
+ ADWS (Active Directory Web Services)
+ ldap

## WinRM

The ADMF uses WinRM in two roles:

+ Domain Controller Deployment
+ SDDL Identity Resolution

By default, WinRM uses HTTP on TCP-port 5985.

> Domain Controller Deployment

The three commands that deploy new Domain Controllers (along with new Forests or subdomains) are:

+ Install-DCChildDomain
+ Install-DCDomainController
+ Install-DCRootDomain

They all fully operate using WinRM - no other protocol needed from the client.
Both creating a child domain and adding a domain controller to an existing domain require LDAP connectivity between the domain controller you are creating and the target domain / root domain.

> SDDL Identity Resolution

When resolving identities on an Access Control List (ACL), based on the SDDL string, this must be done from the domain owning the ACL.
SDDL is a shortened form to notate permissions and many well-known identities are identified by abbreviations.
These will always be resolved to identities of the local domain, so when administrating a remote domain (e.g.: From an admin forest), this resolution must happen in the target domain.
Hence WinRM and PowerShell Remoting to do just that.

This is mostly used for resolving the default permissions of objects based on their Schema definition.

## ADWS

Almost all operations use the Active Directory module to perform their actions.
That module uses the Active Directory WebServices for performing their workload.

By default, ADWS connects to TCP-port 9389 using HTTPS.

## LDAP

The ADMF uses LDAP primarily for Access Rule and Access Control List operations.
This is due to a feature-gap in the Active Directory module.

By default, LDAP connects to port 389 (both TCP & UDP).
