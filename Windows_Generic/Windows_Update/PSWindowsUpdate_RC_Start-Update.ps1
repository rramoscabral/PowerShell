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
