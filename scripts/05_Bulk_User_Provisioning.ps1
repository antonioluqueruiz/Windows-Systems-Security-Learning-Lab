<#
.SYNOPSIS
    Day 2 - Script 05: Bulk User Provisioning.
    Automates the creation of multiple local users with security best practices.
#>

$NewUsers = @("User_Alpha", "User_Beta", "User_Gamma")
$DefaultPassword = ConvertTo-SecureString "Temp2026!" -AsPlainText -Force

Write-Host "--- 🚀 BULK PROVISIONING START ---" -ForegroundColor Cyan

foreach ($User in $NewUsers) {
    if (-not (Get-LocalUser -Name $User -ErrorAction SilentlyContinue)) {
        New-LocalUser -Name $User -Password $DefaultPassword -Description "Temp account for new employee" -PasswordNeverExpires $false
        
        # Forzamos a que cambien la contraseña en el primer login
        Set-LocalUser -Name $User -PasswordExpiresAtNextLogon $true
        
        Write-Host "[SUCCESS] Created user: $User" -ForegroundColor Green
    } else {
        Write-Host "[SKIP] User $User already exists." -ForegroundColor Yellow
    }
}

Write-Host "--- Provisioning Complete ---" -ForegroundColor Cyan