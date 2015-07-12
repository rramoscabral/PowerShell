echo off
rem Powershell NoProfile ExecutionPolicy unrestricted File c:\temp\Reset-Account.ps1
powershell.exe -ExecutionPolicy Bypass -Command "C:\temp\adpwsreset.ps1 -aduser teste -adusermail teste@teste.pt -itmail teste@teste.pt"
