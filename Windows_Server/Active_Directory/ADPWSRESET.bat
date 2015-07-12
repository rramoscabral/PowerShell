 #####################################  
 ## Reset user AD password and send the new by e-mail
 ## 
 ## Ricardo Cabral v0.0.1
 ##
 ## original source http://kunaludapi.blogspot.com  
 ##  
 #####################################

# param AD USSER , MAIL FORM USER AD , IT EMAIL
 Param(
  [string]$aduser,
  [string]$adusermail,
  [string]$itmail
)


Begin {  
   Clear-Host  
   #Check for Active Directory module  
   if (-not (Import-Module activedirectory)) {  
     Import-Module activedirectory  
   }  
   
   #Generate Random Password  

   function Generate-Password {
   $Minlength=11        #Pasword Length
   $numberOfNonAlphanumericCharacters= 4  #number of special chars
   Add-Type -Assembly System.Web
   $NewPwd=[Web.Security.Membership]::GeneratePassword($Minlength,$numberOfNonAlphanumericCharacters)

   return $newpwd
   
}

     
   #Get AD user account and validate it  
   do {   
     
     # $SamAccountName = Read-Host "`nReset Password For AD Account" 
     $SamAccountName = $aduser

     if ($SamAccountName -eq "") {  
       Clear-Host  
       #only for debug
       #Write-Host -Object "`nPlease type AccountName`n" -BackgroundColor Red  
       continue  
     }  
     elseif ($(Get-ADUser -LDAPFilter "(sAMAccountName=$SamAccountName)").SamAccountName -eq $SamAccountName) {  
       $AccountToReset = Get-ADUser -LDAPFilter "(sAMAccountName=$SamAccountName)"  
         
       break  
     }  
     else {  
       Clear-Host  
       #only for debug
       #Write-Host -Object "`nTyped Account Name doesn't exists, Please try again`n" -BackgroundColor Red  
       $Everything_is_fine = $false   
     }  
   }  
   while ($SamAccountName -eq "" -or $Everything_is_fine -eq $false)  
  
  #only for debug 
  #Write-Host "`nAccount has been verified and it exists`n" -ForegroundColor Green  
     
   #$To = Read-Host "`nTL or Manager you want to send password to[Manager@example.com]"  
   $To = $adusermail
   
   
   #One Time Information fillup  
   #Change the next variables
   $From = "teste@teste.pt"  
   $Subject = "AD WINDOWS SYSTEMS : Password reset request for user $SamAccountName"  
   $SmtpServer = "mail.testes.pt"  
   $port = 25  
 }  
   
 Process {  
   #Reset password and unlock it  
   $PlainText = Generate-Password  
   #Replace Character '^' by '-' in String
   $PlainText -replace "\^", '-'
   $Password = ConvertTo-SecureString -AsPlainText $PlainText -Force  
   $AccountToReset | Set-ADAccountPassword -Reset -NewPassword $Password  
   $AccountToReset | Unlock-ADAccount  
   
   #Only for debug
   #Write-Warning "Password reseted and unlocked"  
   
   # break line
   $OFS = "`r`n"

   #Send Email to AD User  
   $Body = "Este correio electronico informa a nova palavra passe de acesso aos sistemas XPTO."+ $OFS + $OFS + 
   "Nome de utilizador: XPTO\$SamAccountName"+ $OFS + "Palavra Passe: $PlainText" + $OFS + $OFS + 
   "Esta palavra passe tem uma validade maxima de 30 dias sendo alterado automaticamente." + $OFS  + $OFS + 
   "Este correio electronico foi enviado automaticamente. Para qualquer questao envie um correio electronico para : teste(at)teste(dot)pt."   
   Send-MailMessage -To $To -From $From -Subject $Subject -Body $Body -SmtpServer $SmtpServer -Port 25  
  
  #only for debug
  #Write-Host "Information emailed " $adusermail -ForegroundColor Cyan  

   
   #Send Email to AD IT
   $Body = "Foi alterado a palavra passe da conta $SamAccountName."  
   Send-MailMessage -To $itmail -From $From -Subject $Subject -Body $Body -SmtpServer $SmtpServer -Port 25  
   
   #only for debug
   #Write-Host "Information emailed to IT " $itmail -ForegroundColor Cyan  

 }  
   
 End {  
   #Write-Host "New password is $PlainText"  
   
   Only for debug
   #Write "The user " $aduser " is unblocked and the new pass is " $PlainText
   
   #Pause  
 }  
