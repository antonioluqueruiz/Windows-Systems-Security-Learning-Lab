<#
.SYNOPSIS
    Day 1: System Discovery & Asset Inventory.
#>

Clear-Host
Write-Host "--- SYSTEM DISCOVERY REPORT ---" -ForegroundColor Cyan
Write-Host "Generated on: $(Get-Date)"

# 1. Operating System
$OS = Get-CimInstance Win32_OperatingSystem
Write-Host " "
Write-Host "[OS Information]" -ForegroundColor Yellow
Write-Host "Name: $($OS.Caption)"
Write-Host "Version: $($OS.Version)"

# 2. RAM Calculation
$RAM = Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum
$TotalRAM = [Math]::Round($RAM.Sum / 1GB, 2)
Write-Host " "
Write-Host "[Memory]" -ForegroundColor Yellow
Write-Host "Total RAM: $TotalRAM GB"

# 3. Storage
$Disk = Get-PSDrive C
$FreeSpace = [Math]::Round($Disk.Free / 1GB, 2)
Write-Host " "
Write-Host "[Storage]" -ForegroundColor Yellow
Write-Host "Free Space on C: $FreeSpace GB"

Write-Host " "
Write-Host "--- End of Report ---" -ForegroundColor Cyan