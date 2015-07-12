$hostname = "gt-srv-002"
$service ="WinRM"
Start-Service -InputObject $(Get-Service -Computer $hostname -Name $service)
