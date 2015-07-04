#Informacions about the Administrator account

$hostname = "MINWINPC"

net start WinRM
Set-Item WSMan:\localhost\Client\TrustedHosts -Value $hostname
remove-module psreadline -force
Enter-PsSession -ComputerName $hostname -Credential $hostname\Administrator 
net user Administrator 
