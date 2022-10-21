@{
	# Constrained: We own everything unless we exclude it
	Mode               = "Constrained"
	# List of OUs to explicitly include. Implicitly includes the domain root if empty and Mode set to Constrained
	Include            = @()
	# List of OUs (and its children) to ignore
	Exclude            = @(
		"OU=Resources,%DomainDN%"
		"OU=Clients,%DomainDN%"
		"OU=Company,%DomainDN%"
	)
	# User Name Patterns to not delete. Useful for excluding exchange system users.
	# Use %GUID% as placeholder for any kind of guid
	UserExcludePattern = @(
		'^SystemMailbox{%GUID%}$'
		'^DiscoverySearchMailbox {%GUID%}$'
		'^Migration.%GUID%$'
		'^FederatedEmail.%GUID%$'
		'^Exchange Online-ApplicationAccount$'
	)

	# Whether to remove unknown WMI Filters
	# Defaults to false, leave commented out to not define it in a given Context
	# RemoveUnknownWmiFilter = $true
}