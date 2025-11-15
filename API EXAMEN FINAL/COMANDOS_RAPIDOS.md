# ? COMANDOS RÁPIDOS PARA EL EXAMEN

## ?? COMANDOS GIT (Subir a GitHub)

### ?? IMPORTANTE: Ubicación correcta
```bash
# Siempre asegúrate de estar en el directorio correcto
cd "API EXAMEN FINAL"

# Verifica donde estás (PowerShell)
pwd

# Verifica donde estás (CMD)
cd
```

### Primera vez (configurar GitHub)
```bash
# 1. Inicializar Git
git init

# 2. Configurar usuario (SOLO primera vez)
git config user.name "Tu Nombre Completo"
git config user.email "tuemail@ejemplo.com"

# 3. Agregar todos los archivos
git add .

# Si el comando anterior falla, prueba:
git add -A

# 4. Hacer commit
git commit -m "Setup inicial API para examen"

# 5. Conectar con GitHub (CAMBIA TU-USUARIO)
git remote add origin https://github.com/TU-USUARIO/api-examen-final.git

# 6. Cambiar a rama main
git branch -M main

# 7. Subir a GitHub
git push -u origin main
```

### Durante el examen (actualizar)
```bash
# Opción 1: Comandos separados
git add .
git commit -m "Implementar [NOMBRE-FUNCIONALIDAD]"
git push

# Opción 2: Todo en una línea (PowerShell)
git add . ; git commit -m "Implementar API" ; git push
```

### Ver estado
```bash
git status              # Ver cambios
git log --oneline       # Ver commits
git remote -v           # Ver remote configurado
```

### Solucionar problemas comunes

#### Error: "git add ." no funciona
```bash
# Prueba estas alternativas:
git add -A
git add --all
git add *
```

#### Error: "not a git repository"
```bash
# Inicializa Git
git init
```

#### Error: "Author identity unknown"
```bash
git config user.name "Tu Nombre"
git config user.email "tu@email.com"
```

#### Error: "remote origin already exists"
```bash
# Opción 1: Usa el existente
git push

# Opción 2: Elimina y recrea
git remote remove origin
git remote add origin https://github.com/TU-USUARIO/api-examen-final.git
```

#### Error: "Authentication failed"
```bash
# Necesitas un Personal Access Token
# 1. Ve a: https://github.com/settings/tokens
# 2. Generate new token (classic)
# 3. Marca: repo (todos los permisos)
# 4. Usa el token como password
```

#### Error: "Updates were rejected"
```bash
# Trae cambios primero
git pull --rebase
git push
```

### Script de diagnóstico
```powershell
# Si tienes muchos problemas, ejecuta:
.\diagnostico-git.ps1
```

---

## ??? COMANDOS ENTITY FRAMEWORK (Migraciones)

### Crear primera migración
```bash
dotnet ef migrations add MigracionInicial
dotnet ef database update
```

### Durante el examen (después de cambiar el modelo)
```bash
# Crear nueva migración
dotnet ef migrations add [NombreMigracion]

# Ejemplo:
dotnet ef migrations add CrearTablaProductos

# Aplicar a la base de datos
dotnet ef database update
```

### Si algo sale mal (reiniciar migraciones)
```bash
# Eliminar todas las migraciones
dotnet ef database drop -f
Remove-Item -Recurse -Force .\Migrations

# Empezar de nuevo
dotnet ef migrations add Inicial
dotnet ef database update
```

### Ver migraciones aplicadas
```bash
dotnet ef migrations list
```

---

## ??? COMANDOS DOTNET (Build y Run)

### Compilar el proyecto
```bash
dotnet build
```

### Ejecutar localmente
```bash
dotnet run
```

### Restaurar paquetes NuGet
```bash
dotnet restore
```

### Agregar un paquete (ejemplo)
```bash
dotnet add package Newtonsoft.Json
```

---

## ?? COMANDOS DE VERIFICACIÓN

### Ver versión de .NET
```bash
dotnet --version
```

### Ver herramientas de EF Core instaladas
```bash
dotnet ef --version
```

### Si EF Core tools no está instalado
```bash
dotnet tool install --global dotnet-ef
```

### Actualizar EF Core tools
```bash
dotnet tool update --global dotnet-ef
```

---

## ?? COMANDOS DE TROUBLESHOOTING

### Limpiar build
```bash
dotnet clean
dotnet build
```

### Ver errores detallados
```bash
dotnet build --verbosity detailed
```

### Listar todos los paquetes del proyecto
```bash
dotnet list package
```

---

## ?? COMANDOS AZURE CLI (Opcional - avanzado)

### Instalar Azure CLI (si no lo tienes)
Descarga de: https://aka.ms/installazurecliwindows

### Login a Azure
```bash
az login
```

### Ver tus Web Apps
```bash
az webapp list --output table
```

### Ver logs de tu Web App en tiempo real
```bash
az webapp log tail --name api-examen-TU-NOMBRE --resource-group rg-examen-final
```

### Reiniciar tu Web App
```bash
az webapp restart --name api-examen-TU-NOMBRE --resource-group rg-examen-final
```

---

## ? SECUENCIA TÍPICA EN EL EXAMEN

```bash
# 1. Editar código en Visual Studio
# (cambiar modelos, controladores, etc.)

# 2. Crear migración
dotnet ef migrations add [DescripcionCambio]

# 3. Aplicar a BD
dotnet ef database update

# 4. Probar localmente
dotnet run
# (o presiona F5 en Visual Studio)

# 5. Subir a GitHub (y auto-deploy a Azure)
git add .
git commit -m "Implementar [funcionalidad]"
git push

# 6. Esperar 2-3 minutos y verificar en:
# https://api-examen-TU-NOMBRE.azurewebsites.net/swagger
```

---

## ?? COMANDOS DE EMERGENCIA

### Si Git da error de configuración
```bash
git config --global user.name "Tu Nombre"
git config --global user.email "tuemail@ejemplo.com"
```

### Si push es rechazado (out of sync)
```bash
git pull --rebase
git push
```

### Si quieres descartar cambios locales
```bash
git reset --hard HEAD
git clean -fd
```

### Ver diferencias antes de commit
```bash
git diff
```

---

## ?? PLANTILLA DE COMMITS

Usa mensajes descriptivos:
- ? `git commit -m "Agregar modelo Producto con validaciones"`
- ? `git commit -m "Implementar CRUD completo de Productos"`
- ? `git commit -m "Corregir error en PUT endpoint"`
- ? `git commit -m "cambios"`
- ? `git commit -m "fix"`

---

## ?? URLS IMPORTANTES

- **Repositorio GitHub**: https://github.com/TU-USUARIO/api-examen-final
- **Azure Portal**: https://portal.azure.com
- **Tu API en Azure**: https://api-examen-TU-NOMBRE.azurewebsites.net/swagger
- **GitHub Actions (ver deployments)**: https://github.com/TU-USUARIO/api-examen-final/actions

---

**?? TIP**: Guarda este archivo abierto durante el examen en una pestaña de Visual Studio para acceso rápido.
