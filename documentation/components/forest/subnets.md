# Subnets

## Description

Define subnets using configuration.
Subnets are assigned to [sites](sites.html) in the configuration scope of a forest.

These allow computers to detect, what site they are part of and thus the most efficient domain controller to speak with for authentication purposes.
Other services too will use this for network traffic optimization.

> Defining _any_ subnet in configuration causes the ADMF to assume _all_ subnets are defined in configuration, generating delete tasks for any undefined subnets!

## Example Configuration

```json
[
    {
        "SiteName":  "ContosoEU",
        "Name":  "10.20.0.0/24",
        "Description":  "Server subnet Contoso Europe Datacenter",
        "Location":  "Europe > Germany > Frankfurt"
    }
]
```

## Tools

Create configuration based off current subnet configuration:

```powershell
$allSubnets = Get-ADReplicationSubnet -Filter * -Properties Description | Select-Object *,  @{
    Name = "SiteName"
    Expression = { ($_.Site | Get-ADObject).Name }
}
$allSubnets | Select-Object SiteName, Name, Description, Location | ConvertTo-Json
```

## Properties

### SiteName

Name of the site the subnet should be assigned to.

### Name

Subnet to assign.
Must be a subnet in the following notation:

`<ipv4address>/<subnetsize>`

> E.g.: `1.2.3.4/24`

### Description

Description to add to the subnet.

### Location

Location, where the subnet is at.
