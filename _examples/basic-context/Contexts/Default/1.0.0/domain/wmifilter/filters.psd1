@{
    Name        = 'Client'
    Description = 'Applies to all client OS versions'
    Query       = 'SELECT * FROM Win32_OperatingSystem WHERE ProductType = 1'
    # Namespace = 'root\CIMv2'
    Author      = 'Friedrich Weinmann'
    CreatedOn   = '2022-10-21'
}
@{
    Name        = 'Server'
    Description = 'Applies to all server OS versions'
    Query       = 'SELECT * FROM Win32_OperatingSystem WHERE ProductType = 3'
    # Namespace = 'root\CIMv2'
    Author      = 'Friedrich Weinmann'
    CreatedOn   = '2022-10-21'
}
@{
    Name        = "Windows 11"
    Description = "All Windows 11 Clients"
    Query       = 'SELECT * FROM Win32_OperatingSystem WHERE Caption like "Microsoft Windows 11%"'
    Author      = "Friedrich Weinmann"
    CreatedOn   = "2022-10-20"
}
@{
    Name        = "Windows 10 & 11"
    Description = "Modern Windows Clients"
    Query       = @(
        'SELECT * FROM Win32_OperatingSystem WHERE Caption like "Microsoft Windows 11%"'
        'SELECT * FROM Win32_OperatingSystem WHERE Caption like "Microsoft Windows 10%"'
    )
    Author      = "Friedrich Weinmann"
    CreatedOn   = "2022-10-20"
}