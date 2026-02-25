

$LogPath = "C:\MES_Application\Logs" # Ruta simulada del software MES
$DaysToKeep = 7

Write-Host "--- Iniciando mantenimiento de logs del sistema ---" -ForegroundColor Cyan

# Verificamos si la carpeta existe antes de actuar
if (Test-Path $LogPath) {
    $OldFiles = Get-ChildItem -Path $LogPath | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-$DaysToKeep) }
    
    if ($OldFiles) {
        $OldFiles | Remove-Item -Force
        Write-Host "Éxito: Se han eliminado $($OldFiles.Count) archivos de log antiguos." -ForegroundColor Green
    } else {
        Write-Host "Estado: No hay archivos más antiguos de $DaysToKeep días." -ForegroundColor Gray
    }
} else {
    Write-Host "Error: No se encuentra el directorio de logs del MES." -ForegroundColor Red
}