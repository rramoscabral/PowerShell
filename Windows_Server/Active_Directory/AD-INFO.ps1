# Check if the ActiveDirectory module is Loaded
Get-Module -Name ActiveDirevtory

# Check if the ActiveDirectory module is available
Get-Module -Name ActiveDirectory -ListAvailable

# Import the ActiveDirectory module
Import-Module -Name ActiveDirectory

# Find Cmdlets in the ActiveDirectory related to OrganizationalUnit
Get-Command -Module ActiveDirectory -Name *OrganizationalUnit*

# Get Organizational Unit objects
Get-ADObject -Filter { ObjectClass -eq 'organizationalunit' }

# Get Organizational Unit objects
Get-ADObject -Filter { ObjectClass -eq 'organizationalunit' } -Properties CanonicalName | Select-Object -Property CanonicalName
