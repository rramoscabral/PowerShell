$hostaname = "hostname"
$domain = "domain"
$username = "username"

Enable-PSRemoting -Force
Set-Item wsman:\localhost\client\trustedhosts $hostaname
Restart-Service WinRM
Test-WsMan $hostaname
# Invoke-Command -ComputerName COMPUTER -ScriptBlock { COMMAND } -credential USERNAME
Enter-PSSession -ComputerName $hostaname -Credential $domain\$username
