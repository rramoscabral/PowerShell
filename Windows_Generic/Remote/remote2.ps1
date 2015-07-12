$hostname ="hostname"

Set-ExecutionPolicy RemoteSigned
Enable-PSRemoting -Force
Set-Item wsman:\localhost\client\trustedhosts $hostname
Restart-Service WinRM
Enter-PSSession $hostname
