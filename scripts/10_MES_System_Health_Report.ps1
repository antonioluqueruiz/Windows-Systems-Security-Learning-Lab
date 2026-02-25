
# Propósito: Informe ejecutivo del estado de salud del terminal MES.

Write-Host "=============================================" -ForegroundColor Cyan
Write-Host "   INFORME DE SALUD DEL SISTEMA (MES)  " -ForegroundColor Cyan
Write-Host "   Fecha: $(Get-Date -Format 'dd/MM/yyyy HH:mm')" -ForegroundColor Cyan
Write-Host "=============================================" -ForegroundColor Cyan

# 1. Chequeo de Conectividad (Basado en Script 06)
$Server = "127.0.0.1"
$Ping = Test-Connection -ComputerName $Server -Count 2 -ErrorAction SilentlyContinue
if ($Ping) {
    $Avg = ($Ping.ResponseTime | Measure-Object -Average).Average
    Write-Host "[OK] Conectividad Servidor: Estable ($($Avg)ms)" -ForegroundColor Green
} else {
    Write-Host "[ERROR] Conectividad Servidor: OFFLINE" -ForegroundColor Red
}

# 2. Chequeo de Espacio en Disco (Basado en Script 08)
$Disk = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"
$FreeGB = [Math]::Round($Disk.FreeSpace / 1GB, 2)
if ($FreeGB -lt 10) {
    Write-Host "[ALERTA] Espacio en Disco: Crítico ($FreeGB GB libres)" -ForegroundColor Yellow
} else {
    Write-Host "[OK] Espacio en Disco: Suficiente ($FreeGB GB libres)" -ForegroundColor Green
}

# 3. Chequeo de Proceso MES (Basado en Script 09)
$ProcName = "Notepad" # Cambiar por el proceso real en planta
$Proc = Get-Process -Name $ProcName -ErrorAction SilentlyContinue
if ($Proc) {
    Write-Host "[OK] Cliente MES: En ejecución" -ForegroundColor Green
} else {
    Write-Host "[AVISO] Cliente MES: No detectado" -ForegroundColor Yellow
}

Write-Host "---------------------------------------------"
Write-Host "Informe finalizado. Listo para operación." -ForegroundColor Cyan