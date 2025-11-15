# ?? API EXAMEN FINAL - PLANTILLA PREPARADA

Esta es una plantilla de API REST en ASP.NET Core 8 preparada para que en tu examen **solo necesites editar el código** según las especificaciones que te den.

## ?? TODO ESTÁ LISTO

? **Estructura del proyecto** configurada  
? **Entity Framework Core** con SQL Server  
? **CRUD completo** implementado como ejemplo  
? **Swagger** habilitado en todos los entornos  
? **Azure SQL Database** lista para usar  
? **Azure Web App** configurada  
? **GitHub Actions** para deployment automático  
? **Documentación completa** paso a paso

---

## ?? CÓMO USAR ESTA PLANTILLA EN EL EXAMEN

### Antes del examen (HACER HOY):
1. Lee **`GUIA_EXAMEN_PASO_A_PASO.md`** - Configuración completa de Azure y GitHub
2. Marca **`CHECKLIST_EXAMEN.md`** - Verifica que todo esté listo
3. Familiarízate con **`COMANDOS_RAPIDOS.md`** - Comandos que usarás

### Durante el examen (45 minutos):
1. Lee las especificaciones del examen
2. Renombra `Item.cs` al modelo que te pidan (ej: `Producto.cs`)
3. Actualiza propiedades según el examen
4. Actualiza `DbContext` y el controlador
5. Ejecuta el script: `.\deploy-examen.ps1 -NombreEntidad "Producto"`
6. ¡Listo! Tu API está en Azure

### Referencia durante el examen:
- **`REFERENCIA_RAPIDA_VISUAL.md`** - Flujo visual de trabajo
- **`COMANDOS_RAPIDOS.md`** - Comandos esenciales

---

## ?? ESTRUCTURA DEL PROYECTO

```
API EXAMEN FINAL/
?
??? Controllers/
?   ??? ItemsController.cs          ? RENOMBRAR según examen
?   ??? WeatherForecastController.cs (ejemplo, puedes eliminar)
?
??? Models/
?   ??? Item.cs                     ? RENOMBRAR y editar propiedades
?
??? Data/
?   ??? ApplicationDbContext.cs     ? Actualizar DbSet
?
??? appsettings.json                ? Cadena de conexión Azure
??? Program.cs                      ? Configuración de la app
?
??? GUIA_EXAMEN_PASO_A_PASO.md     ? ?? GUÍA COMPLETA
??? CHECKLIST_EXAMEN.md            ? ? Lista de verificación
??? COMANDOS_RAPIDOS.md            ? ? Comandos esenciales
??? REFERENCIA_RAPIDA_VISUAL.md    ? ?? Flujo visual
??? AZURE_DEPLOYMENT_INFO.md       ? ?? Info de Azure
??? EJEMPLOS_ESCENARIOS.md         ? ?? Ejemplos prácticos
?
??? preparar-examen.ps1            ? Script de preparación
??? deploy-examen.ps1              ? Script para el examen
```

---

## ??? TECNOLOGÍAS

- **Framework**: ASP.NET Core 8.0
- **ORM**: Entity Framework Core
- **Base de Datos**: Azure SQL Database
- **Hosting**: Azure App Service
- **CI/CD**: GitHub Actions
- **Documentación API**: Swagger/OpenAPI

---

## ?? PAQUETES NUGET INCLUIDOS

```xml
<PackageReference Include="Microsoft.EntityFrameworkCore.SqlServer" Version="8.0.0" />
<PackageReference Include="Microsoft.EntityFrameworkCore.Tools" Version="8.0.0" />
<PackageReference Include="Microsoft.EntityFrameworkCore.Design" Version="8.0.0" />
<PackageReference Include="Swashbuckle.AspNetCore" Version="6.5.0" />
```

---

## ?? INICIO RÁPIDO

### 1. Clonar o descargar el repositorio
```bash
git clone https://github.com/TU-USUARIO/api-examen-final.git
cd api-examen-final
```

### 2. Configurar cadena de conexión
Edita `appsettings.json`:
```json
"ConnectionStrings": {
  "DefaultConnection": "Server=tcp:sql-examen-TU-NOMBRE.database.windows.net,1433;..."
}
```

### 3. Aplicar migraciones
```bash
dotnet ef migrations add Inicial
dotnet ef database update
```

### 4. Ejecutar localmente
```bash
dotnet run
```

O presiona **F5** en Visual Studio

### 5. Abrir Swagger
```
https://localhost:XXXX/swagger
```

---

## ?? EJEMPLO: CAMBIAR DE "ITEM" A "PRODUCTO"

### 1. Renombrar archivo
`Models/Item.cs` ? `Models/Producto.cs`

### 2. Editar el modelo
```csharp
public class Producto
{
    public int Id { get; set; }
    public string Nombre { get; set; } = string.Empty;
    public decimal Precio { get; set; }
    public int Stock { get; set; }
}
```

### 3. Actualizar DbContext
```csharp
public DbSet<Producto> Productos { get; set; }
```

### 4. Renombrar controlador
`ItemsController.cs` ? `ProductosController.cs`

Dentro, cambiar:
- `ItemsController` ? `ProductosController`
- `Item` ? `Producto`
- `Items` ? `Productos`

### 5. Migración
```bash
dotnet ef migrations add CrearProductos
dotnet ef database update
```

### 6. Subir a GitHub
```bash
git add .
git commit -m "Implementar API Productos"
git push
```

**¡Automáticamente se despliega a Azure! ??**

---

## ?? DOCUMENTACIÓN COMPLETA

### Para PREPARACIÓN (antes del examen):
1. **`GUIA_EXAMEN_PASO_A_PASO.md`**
   - Configuración de Azure SQL Database
   - Configuración de Azure Web App
   - Conexión con GitHub
   - Primera migración y verificación

2. **`CHECKLIST_EXAMEN.md`**
   - Lista completa de verificación
   - Todo lo que debe estar listo antes del examen
   - Checklist de emergencia

3. **`AZURE_DEPLOYMENT_INFO.md`**
   - Detalles de configuración de Azure
   - Monitoreo y logs
   - Solución de problemas

### Para USO (durante el examen):
4. **`REFERENCIA_RAPIDA_VISUAL.md`**
   - Flujo visual de 45 minutos
   - Plantillas de código
   - Atajos de teclado
   - Troubleshooting rápido

5. **`COMANDOS_RAPIDOS.md`**
   - Todos los comandos esenciales
   - Git, EF Core, dotnet, Azure CLI
   - Secuencia típica en el examen

6. **`EJEMPLOS_ESCENARIOS.md`**
   - Escenarios comunes en exámenes
   - Código completo de ejemplo
   - Casos especiales

---

## ? SCRIPTS AUTOMATIZADOS

### Script de preparación
```powershell
.\preparar-examen.ps1
```
Verifica que todo esté listo: .NET, Git, EF Tools, etc.

### Script para el examen
```powershell
.\deploy-examen.ps1 -NombreEntidad "Producto"
```
Automatiza: build ? migración ? git commit ? push ? deployment

---

## ?? URLS IMPORTANTES

### Desarrollo Local
- Swagger: `https://localhost:[PORT]/swagger`
- API: `https://localhost:[PORT]/api/Items`

### Producción (Azure)
- Swagger: `https://api-examen-[TU-NOMBRE].azurewebsites.net/swagger`
- API: `https://api-examen-[TU-NOMBRE].azurewebsites.net/api/Items`

### Portales
- Azure Portal: https://portal.azure.com
- GitHub: https://github.com/[TU-USUARIO]/api-examen-final
- GitHub Actions: https://github.com/[TU-USUARIO]/api-examen-final/actions

---

## ?? ENDPOINTS DISPONIBLES (Ejemplo con Items)

| Método | Endpoint | Descripción |
|--------|----------|-------------|
| GET | `/api/Items` | Obtener todos los items |
| GET | `/api/Items/{id}` | Obtener un item por ID |
| POST | `/api/Items` | Crear un nuevo item |
| PUT | `/api/Items/{id}` | Actualizar un item existente |
| DELETE | `/api/Items/{id}` | Eliminar un item |

### Ejemplo de request POST:
```json
{
  "nombre": "Laptop",
  "descripcion": "Laptop gaming 16GB RAM"
}
```

---

## ?? SOLUCIÓN DE PROBLEMAS

### Error de migración
```bash
dotnet ef database drop -f
Remove-Item -Recurse -Force .\Migrations
dotnet ef migrations add Inicial
dotnet ef database update
```

### Error de compilación
```bash
dotnet clean
dotnet restore
dotnet build
```

### Error en Azure (Ver logs)
1. Azure Portal ? Tu Web App
2. Monitoring ? Log stream
3. Ve el error en tiempo real

### Más problemas comunes
Consulta **`AZURE_DEPLOYMENT_INFO.md`** sección Troubleshooting

---

## ?? RECURSOS ADICIONALES

- [Documentación oficial ASP.NET Core](https://learn.microsoft.com/aspnet/core)
- [Entity Framework Core](https://learn.microsoft.com/ef/core)
- [Azure App Service](https://learn.microsoft.com/azure/app-service)
- [GitHub Actions](https://docs.github.com/actions)

---

## ? VERIFICACIÓN PRE-EXAMEN

Antes del examen, asegúrate de que:

- [ ] ? El código compila localmente
- [ ] ? Swagger funciona localmente
- [ ] ? La base de datos en Azure está accesible
- [ ] ? La Web App en Azure está corriendo
- [ ] ? GitHub Actions funciona (check verde)
- [ ] ? Swagger funciona en Azure
- [ ] ? Puedes crear y leer datos desde Azure
- [ ] ? Tienes todas las URLs anotadas
- [ ] ? Conoces la ubicación de las guías

---

## ?? FLUJO DEL EXAMEN EN 3 PASOS

```
1. EDITAR CÓDIGO
   ?
2. .\deploy-examen.ps1 -NombreEntidad "TuEntidad"
   ?
3. VERIFICAR EN AZURE
   ?
? ENTREGAR
```

---

## ????? TIPS PARA EL EXAMEN

1. **Lee TODO el examen antes de empezar a codificar**
2. **Prueba localmente primero** (F5) antes de subir a Azure
3. **Usa las plantillas** en REFERENCIA_RAPIDA_VISUAL.md
4. **Commits frecuentes** - sube cada funcionalidad que esté lista
5. **Swagger es tu amigo** - úsalo para probar sin Postman
6. **No entres en pánico** - todo está documentado en las guías
7. **Si algo falla** - revisa TROUBLESHOOTING en las guías

---

## ?? LICENCIA

Este proyecto es una plantilla educativa para exámenes académicos.

---

## ?? AUTOR

**Tu Nombre**
- GitHub: [@tu-usuario](https://github.com/tu-usuario)
- Universidad: [Nombre de tu universidad]
- Carrera: [Tu carrera]
- Semestre: Octavo
- Materia: Desarrollo Web

---

## ?? INFORMACIÓN DEL EXAMEN

- **Asignatura**: Desarrollo Web
- **Tipo**: Examen Final Práctico
- **Objetivo**: Implementar API REST con CRUD completo
- **Tiempo**: 60 minutos (recomendado 45 minutos de desarrollo)
- **Deployment**: Azure + GitHub Actions
- **Entregable**: URL pública de Swagger en Azure

---

**?? ¡LISTO PARA EL EXAMEN! ÉXITO ??**

---

## ?? CONTACTO DE EMERGENCIA

Si tienes problemas técnicos durante el examen:
1. Revisa la sección TROUBLESHOOTING en las guías
2. Consulta con el profesor
3. Usa la versión local como backup

---

**Última actualización**: [Fecha actual]  
**Estado del proyecto**: ? Listo para examen
