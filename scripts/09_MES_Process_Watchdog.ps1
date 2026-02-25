
# Propósito: Monitorizar y recuperar procesos críticos de fabricación.

$ProcessName = "Notepad" # Usamos Notepad para probar, en la realidad sería "MES_Client"

Write-Host "--- Verificando estado del cliente MES ---" -ForegroundColor Cyan

$Proc = Get-Process -Name $ProcessName -ErrorAction SilentlyContinue

if ($Proc) {
    if ($Proc.Responding) {
        Write-Host "El proceso $($ProcessName) está respondiendo correctamente." -ForegroundColor Green
    } else {
        Write-Host "ALERTA: El proceso $($ProcessName) NO RESPONDE. Reiniciando..." -ForegroundColor Red
        Stop-Process -Name $ProcessName -Force
        Start-Process $ProcessName
    }
} else {
    Write-Host "Aviso: El proceso $($ProcessName) no está en ejecución. Iniciando..." -ForegroundColor Yellow
    Start-Process $ProcessName
}