<#
.SYNOPSIS
    Day 2 - Script 03: Local Admin Audit.
    Identifies all members of the local Administrators group.
#>

Clear-Host
Write-Host "--- 🛡️ LOCAL ADMINISTRATORS AUDIT ---" -ForegroundColor Red
Write-Host "Checking privileged accounts..."

# Obtenemos los miembros del grupo local de administradores
$admins = Get-LocalGroupMember -Group "Administradores"

$admins | Select-Object Name, PrincipalSource, ObjectClass | Format-Table -AutoSize

Write-Host "Audit complete. Verify if all listed users require these permissions." -ForegroundColor Gray