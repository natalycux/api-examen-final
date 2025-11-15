# Script de preparación rápida para el examen
# Ejecutar en PowerShell desde la raíz del proyecto

Write-Host "==================================" -ForegroundColor Cyan
Write-Host "  PREPARACION RAPIDA - EXAMEN API" -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan
Write-Host ""

# Función para verificar si un comando existe
function Test-Command {
    param($Command)
    try {
        if (Get-Command $Command -ErrorAction Stop) {
            return $true
        }
    }
    catch {
        return $false
    }
}

# 1. Verificar .NET
Write-Host "[1/8] Verificando .NET SDK..." -ForegroundColor Yellow
if (Test-Command dotnet) {
    $dotnetVersion = dotnet --version
    Write-Host "  ? .NET SDK instalado: $dotnetVersion" -ForegroundColor Green
} else {
    Write-Host "  ? .NET SDK NO encontrado. Instala desde: https://dotnet.microsoft.com/download" -ForegroundColor Red
    exit 1
}

# 2. Verificar Git
Write-Host "[2/8] Verificando Git..." -ForegroundColor Yellow
if (Test-Command git) {
    $gitVersion = git --version
    Write-Host "  ? Git instalado: $gitVersion" -ForegroundColor Green
} else {
    Write-Host "  ? Git NO encontrado. Instala desde: https://git-scm.com/download" -ForegroundColor Red
    exit 1
}

# 3. Verificar EF Core Tools
Write-Host "[3/8] Verificando Entity Framework Tools..." -ForegroundColor Yellow
if (Test-Command "dotnet-ef") {
    $efVersion = dotnet ef --version
    Write-Host "  ? EF Core Tools instalado: $efVersion" -ForegroundColor Green
} else {
    Write-Host "  ! EF Core Tools NO encontrado. Instalando..." -ForegroundColor Yellow
    dotnet tool install --global dotnet-ef
    Write-Host "  ? EF Core Tools instalado" -ForegroundColor Green
}

# 4. Restaurar paquetes NuGet
Write-Host "[4/8] Restaurando paquetes NuGet..." -ForegroundColor Yellow
dotnet restore
if ($LASTEXITCODE -eq 0) {
    Write-Host "  ? Paquetes restaurados" -ForegroundColor Green
} else {
    Write-Host "  ? Error al restaurar paquetes" -ForegroundColor Red
}

# 5. Compilar proyecto
Write-Host "[5/8] Compilando proyecto..." -ForegroundColor Yellow
dotnet build --no-restore
if ($LASTEXITCODE -eq 0) {
    Write-Host "  ? Proyecto compilado exitosamente" -ForegroundColor Green
} else {
    Write-Host "  ? Error de compilación. Revisa los errores." -ForegroundColor Red
    exit 1
}

# 6. Verificar Git configuración
Write-Host "[6/8] Verificando configuración de Git..." -ForegroundColor Yellow
$gitUser = git config user.name
$gitEmail = git config user.email

if ($gitUser -and $gitEmail) {
    Write-Host "  ? Git configurado:" -ForegroundColor Green
    Write-Host "    Usuario: $gitUser" -ForegroundColor Gray
    Write-Host "    Email: $gitEmail" -ForegroundColor Gray
} else {
    Write-Host "  ! Git no está completamente configurado" -ForegroundColor Yellow
    Write-Host "    Ejecuta estos comandos:" -ForegroundColor Yellow
    Write-Host '    git config --global user.name "Tu Nombre"' -ForegroundColor Cyan
    Write-Host '    git config --global user.email "tu@email.com"' -ForegroundColor Cyan
}

# 7. Verificar cadena de conexión
Write-Host "[7/8] Verificando cadena de conexión..." -ForegroundColor Yellow
$appsettings = Get-Content ".\API EXAMEN FINAL\appsettings.json" -Raw | ConvertFrom-Json
$connectionString = $appsettings.ConnectionStrings.DefaultConnection

if ($connectionString -like "*CAMBIAR*") {
    Write-Host "  ! Cadena de conexión NO configurada" -ForegroundColor Yellow
    Write-Host "    Edita appsettings.json con tu cadena de Azure SQL" -ForegroundColor Yellow
} else {
    Write-Host "  ? Cadena de conexión configurada" -ForegroundColor Green
}

# 8. Verificar estado de Git
Write-Host "[8/8] Verificando repositorio Git..." -ForegroundColor Yellow
if (Test-Path ".git") {
    Write-Host "  ? Repositorio Git inicializado" -ForegroundColor Green
    
    # Verificar remote
    $remote = git remote -v 2>$null
    if ($remote) {
        Write-Host "  ? Remote configurado:" -ForegroundColor Green
        git remote -v | ForEach-Object { Write-Host "    $_" -ForegroundColor Gray }
    } else {
        Write-Host "  ! Remote NO configurado. Ejecuta:" -ForegroundColor Yellow
        Write-Host '    git remote add origin https://github.com/TU-USUARIO/api-examen-final.git' -ForegroundColor Cyan
    }
} else {
    Write-Host "  ! Git NO inicializado. Ejecuta:" -ForegroundColor Yellow
    Write-Host "    git init" -ForegroundColor Cyan
}

Write-Host ""
Write-Host "==================================" -ForegroundColor Cyan
Write-Host "  RESUMEN" -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan
Write-Host ""

# Mostrar siguiente paso
Write-Host "PROXIMOS PASOS:" -ForegroundColor Yellow
Write-Host ""
Write-Host "1. Edita appsettings.json con tu cadena de conexión de Azure" -ForegroundColor White
Write-Host "2. Crea la migración inicial:" -ForegroundColor White
Write-Host "   dotnet ef migrations add MigracionInicial" -ForegroundColor Cyan
Write-Host "3. Aplica la migración:" -ForegroundColor White
Write-Host "   dotnet ef database update" -ForegroundColor Cyan
Write-Host "4. Prueba localmente:" -ForegroundColor White
Write-Host "   dotnet run" -ForegroundColor Cyan
Write-Host "5. Sube a GitHub:" -ForegroundColor White
Write-Host "   git add ." -ForegroundColor Cyan
Write-Host "   git commit -m 'Setup inicial'" -ForegroundColor Cyan
Write-Host "   git push -u origin main" -ForegroundColor Cyan
Write-Host ""
Write-Host "Revisa GUIA_EXAMEN_PASO_A_PASO.md para más detalles" -ForegroundColor Green
Write-Host ""

# Opcional: Preguntar si quiere abrir la guía
$openGuide = Read-Host "¿Deseas abrir la guía completa ahora? (S/N)"
if ($openGuide -eq "S" -or $openGuide -eq "s") {
    Start-Process ".\API EXAMEN FINAL\GUIA_EXAMEN_PASO_A_PASO.md"
}
