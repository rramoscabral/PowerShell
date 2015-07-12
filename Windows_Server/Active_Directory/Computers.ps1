
Get-ADComputer –Filter * –SearchBase “dc=teste,dc=local” | Select Name,ObjectGUID | FT -Autosize
