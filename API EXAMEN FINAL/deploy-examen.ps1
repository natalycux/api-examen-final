# Script para usar DURANTE el examen
# Ejecutar en PowerShell desde la raíz del proyecto
# Automatiza los pasos repetitivos

param(
    [Parameter(Mandatory=$true)]
    [string]$NombreEntidad,
    
    [Parameter(Mandatory=$false)]
    [string]$MensajeCommit = "Implementar API $NombreEntidad - Examen"
)

Write-Host "==================================" -ForegroundColor Cyan
Write-Host "  DEPLOYMENT RAPIDO - EXAMEN" -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Entidad: $NombreEntidad" -ForegroundColor Yellow
Write-Host ""

# 1. Compilar
Write-Host "[1/5] Compilando proyecto..." -ForegroundColor Yellow
dotnet build
if ($LASTEXITCODE -ne 0) {
    Write-Host "  ? ERROR DE COMPILACION. Revisa el código." -ForegroundColor Red
    exit 1
}
Write-Host "  ? Compilación exitosa" -ForegroundColor Green

# 2. Crear migración
Write-Host "[2/5] Creando migración..." -ForegroundColor Yellow
$nombreMigracion = "Crear$NombreEntidad"
dotnet ef migrations add $nombreMigracion
if ($LASTEXITCODE -ne 0) {
    Write-Host "  ? ERROR al crear migración" -ForegroundColor Red
    exit 1
}
Write-Host "  ? Migración '$nombreMigracion' creada" -ForegroundColor Green

# 3. Aplicar migración
Write-Host "[3/5] Aplicando migración a base de datos..." -ForegroundColor Yellow
dotnet ef database update
if ($LASTEXITCODE -ne 0) {
    Write-Host "  ? ERROR al actualizar BD. Verifica la cadena de conexión." -ForegroundColor Red
    exit 1
}
Write-Host "  ? Base de datos actualizada" -ForegroundColor Green

# 4. Git add y commit
Write-Host "[4/5] Preparando commit..." -ForegroundColor Yellow
git add .
git commit -m "$MensajeCommit"
if ($LASTEXITCODE -ne 0) {
    Write-Host "  ! No hay cambios para commit (puede ser normal)" -ForegroundColor Yellow
}
Write-Host "  ? Cambios confirmados" -ForegroundColor Green

# 5. Push a GitHub
Write-Host "[5/5] Subiendo a GitHub y Azure..." -ForegroundColor Yellow
git push
if ($LASTEXITCODE -ne 0) {
    Write-Host "  ? ERROR al hacer push. Verifica tu conexión y remote." -ForegroundColor Red
    exit 1
}
Write-Host "  ? Cambios subidos a GitHub" -ForegroundColor Green

Write-Host ""
Write-Host "==================================" -ForegroundColor Cyan
Write-Host "  ? DEPLOYMENT INICIADO" -ForegroundColor Green
Write-Host "==================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "GitHub Actions está desplegando tu API a Azure..." -ForegroundColor Yellow
Write-Host "Esto tomará 2-3 minutos." -ForegroundColor Yellow
Write-Host ""
Write-Host "Mientras esperas:" -ForegroundColor White
Write-Host "1. Ve a GitHub Actions para ver el progreso:" -ForegroundColor White
Write-Host "   https://github.com/[TU-USUARIO]/api-examen-final/actions" -ForegroundColor Cyan
Write-Host ""
Write-Host "2. Cuando termine (check verde ?), verifica en:" -ForegroundColor White
Write-Host "   https://api-examen-[TU-NOMBRE].azurewebsites.net/swagger" -ForegroundColor Cyan
Write-Host ""
Write-Host "3. Prueba todos los endpoints (GET, POST, PUT, DELETE)" -ForegroundColor White
Write-Host ""
Write-Host "¡BUENA SUERTE! ??" -ForegroundColor Green
Write-Host ""

# Opcional: Abrir GitHub Actions en el navegador
$openBrowser = Read-Host "¿Abrir GitHub Actions en el navegador? (S/N)"
if ($openBrowser -eq "S" -or $openBrowser -eq "s") {
    # Obtener la URL del remote
    $remoteUrl = git config --get remote.origin.url
    if ($remoteUrl) {
        $remoteUrl = $remoteUrl -replace "\.git$", ""
        $remoteUrl = $remoteUrl -replace "git@github.com:", "https://github.com/"
        $actionsUrl = "$remoteUrl/actions"
        Start-Process $actionsUrl
        Write-Host "Abriendo $actionsUrl" -ForegroundColor Green
    }
}
