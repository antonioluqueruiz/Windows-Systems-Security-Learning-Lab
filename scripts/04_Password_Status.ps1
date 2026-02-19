<#
.SYNOPSIS
    Day 2 - Script 04: User Password Status.
    Lists local users and their password metadata.
#>

Write-Host "`n--- 🔑 USER PASSWORD HYGIENE REPORT ---" -ForegroundColor Yellow

Get-LocalUser | Select-Object Name, Enabled, PasswordLastSet, @{Name="PasswordExpires";Expression={$_.PasswordExpires -ne $null}} | Format-Table -AutoSize
