# ? CHECKLIST COMPLETO - PREPARACIÓN EXAMEN

## ?? ANTES DEL EXAMEN (Hacer HOY)

### ?? AZURE - SQL Database
- [ ] Cuenta de Azure activa (Student o Free)
- [ ] Resource Group creado: `rg-examen-final`
- [ ] SQL Server creado: `sql-examen-[TU-NOMBRE]`
  - [ ] Usuario admin: `adminexamen`
  - [ ] Password guardada de forma segura
  - [ ] Location: East US (o el más cercano)
- [ ] SQL Database creada: `db-examen-final`
  - [ ] Tier: Basic (para ahorro de costos)
- [ ] Firewall configurado:
  - [ ] ? Allow Azure services
  - [ ] ? Mi IP agregada
- [ ] Cadena de conexión copiada y guardada
- [ ] Probada conexión desde Visual Studio

### ?? AZURE - Web App
- [ ] App Service creado: `api-examen-[TU-NOMBRE]`
  - [ ] Runtime: .NET 8
  - [ ] OS: Windows
  - [ ] Region: Same as SQL (East US)
  - [ ] Plan: Free F1 o Basic B1
- [ ] URL anotada: `https://api-examen-[___].azurewebsites.net`

### ?? AZURE - Deployment Center
- [ ] Deployment Center configurado
- [ ] Source: GitHub
- [ ] Repository: `api-examen-final` conectado
- [ ] Branch: `main`
- [ ] Workflow automático funcionando

### ?? GITHUB
- [ ] Repositorio creado: `api-examen-final`
- [ ] Visibilidad configurada (Private recomendado)
- [ ] Código inicial subido
- [ ] Archivo `.gitignore` incluido
- [ ] README con información del proyecto
- [ ] Actions habilitadas
- [ ] Primer deployment exitoso (? verde)

### ?? PROYECTO LOCAL
- [ ] `appsettings.json` actualizado con cadena Azure
- [ ] Entity Framework Tools instalado: `dotnet ef --version`
- [ ] Paquetes NuGet instalados:
  - [ ] `Microsoft.EntityFrameworkCore.SqlServer`
  - [ ] `Microsoft.EntityFrameworkCore.Tools`
  - [ ] `Microsoft.EntityFrameworkCore.Design`
- [ ] Migración inicial creada: `dotnet ef migrations add Inicial`
- [ ] Base de datos actualizada: `dotnet ef database update`
- [ ] Tabla `Items` creada en Azure SQL
- [ ] Proyecto compila sin errores: `dotnet build`

### ?? TESTING LOCAL
- [ ] API corre localmente (F5)
- [ ] Swagger abre automáticamente
- [ ] GET `/api/Items` funciona (devuelve `[]`)
- [ ] POST `/api/Items` funciona (crea item)
- [ ] GET `/api/Items/{id}` funciona (devuelve item)
- [ ] PUT `/api/Items/{id}` funciona (actualiza item)
- [ ] DELETE `/api/Items/{id}` funciona (elimina item)

### ?? TESTING EN AZURE
- [ ] URL Azure accesible: `https://api-examen-[___].azurewebsites.net`
- [ ] Swagger funciona en Azure: `.../swagger`
- [ ] GET `/api/Items` funciona en Azure
- [ ] POST `/api/Items` funciona en Azure
- [ ] Datos persisten en Azure SQL
- [ ] No hay errores 500

### ?? DOCUMENTACIÓN PREPARADA
- [ ] `GUIA_EXAMEN_PASO_A_PASO.md` revisada
- [ ] `COMANDOS_RAPIDOS.md` abierta en VS
- [ ] `AZURE_DEPLOYMENT_INFO.md` revisada
- [ ] `EJEMPLOS_ESCENARIOS.md` revisada
- [ ] `README_EXAMEN.md` actualizado con mi info

### ?? CREDENCIALES Y URLS GUARDADAS
- [ ] URL Azure: `https://api-examen-[___].azurewebsites.net/swagger`
- [ ] URL GitHub: `https://github.com/[USER]/api-examen-final`
- [ ] Cadena conexión SQL guardada de forma segura
- [ ] Usuario SQL: `adminexamen`
- [ ] Password SQL guardada

### ??? HERRAMIENTAS INSTALADAS
- [ ] Visual Studio 2022 o VS Code
- [ ] .NET 8 SDK: `dotnet --version` ? 8.x.x
- [ ] Git: `git --version`
- [ ] Entity Framework Tools: `dotnet ef --version`
- [ ] Azure CLI (Opcional): `az --version`

---

## ?? DURANTE EL EXAMEN

### 1?? PREPARACIÓN (5 min)
- [ ] Leer TODAS las especificaciones del examen
- [ ] Identificar entidad principal (Ej: Producto, Cliente, Libro)
- [ ] Anotar propiedades requeridas
- [ ] Identificar validaciones necesarias
- [ ] Revisar si pide relaciones entre entidades

### 2?? MODELO Y BASE DE DATOS (10 min)
- [ ] Renombrar `Item.cs` a `[Entidad].cs`
- [ ] Actualizar propiedades según especificaciones
- [ ] Agregar data annotations (si se requieren)
- [ ] Actualizar `ApplicationDbContext.cs`:
  - [ ] Cambiar `DbSet<Item> Items` a `DbSet<[Entidad]> [Entidades]`
- [ ] Crear migración: `dotnet ef migrations add [Nombre]`
- [ ] Aplicar migración: `dotnet ef database update`

### 3?? CONTROLADOR (10 min)
- [ ] Renombrar `ItemsController.cs` a `[Entidades]Controller.cs`
- [ ] Actualizar todas las referencias:
  - [ ] Clase: `ItemsController` ? `[Entidades]Controller`
  - [ ] Tipo: `Item` ? `[Entidad]`
  - [ ] DbSet: `_context.Items` ? `_context.[Entidades]`
- [ ] Revisar que la ruta sea correcta: `[Route("api/[controller]")]`
- [ ] Agregar validaciones adicionales (si se requieren)

### 4?? TESTING LOCAL (5 min)
- [ ] Compilar: `dotnet build`
- [ ] Ejecutar: F5 o `dotnet run`
- [ ] Probar TODOS los endpoints en Swagger:
  - [ ] GET `/api/[Entidades]` ? Lista (vacía o con datos)
  - [ ] POST `/api/[Entidades]` ? Crear uno de prueba
  - [ ] GET `/api/[Entidades]/{id}` ? Ver el creado
  - [ ] PUT `/api/[Entidades]/{id}` ? Actualizar
  - [ ] DELETE `/api/[Entidades]/{id}` ? Eliminar
- [ ] Verificar que no haya errores en consola

### 5?? DEPLOYMENT (5 min)
- [ ] Cerrar servidor local (Ctrl + C o detener en VS)
- [ ] Git: `git add .`
- [ ] Git: `git commit -m "Implementar API [Entidad] - Examen Final"`
- [ ] Git: `git push`
- [ ] Ir a GitHub Actions y verificar que empiece el workflow
- [ ] Esperar 2-3 minutos (punto ?? ? check ?)

### 6?? VERIFICACIÓN FINAL EN AZURE (5 min)
- [ ] Abrir: `https://api-examen-[___].azurewebsites.net/swagger`
- [ ] Probar TODOS los endpoints:
  - [ ] GET ? Debe funcionar
  - [ ] POST ? Crear registro de prueba
  - [ ] GET por ID ? Ver el creado
  - [ ] PUT ? Actualizar el registro
  - [ ] DELETE ? Eliminar (opcional, depende del examen)
- [ ] Verificar que los datos persistan (refresh no los borra)
- [ ] Captura de pantalla de Swagger funcionando (opcional)

### 7?? DOCUMENTACIÓN (5 min)
- [ ] Actualizar README.md con:
  - [ ] Nombre de la entidad implementada
  - [ ] Propiedades del modelo
  - [ ] Endpoints disponibles
  - [ ] Ejemplos de request/response
- [ ] Git: `git add .`
- [ ] Git: `git commit -m "Actualizar documentación"`
- [ ] Git: `git push`

### 8?? ENTREGA (2 min)
- [ ] Copiar URL de Swagger en Azure
- [ ] Copiar URL del repositorio GitHub
- [ ] Entregar según instrucciones del profesor
- [ ] Verificar que el profesor pueda acceder

---

## ?? CHECKLIST DE EMERGENCIA

### Si algo falla durante el examen:

#### ? Error de compilación
- [ ] Revisar errores en la ventana de Output
- [ ] Verificar nombres de clases y propiedades
- [ ] Verificar que todas las referencias estén actualizadas
- [ ] `dotnet clean` ? `dotnet build`

#### ? Error de migración
- [ ] Verificar cadena de conexión en appsettings.json
- [ ] Verificar firewall de Azure SQL
- [ ] `dotnet ef migrations remove` (última migración)
- [ ] Crear migración de nuevo

#### ? Error en deployment (GitHub Actions)
- [ ] Revisar logs en Actions (GitHub)
- [ ] Verificar que compile localmente
- [ ] Re-sincronizar Deployment Center en Azure
- [ ] Push de nuevo

#### ? Error 500 en Azure
- [ ] Ir a Azure Portal ? Log Stream
- [ ] Identificar error específico
- [ ] Usualmente es cadena de conexión incorrecta
- [ ] Verificar que la migración se aplicó

#### ? No aparece Swagger en Azure
- [ ] Verificar `Program.cs`: `app.UseSwagger()` debe estar sin `if (Development)`
- [ ] Reiniciar Web App en Azure
- [ ] Esperar 1-2 minutos
- [ ] Limpiar caché (Ctrl + Shift + R)

---

## ?? TIEMPO ESTIMADO TOTAL

| Fase | Tiempo |
|------|--------|
| Lectura y planificación | 5 min |
| Modelo y BD | 10 min |
| Controlador | 10 min |
| Testing local | 5 min |
| Deployment | 5 min |
| Verificación Azure | 5 min |
| Documentación | 5 min |
| **TOTAL** | **45 min** |
| Buffer para imprevistos | 15 min |
| **TOTAL CON BUFFER** | **60 min** |

---

## ?? OBJETIVOS MÍNIMOS PARA APROBAR

- [ ] ? Modelo con propiedades correctas
- [ ] ? Migración aplicada (tabla en Azure SQL)
- [ ] ? CRUD completo funcionando
- [ ] ? API desplegada en Azure
- [ ] ? Swagger accesible públicamente
- [ ] ? GET y POST funcionando al 100%

## ?? OBJETIVOS EXTRAS (Puntos adicionales)

- [ ] ? PUT y DELETE funcionando
- [ ] ? Validaciones con Data Annotations
- [ ] ? Manejo de errores personalizado
- [ ] ? Documentación completa en README
- [ ] ? Código limpio y comentado
- [ ] ? Respuestas HTTP correctas (200, 201, 204, 400, 404)

---

## ?? CONTACTOS DE EMERGENCIA

- **Profesor**: [Nombre y email]
- **Compañero 1**: [Nombre y contacto]
- **Compañero 2**: [Nombre y contacto]
- **Soporte Azure**: https://portal.azure.com (Chat en vivo)

---

## ?? BACKUP

### Si Azure falla completamente:
- [ ] Tener el proyecto corriendo localmente
- [ ] Hacer video/captura de pantalla de Swagger local
- [ ] Mostrar código al profesor
- [ ] Explicar que Azure tuvo problemas técnicos

---

**?? ¡CON ESTA PREPARACIÓN, APROBARÁS EL EXAMEN! ??**

**Última revisión**: [Fecha de hoy]
**Estado**: ? En preparación / ? Listo para examen
