

$MES_Server = "127.0.0.1" # Cambiar por la IP del servidor MES real
$Threshold = 50 # Umbral de alerta en milisegundos

Write-Host "--- Iniciando Monitor de Latencia MES ---" -ForegroundColor Cyan

$Result = Test-Connection -ComputerName $MES_Server -Count 4

# Cálculo de la media de latencia
$AvgLatency = ($Result.ResponseTime | Measure-Object -Average).Average

if ($AvgLatency -gt $Threshold) {
    Write-Host "ALERTA: Latencia crítica detectada ($AvgLatency ms). Riesgo de desincronización en MES." -ForegroundColor Red
} else {
    Write-Host "Estado: ÓPTIMO ($AvgLatency ms). Conectividad estable para producción." -ForegroundColor Green
}