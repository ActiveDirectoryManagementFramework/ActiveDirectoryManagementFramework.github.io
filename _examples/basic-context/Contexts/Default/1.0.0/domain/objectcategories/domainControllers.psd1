@{
    Name = 'DomainController'
    ObjectClass = 'computer'
    Property = @('PrimaryGroupID')
    TestScript = { $args[0].PrimaryGroupID -eq 516 }
    LDAPFilter = '(&(objectCategory=computer)(primaryGroupID=516))'
    SearchBase = 'OU=Domain Controllers,%DomainDN%'
}