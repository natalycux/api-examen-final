# ?? GUÍA PASO A PASO PARA EL EXAMEN

## ?? ANTES DEL EXAMEN (PREPARACIÓN - HACER HOY)

### 1?? SUBIR A GITHUB

#### Opción A: Si NO tienes repositorio creado

**PASO 1: Crear repositorio en GitHub**
1. Ve a https://github.com/new
2. Crea un nuevo repositorio:
   - **Nombre**: `api-examen-final` (o el que prefieras)
   - **Visibilidad**: Private (recomendado) o Public
   - ? NO marques "Add a README file"
   - ? NO marques "Add .gitignore"
   - Clic en **Create repository**

**PASO 2: Abrir terminal en la ubicación correcta**

En Visual Studio:
1. Ve al menú: **View** ? **Terminal** (o presiona `Ctrl + ñ`)
2. **IMPORTANTE**: Asegúrate de estar en el directorio correcto
3. En la terminal, escribe:
```bash
cd "API EXAMEN FINAL"
pwd   # En Windows usa: cd (sin argumentos)
```

Deberías ver algo como:
```
C:\Users\TU-USUARIO\...\API EXAMEN FINAL\API EXAMEN FINAL
```

**PASO 3: Inicializar Git y subir a GitHub**

?? **IMPORTANTE**: Si ves un error en cualquier comando, lee la sección "?? ERRORES DE GIT Y SOLUCIONES" más abajo.

```bash
# 1. Inicializar Git
git init

# 2. Configurar Git (SOLO la primera vez)
git config user.name "Tu Nombre"
git config user.email "tu@email.com"

# 3. Verificar que hay archivos (deberías ver archivos listados)
git status

# 4. Agregar todos los archivos
git add .

# 5. Si el comando anterior da error, intenta:
git add -A

# 6. Hacer el primer commit
git commit -m "Setup inicial API para examen"

# 7. Conectar con GitHub (CAMBIA TU-USUARIO y api-examen-final)
git remote add origin https://github.com/TU-USUARIO/api-examen-final.git

# 8. Cambiar a la rama main
git branch -M main

# 9. Subir a GitHub
git push -u origin main
```

**Si te pide credenciales:**
- **Usuario**: Tu nombre de usuario de GitHub
- **Password**: Un **Personal Access Token** (no tu contraseña)
  - Ve a: https://github.com/settings/tokens
  - **Generate new token (classic)**
  - Marca: `repo` (todos los permisos)
  - Copia el token y úsalo como contraseña

#### Opción B: Si YA tienes un repositorio
```bash
# 1. Navegar al directorio correcto
cd "API EXAMEN FINAL"

# 2. Agregar cambios
git add .

# 3. Hacer commit
git commit -m "Setup inicial API para examen"

# 4. Subir
git push
```

---

## ?? ERRORES DE GIT Y SOLUCIONES

### ? Error: "fatal: not a git repository"
**Causa**: No estás en un repositorio Git o no se ha inicializado

**Solución:**
```bash
# Asegúrate de estar en el directorio correcto
cd "API EXAMEN FINAL"

# Inicializa Git
git init
```

---

### ? Error: "git add ." no funciona / no hace nada
**Causa**: Puede haber problemas con el punto (.) en algunos terminales de Windows

**Solución 1**: Usa `-A` en lugar de `.`
```bash
git add -A
```

**Solución 2**: Usa PowerShell en lugar de CMD
1. En Visual Studio: View ? Terminal
2. En la barra de la terminal, selecciona **PowerShell** (flecha hacia abajo)
3. Intenta de nuevo: `git add .`

**Solución 3**: Especifica el directorio explícitamente
```bash
git add --all
```

**Solución 4**: Navega al directorio padre
```bash
# Sube un nivel
cd ..

# Agrega todo desde aquí
git add .

# O especifica el directorio
git add "API EXAMEN FINAL/"
```

---

### ? Error: "Author identity unknown"
**Causa**: Git no sabe quién eres

**Solución:**
```bash
git config user.name "Tu Nombre Completo"
git config user.email "tuemail@ejemplo.com"

# Luego intenta el commit de nuevo
git commit -m "Setup inicial API para examen"
```

---

### ? Error: "nothing to commit, working tree clean"
**Causa**: No hay cambios para agregar (posiblemente ya está todo commiteado)

**Solución:**
```bash
# Verifica el estado
git status

# Si dice "Your branch is up to date", entonces ya está todo subido
# Solo necesitas hacer push si aún no lo has hecho
git push
```

---

### ? Error: "remote origin already exists"
**Causa**: Ya configuraste el remote anteriormente

**Solución 1**: Usa el remote existente
```bash
git push
```

**Solución 2**: Si necesitas cambiar el remote
```bash
# Elimina el remote existente
git remote remove origin

# Agrega el nuevo
git remote add origin https://github.com/TU-USUARIO/api-examen-final.git

# Intenta push
git push -u origin main
```

---

### ? Error: "Permission denied" o "Authentication failed"
**Causa**: Credenciales incorrectas o no tienes permisos

**Solución:**
1. Verifica que el repositorio existe en tu GitHub
2. Genera un **Personal Access Token**:
   - Ve a: https://github.com/settings/tokens
   - Clic en **Generate new token (classic)**
   - Selecciona los permisos: ? `repo` (todos)
   - Copia el token
3. Cuando te pida password, usa el **token** (no tu contraseña de GitHub)

**Alternativa - Usar GitHub Desktop:**
1. Descarga GitHub Desktop: https://desktop.github.com/
2. Inicia sesión con tu cuenta
3. File ? Add Local Repository
4. Selecciona tu carpeta "API EXAMEN FINAL"
5. Publica el repositorio

---

### ? Error: "refused to merge unrelated histories"
**Causa**: El repositorio local y el remoto tienen historias diferentes

**Solución:**
```bash
git pull origin main --allow-unrelated-histories
git push -u origin main
```

---

### ? Error: "Updates were rejected because the tip of your current branch is behind"
**Causa**: El repositorio remoto tiene cambios que no tienes localmente

**Solución:**
```bash
# Trae los cambios del remoto
git pull --rebase

# Luego sube
git push
```

---

## ? VERIFICAR QUE GIT FUNCIONA

Después de configurar todo, verifica:

```bash
# 1. Verifica que Git está inicializado
git status
# Deberías ver: "On branch main" o "On branch master"

# 2. Verifica el remote
git remote -v
# Deberías ver: origin https://github.com/TU-USUARIO/api-examen-final.git

# 3. Verifica los commits
git log --oneline
# Deberías ver tu commit inicial

# 4. Verifica en GitHub
# Ve a: https://github.com/TU-USUARIO/api-examen-final
# Deberías ver todos tus archivos
```

---



### 3?? ACTUALIZAR APPSETTINGS.JSON CON TU CADENA DE AZURE

En Visual Studio, edita `appsettings.json`:

```json
{
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft.AspNetCore": "Warning"
    }
  },
  "AllowedHosts": "*",
  "ConnectionStrings": {
    "DefaultConnection": "Server=tcp:sql-examen-TU-NOMBRE.database.windows.net,1433;Initial Catalog=db-examen-final;Persist Security Info=False;User ID=adminexamen;Password=Examen2024!;MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  }
}
```

**Guarda el archivo y súbelo a GitHub:**

?? **ASEGÚRATE DE ESTAR EN EL DIRECTORIO CORRECTO**:
```bash
# Verifica dónde estás
cd

# Si no estás en "API EXAMEN FINAL", navega a él:
cd "API EXAMEN FINAL"

# Ahora sí, agrega y sube
git add appsettings.json
git commit -m "Configurar conexión Azure SQL"
git push
```

---

### 4?? CREAR WEB APP EN AZURE

1. En Azure Portal, busca "App Services"
2. Clic en **+ Create** ? **Web App**
3. Configuración:
   - **Resource Group**: `rg-examen-final` (el mismo)
   - **Name**: `api-examen-TU-NOMBRE` (debe ser único globalmente)
   - **Publish**: Code
   - **Runtime stack**: .NET 8 (LTS)
   - **Operating System**: Windows
   - **Region**: East US (el mismo que la BD)
   - **Pricing Plan**: Clic en "Explore pricing plans"
     - Selecciona **Free F1** (gratis) o **Basic B1**
4. Clic en **Review + create** ? **Create**
5. ? Espera 2-3 minutos

---

### 5?? CONFIGURAR DEPLOYMENT DESDE GITHUB

1. Ve a tu Web App: `api-examen-TU-NOMBRE`
2. En el menú izquierdo: **Deployment** ? **Deployment Center**
3. Configuración:
   - **Source**: GitHub
   - Clic en **Authorize** (conecta tu cuenta de GitHub)
   - **Organization**: Tu usuario de GitHub
   - **Repository**: `api-examen-final`
   - **Branch**: `main`
4. Clic en **Save**
5. Azure automáticamente:
   - Creará un workflow en `.github/workflows/`
   - Hará el primer despliegue
   - ? Espera 3-5 minutos

---

### 6?? CREAR MIGRACIÓN INICIAL Y ACTUALIZAR BASE DE DATOS

En la terminal de Visual Studio:

```bash
# Crear migración inicial
dotnet ef migrations add MigracionInicial

# Aplicar migración a Azure
dotnet ef database update
```

? Esto creará la tabla `Items` en tu base de datos de Azure.

---

### 7?? VERIFICAR QUE TODO FUNCIONA

1. Ve a tu Web App en Azure
2. Clic en **Browse** (arriba) o ve a: `https://api-examen-TU-NOMBRE.azurewebsites.net`
3. Deberías ver un error o una página de ASP.NET
4. Agrega `/swagger` a la URL: `https://api-examen-TU-NOMBRE.azurewebsites.net/swagger`
5. ? Deberías ver la interfaz de Swagger con tu API

**Prueba los endpoints:**
- GET `/api/Items` ? Debe devolver un array vacío `[]`
- POST `/api/Items` ? Crea un item de prueba
- GET `/api/Items` ? Ahora debe mostrar el item creado

---

## ?? DURANTE EL EXAMEN (SOLO EDITAR CÓDIGO)

### ?? FLUJO DE TRABAJO EN EL EXAMEN

#### 1. Lee las especificaciones del examen
Ejemplo: "Crear API REST para gestionar **Productos** con propiedades: Id, Nombre, Precio, Stock"

#### 2. Renombrar el modelo (Item.cs ? Producto.cs)
- En Visual Studio, haz clic derecho en `Item.cs` ? **Rename**
- Cambia a `Producto.cs`
- Visual Studio automáticamente renombrará la clase

#### 3. Editar propiedades del modelo
```csharp
public class Producto
{
    public int Id { get; set; }
    public string Nombre { get; set; } = string.Empty;
    public decimal Precio { get; set; }
    public int Stock { get; set; }
}
```

#### 4. Actualizar el DbContext (Data/ApplicationDbContext.cs)
```csharp
public DbSet<Producto> Productos { get; set; }
```

#### 5. Renombrar el controlador (ItemsController.cs ? ProductosController.cs)
- Clic derecho ? **Rename** ? `ProductosController.cs`
- Dentro del archivo, cambia todas las referencias:
  - `ItemsController` ? `ProductosController`
  - `Item` ? `Producto`
  - `_context.Items` ? `_context.Productos`
  - Ruta: `[Route("api/[controller]")]` se actualizará automáticamente a `/api/Productos`

#### 6. Crear nueva migración
```bash
# Eliminar migraciones anteriores (si existen)
dotnet ef migrations remove

# Crear nueva migración
dotnet ef migrations add CrearTablaProductos

# Aplicar a base de datos de Azure
dotnet ef database update
```

?? **IMPORTANTE**: Si la base de datos en Azure ya tiene tablas y datos, es mejor:
```bash
# Solo crear la migración
dotnet ef migrations add CrearTablaProductos

# Actualizar la BD
dotnet ef database update
```

#### 7. Probar localmente
- Presiona **F5** en Visual Studio
- Se abrirá Swagger en: `https://localhost:XXXX/swagger`
- Prueba todos los endpoints (GET, POST, PUT, DELETE)

#### 8. Subir cambios a GitHub (y automáticamente a Azure)
```bash
git add .
git commit -m "Implementar API de Productos - Examen Final"
git push
```

#### 9. Esperar el deployment automático
- Ve a tu repositorio en GitHub
- Clic en la pestaña **Actions**
- Verás el workflow ejecutándose (punto amarillo ??)
- Espera a que termine (check verde ?) - toma 2-3 minutos

#### 10. Verificar en Azure
- Ve a: `https://api-examen-TU-NOMBRE.azurewebsites.net/swagger`
- Prueba todos los endpoints
- ? **Listo para entregar**

---

## ?? SOLUCIÓN DE PROBLEMAS COMUNES

### Problema 1: Error de migración "The table already exists"
**Solución:**
```bash
# Eliminar todas las migraciones
Remove-Item -Recurse -Force .\Migrations

# Crear nueva migración
dotnet ef migrations add Inicial

# Forzar actualización
dotnet ef database update
```

### Problema 2: Error de conexión a la base de datos
**Solución:**
1. Verifica que tu IP esté en el firewall de Azure SQL
2. Ve a Azure Portal ? Tu servidor SQL ? Networking
3. Agrega tu IP actual con **+ Add your client IPv4 address**
4. **Save**

### Problema 3: El deployment falla en GitHub Actions
**Solución:**
1. Ve a GitHub ? Actions ? Clic en el workflow fallido
2. Revisa los logs para ver el error
3. Errores comunes:
   - Falta un paquete NuGet ? Agrega en Visual Studio
   - Error de compilación ? Revisa que el código compile localmente (F5)

### Problema 4: Swagger no aparece en Azure
**Solución:**
1. Verifica que `Program.cs` tenga:
```csharp
app.UseSwagger();
app.UseSwaggerUI();
```
2. FUERA de cualquier `if (app.Environment.IsDevelopment())`

### Problema 5: Error 500 en Azure pero funciona local
**Solución:**
1. Ve a Azure Portal ? Tu Web App
2. **Monitoring** ? **Log stream**
3. Ve los logs en tiempo real para identificar el error
4. Usualmente es la cadena de conexión incorrecta

---

## ?? CHECKLIST PRE-EXAMEN

- [ ] Código subido a GitHub
- [ ] Base de datos creada en Azure
- [ ] Web App creada en Azure
- [ ] Deployment Center configurado con GitHub
- [ ] Migración inicial aplicada
- [ ] Swagger funciona en Azure (`/swagger`)
- [ ] Puedo crear y leer items de prueba
- [ ] URL de Azure anotada: `https://api-examen-_______.azurewebsites.net`
- [ ] Cadena de conexión guardada en appsettings.json

---

## ?? TIPS PARA EL EXAMEN

1. **Lee TODAS las especificaciones antes de empezar a codificar**
2. **No elimines código, copia y renombra** (es más rápido)
3. **Prueba localmente ANTES de subir a GitHub**
4. **Usa el TEMPLATE_COPIAR_PEGAR.cs** para generar código rápido
5. **Commit frecuente**: Sube cambios cada vez que algo funcione
6. **Revisa EJEMPLOS_ESCENARIOS.md** para ver casos similares
7. **Swagger es tu amigo**: Úsalo para probar sin necesidad de Postman

---

## ?? RECURSOS DE EMERGENCIA

- **Repositorio de plantilla**: https://github.com/TU-USUARIO/api-examen-final
- **Azure Portal**: https://portal.azure.com
- **URL API en Azure**: https://api-examen-TU-NOMBRE.azurewebsites.net/swagger
- **Documentación .NET**: https://learn.microsoft.com/en-us/aspnet/core

---

**¡ÉXITO EN TU EXAMEN! ??**
