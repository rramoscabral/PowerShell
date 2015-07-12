CLS
# Install Remote Server Administration Tools pack
Import-Module ServerManager
Get-WindowsFeature RSAT
Get-WindowsFeature RSAT-Role-Tools
Get-WindowsFeature RSAT-Feature-Tools

Add-WindowsFeature RSAT
Add-WindowsFeature RSAT-Role-Tools
Add-WindowsFeature RSAT-Feature-Tools
