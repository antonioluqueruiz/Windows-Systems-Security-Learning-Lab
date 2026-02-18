<#
.SYNOPSIS
    Day 1 - Script 02: Network Discovery.
    Retrieves IP addresses, DNS, and active connections.
#>

Clear-Host
Write-Host "--- NETWORK DISCOVERY REPORT ---" -ForegroundColor Cyan
Write-Host "Generated on: $(Get-Date)"

# 1. IP Addresses (Filtering out loopback)
Write-Host " "
Write-Host "[IP Configuration]" -ForegroundColor Yellow
Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.InterfaceAlias -notlike "*Loopback*" } | Select-Object InterfaceAlias, IPAddress | Format-Table

# 2. DNS Configuration
Write-Host "[DNS Client Servers]" -ForegroundColor Yellow
Get-DnsClientServerAddress -AddressFamily IPv4 | Select-Object InterfaceAlias, ServerAddresses | Format-Table

# 3. Active Connections (Top 5)
Write-Host "[Active TCP Connections]" -ForegroundColor Yellow
Get-NetTCPConnection -State Established | Select-Object LocalAddress, LocalPort, RemoteAddress, RemotePort -First 5 | Format-Table

Write-Host "--- End of Report ---" -ForegroundColor Cyan