# Windows Update PowerShell Module
# https://gallery.technet.microsoft.com/scriptcenter/2d191bcd-3308-4edd-9de2-88dff796b0bc


Set-ExecutionPolicy RemoteSigned


<# The module can be installed manualy and extract in two places:

    %USERPROFILE%\Documents\WindowsPowerShell\Modules
    %WINDIR%\System32\WindowsPowerShell\v1.0\Modules 
#> 

# cd 'C:\temp\Powershell\Windows_Update\PSWindowsUpdate\'
# dir function:add\*

gcm -Module pswindows*
#Import-Module PSWindowsUpdate
#Get-WUInstall -MicrosoftUpdate -IgnoreUserInput -WhatIf -Verbose
#Get-WUInstall –MicrosoftUpdate –ListOnly

Update-WUModule
Get-WUList
