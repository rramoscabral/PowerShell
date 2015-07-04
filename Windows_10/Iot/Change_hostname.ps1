# Change the hostname, the new hostname is set in the variable $new_hostname

#variables
$current_hostname = "MINWINPC"
$new_hostname = "MINWINPC"

net start WinRM
Set-Item WSMan:\localhost\Client\TrustedHosts -Value $current_hostname
remove-module psreadline -force
Enter-PsSession -ComputerName $current_hostname -Credential $current_hostname\Administrator 
set computername $new_hostname
shutdown /r /t 0
