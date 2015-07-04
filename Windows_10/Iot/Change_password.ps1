# Change the password for user Administrator, the password is set in the variable $new_password

$hostname = "MINWINPC"
$new_password = "p@ssw0rd"

net start WinRM
Set-Item WSMan:\localhost\Client\TrustedHosts -Value $hostname
remove-module psreadline -force
Enter-PsSession -ComputerName $hostname -Credential $hostname\Administrator 
net user Administrator $new_password
schtasks /Delete /TN Microsoft\Windows\IoT\Startup /F
