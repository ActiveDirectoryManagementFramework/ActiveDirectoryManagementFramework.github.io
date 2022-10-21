@{
    SamAccountName       = "t0.admin.js"
    GivenName            = "John"
    Surname              = "Smith"
    Description          = "Tier 0 Admin Account of John Smith"
    PasswordNeverExpires = $false
    UserPrincipalName    = "t0.admin.js@%DomainFqdn%"
    Path                 = "OU=Users,OU=Tier0,%DomainDN%"
    OldNames             = "t0.admin.john.smith"
    Enabled              = $true
}