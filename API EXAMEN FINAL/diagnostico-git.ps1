# Script de diagnóstico de Git
# Ejecutar si tienes problemas con Git

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "  DIAGNÓSTICO DE GIT - EXAMEN API" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""

# Verificar ubicación actual
Write-Host "1. UBICACIÓN ACTUAL:" -ForegroundColor Yellow
$currentPath = Get-Location
Write-Host "   $currentPath" -ForegroundColor White
Write-Host ""

# Verificar si estamos en el directorio correcto
if ($currentPath -like "*API EXAMEN FINAL*") {
    Write-Host "   ? Estás en el directorio correcto" -ForegroundColor Green
} else {
    Write-Host "   ! Advertencia: No pareces estar en 'API EXAMEN FINAL'" -ForegroundColor Yellow
    Write-Host "   Intenta: cd 'API EXAMEN FINAL'" -ForegroundColor Cyan
}
Write-Host ""

# Verificar Git instalado
Write-Host "2. GIT INSTALADO:" -ForegroundColor Yellow
try {
    $gitVersion = git --version 2>&1
    Write-Host "   ? $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "   ? Git NO está instalado o no está en PATH" -ForegroundColor Red
    Write-Host "   Descarga desde: https://git-scm.com/download/win" -ForegroundColor Cyan
    exit 1
}
Write-Host ""

# Verificar si es un repositorio Git
Write-Host "3. REPOSITORIO GIT:" -ForegroundColor Yellow
if (Test-Path ".git") {
    Write-Host "   ? Este es un repositorio Git" -ForegroundColor Green
    
    # Mostrar estado
    Write-Host ""
    Write-Host "4. ESTADO DE GIT:" -ForegroundColor Yellow
    git status
    
} else {
    Write-Host "   ? NO es un repositorio Git (falta carpeta .git)" -ForegroundColor Red
    Write-Host "   Inicializa con: git init" -ForegroundColor Cyan
    
    $init = Read-Host "   ¿Deseas inicializar Git ahora? (S/N)"
    if ($init -eq "S" -or $init -eq "s") {
        git init
        Write-Host "   ? Git inicializado" -ForegroundColor Green
    }
}
Write-Host ""

# Verificar configuración de usuario
Write-Host "5. CONFIGURACIÓN DE USUARIO:" -ForegroundColor Yellow
$gitUser = git config user.name 2>$null
$gitEmail = git config user.email 2>$null

if ($gitUser -and $gitEmail) {
    Write-Host "   ? Usuario configurado:" -ForegroundColor Green
    Write-Host "     Nombre: $gitUser" -ForegroundColor White
    Write-Host "     Email: $gitEmail" -ForegroundColor White
} else {
    Write-Host "   ? Usuario NO configurado" -ForegroundColor Red
    Write-Host "   Configura con:" -ForegroundColor Cyan
    Write-Host '   git config user.name "Tu Nombre"' -ForegroundColor Cyan
    Write-Host '   git config user.email "tu@email.com"' -ForegroundColor Cyan
    Write-Host ""
    
    $config = Read-Host "   ¿Deseas configurar ahora? (S/N)"
    if ($config -eq "S" -or $config -eq "s") {
        $nombre = Read-Host "   Ingresa tu nombre"
        $email = Read-Host "   Ingresa tu email"
        
        git config user.name "$nombre"
        git config user.email "$email"
        
        Write-Host "   ? Usuario configurado" -ForegroundColor Green
    }
}
Write-Host ""

# Verificar remote
Write-Host "6. REMOTE CONFIGURADO:" -ForegroundColor Yellow
$remote = git remote -v 2>$null

if ($remote) {
    Write-Host "   ? Remote configurado:" -ForegroundColor Green
    $remote | ForEach-Object { Write-Host "     $_" -ForegroundColor White }
} else {
    Write-Host "   ! No hay remote configurado" -ForegroundColor Yellow
    Write-Host "   Configura con:" -ForegroundColor Cyan
    Write-Host '   git remote add origin https://github.com/TU-USUARIO/api-examen-final.git' -ForegroundColor Cyan
}
Write-Host ""

# Contar archivos en el directorio
Write-Host "7. ARCHIVOS EN EL DIRECTORIO:" -ForegroundColor Yellow
$files = Get-ChildItem -File -Recurse | Where-Object { $_.FullName -notlike "*\obj\*" -and $_.FullName -notlike "*\bin\*" -and $_.FullName -notlike "*\.git\*" }
$fileCount = $files.Count
Write-Host "   Total de archivos (excl. bin/obj/.git): $fileCount" -ForegroundColor White

if ($fileCount -eq 0) {
    Write-Host "   ? No se encontraron archivos. Verifica la ubicación." -ForegroundColor Red
} else {
    Write-Host "   ? Archivos encontrados" -ForegroundColor Green
}
Write-Host ""

# Verificar archivos sin trackear
Write-Host "8. ARCHIVOS SIN AGREGAR (UNTRACKED):" -ForegroundColor Yellow
if (Test-Path ".git") {
    $untracked = git ls-files --others --exclude-standard
    if ($untracked) {
        $untrackedCount = ($untracked | Measure-Object).Count
        Write-Host "   Archivos sin agregar: $untrackedCount" -ForegroundColor White
        Write-Host "   Primeros 5 archivos:" -ForegroundColor Gray
        $untracked | Select-Object -First 5 | ForEach-Object { Write-Host "     - $_" -ForegroundColor Gray }
    } else {
        Write-Host "   ? Todos los archivos están trackeados" -ForegroundColor Green
    }
} else {
    Write-Host "   ! Primero inicializa Git" -ForegroundColor Yellow
}
Write-Host ""

# Resumen y recomendaciones
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "  RESUMEN Y RECOMENDACIONES" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""

$issues = @()

if (-not (Test-Path ".git")) {
    $issues += "- Inicializa Git: git init"
}
if (-not $gitUser -or -not $gitEmail) {
    $issues += "- Configura usuario: git config user.name y user.email"
}
if (-not $remote) {
    $issues += "- Configura remote: git remote add origin [URL]"
}

if ($issues.Count -eq 0) {
    Write-Host "? ¡Todo parece estar bien!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Para agregar archivos y hacer commit:" -ForegroundColor White
    Write-Host "  1. git add ." -ForegroundColor Cyan
    Write-Host "  2. git commit -m 'Mensaje'" -ForegroundColor Cyan
    Write-Host "  3. git push" -ForegroundColor Cyan
} else {
    Write-Host "! Problemas encontrados:" -ForegroundColor Yellow
    $issues | ForEach-Object { Write-Host $_ -ForegroundColor Yellow }
}
Write-Host ""

# Ofrecer ejecutar comandos automáticamente
if ($issues.Count -gt 0) {
    $auto = Read-Host "¿Deseas que intente arreglar estos problemas automáticamente? (S/N)"
    if ($auto -eq "S" -or $auto -eq "s") {
        
        if (-not (Test-Path ".git")) {
            Write-Host ""
            Write-Host "Inicializando Git..." -ForegroundColor Cyan
            git init
            Write-Host "? Git inicializado" -ForegroundColor Green
        }
        
        if (-not $gitUser -or -not $gitEmail) {
            Write-Host ""
            Write-Host "Configurando usuario..." -ForegroundColor Cyan
            $nombre = Read-Host "Nombre completo"
            $email = Read-Host "Email"
            git config user.name "$nombre"
            git config user.email "$email"
            Write-Host "? Usuario configurado" -ForegroundColor Green
        }
        
        if (-not $remote) {
            Write-Host ""
            Write-Host "Configurando remote..." -ForegroundColor Cyan
            $repoUrl = Read-Host "URL del repositorio (ej: https://github.com/usuario/repo.git)"
            git remote add origin $repoUrl
            Write-Host "? Remote configurado" -ForegroundColor Green
        }
        
        Write-Host ""
        Write-Host "? Configuración completada" -ForegroundColor Green
        Write-Host ""
        Write-Host "Ahora puedes ejecutar:" -ForegroundColor White
        Write-Host "  git add ." -ForegroundColor Cyan
        Write-Host "  git commit -m 'Setup inicial'" -ForegroundColor Cyan
        Write-Host "  git push -u origin main" -ForegroundColor Cyan
    }
}

Write-Host ""
Write-Host "Diagnóstico completado." -ForegroundColor Green
Write-Host ""
