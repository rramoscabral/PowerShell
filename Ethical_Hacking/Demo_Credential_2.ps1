#Demo Credential_2

$user = Read-Host "Enter new Username"
$pass = Read-Host "Enter new Password" -AsSecureString

echo "user: " $user 
echo "Password : "$pass
