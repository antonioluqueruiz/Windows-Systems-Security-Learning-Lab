
Write-Host "--- Auditoría de Periféricos de Planta ---" -ForegroundColor Cyan

# Buscamos dispositivos tipo Impresora o Escáner (USB)
$Devices = Get-PnpDevice | Where-Object { $_.Status -eq "OK" -and ($_.FriendlyName -like "*Printer*" -or $_.FriendlyName -like "*Barcode*") }

if ($Devices) {
    foreach ($Dev in $Devices) {
        Write-Host "Detectado: $($Dev.FriendlyName) - ESTADO: OPERATIVO" -ForegroundColor Green
    }
} else {
    Write-Host "ADVERTENCIA: No se detectan periféricos MES críticos conectados." -ForegroundColor Yellow
}