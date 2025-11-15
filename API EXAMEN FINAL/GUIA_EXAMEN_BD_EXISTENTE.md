# ?? GUÍA EXAMEN - ESCENARIO REAL (Base de datos ya existe)

## ?? IMPORTANTE: Este documento asume que te darán una base de datos existente

Si en el examen te dicen:
- "Aquí está la cadena de conexión..."
- "La tabla Productos ya existe..."
- "Conecta tu API a esta base de datos..."

Entonces **sigue esta guía** (más corta y directa).

---

## ?? PREPARACIÓN ANTES DEL EXAMEN

### 1?? CREAR REPOSITORIO EN GITHUB

1. Ve a https://github.com/new
2. Crea repositorio:
   - Nombre: `api-examen-final`
   - Private
   - NO agregues README ni .gitignore
3. Clic en **Create repository**

---

### 2?? SUBIR CÓDIGO A GITHUB (PRIMERA VEZ)

```bash
# En la terminal de Visual Studio
cd "API EXAMEN FINAL"

# Inicializar Git
git init
git config user.name "Tu Nombre"
git config user.email "tu@email.com"

# Agregar archivos
git add .
git commit -m "Setup inicial"

# Conectar con GitHub (CAMBIA TU-USUARIO)
git remote add origin https://github.com/TU-USUARIO/api-examen-final.git
git branch -M main
git push -u origin main
```

---

### 3?? CREAR WEB APP EN AZURE (Solo para la API)

1. Ve a https://portal.azure.com
2. Busca **"App Services"** ? **+ Create** ? **Web App**
3. Configuración:
   - **Resource Group**: Crea nuevo ? `rg-examen-final`
   - **Name**: `api-examen-tunombre` (único globalmente)
   - **Publish**: Code
   - **Runtime stack**: .NET 8 (LTS)
   - **Operating System**: Windows
   - **Region**: East US
   - **Plan**: Free F1 o Basic B1
4. **Review + create** ? **Create**

---

### 4?? CONFIGURAR AUTO-DEPLOYMENT

1. Ve a tu Web App: `api-examen-tunombre`
2. **Deployment** ? **Deployment Center**
3. **Source**: GitHub
4. Autoriza y selecciona:
   - Repository: `api-examen-final`
   - Branch: `main`
5. **Save**

---

### 5?? VERIFICAR QUE FUNCIONA

1. Espera 3-5 minutos (primer deployment)
2. Ve a: `https://api-examen-tunombre.azurewebsites.net/swagger`
3. Deberías ver Swagger con los endpoints de ejemplo

---

## ?? DURANTE EL EXAMEN

### ?? PASO 1: LEE TODO EL EXAMEN

Identifica:
- ? Nombre de la entidad (Producto, Cliente, Libro, etc.)
- ? Propiedades requeridas
- ? **Cadena de conexión** que te dan
- ? Nombre de la tabla existente

---

### ?? PASO 2: CONFIGURA LA CONEXIÓN

**Te darán algo como:**
```
Server=sql-profesor.database.windows.net;
Database=ExamenDB;
User Id=estudiante;
Password=Pass123;
```

**Edita `appsettings.json`:**
```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=tcp:sql-profesor.database.windows.net,1433;Initial Catalog=ExamenDB;User ID=estudiante;Password=Pass123;MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;"
  }
}
```

?? **IMPORTANTE**: Copia **exactamente** lo que te den, solo asegúrate de tener:
- `MultipleActiveResultSets=True`
- `Encrypt=True`

---

### ?? PASO 3: CREA TU MODELO

**Ejemplo**: Si la tabla se llama "Productos"

```csharp
// Models/Producto.cs
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace API_EXAMEN_FINAL.Models
{
    [Table("Productos")] // Nombre EXACTO de la tabla en la BD
    public class Producto
    {
        public int Id { get; set; }
        
        [Required]
        [StringLength(100)]
        public string Nombre { get; set; } = string.Empty;
        
        [Column("Description")] // Si la columna tiene otro nombre
        public string Descripcion { get; set; } = string.Empty;
        
        [Range(0.01, 999999.99)]
        public decimal Precio { get; set; }
        
        [Range(0, int.MaxValue)]
        public int Stock { get; set; }
    }
}
```

?? **TIPS:**
- Si el nombre de la columna en BD es diferente, usa `[Column("NombreReal")]`
- Si la tabla tiene otro nombre, usa `[Table("NombreReal")]`
- Los tipos deben coincidir: `int`, `string`, `decimal`, `DateTime`, `bool`

---

### ??? PASO 4: ACTUALIZA EL DbContext

```csharp
// Data/ApplicationDbContext.cs
public DbSet<Producto> Productos { get; set; }

// Si necesitas mapear nombres diferentes:
protected override void OnModelCreating(ModelBuilder modelBuilder)
{
    modelBuilder.Entity<Producto>()
        .ToTable("Productos"); // Nombre tabla en BD
    
    // Si hay columnas con nombres diferentes:
    modelBuilder.Entity<Producto>()
        .Property(p => p.Descripcion)
        .HasColumnName("Description");
}
```

---

### ?? PASO 5: CREA/ACTUALIZA EL CONTROLADOR

Renombra `ItemsController.cs` ? `ProductosController.cs`

```csharp
[Route("api/[controller]")]
[ApiController]
public class ProductosController : ControllerBase
{
    private readonly ApplicationDbContext _context;

    public ProductosController(ApplicationDbContext context)
    {
        _context = context;
    }

    // GET: api/Productos
    [HttpGet]
    public async Task<ActionResult<IEnumerable<Producto>>> GetProductos()
    {
        return await _context.Productos.ToListAsync();
    }

    // GET: api/Productos/5
    [HttpGet("{id}")]
    public async Task<ActionResult<Producto>> GetProducto(int id)
    {
        var producto = await _context.Productos.FindAsync(id);
        if (producto == null) return NotFound();
        return producto;
    }

    // POST: api/Productos
    [HttpPost]
    public async Task<ActionResult<Producto>> PostProducto(Producto producto)
    {
        _context.Productos.Add(producto);
        await _context.SaveChangesAsync();
        return CreatedAtAction(nameof(GetProducto), new { id = producto.Id }, producto);
    }

    // PUT: api/Productos/5
    [HttpPut("{id}")]
    public async Task<IActionResult> PutProducto(int id, Producto producto)
    {
        if (id != producto.Id) return BadRequest();
        _context.Entry(producto).State = EntityState.Modified;
        
        try {
            await _context.SaveChangesAsync();
        }
        catch (DbUpdateConcurrencyException) {
            if (!_context.Productos.Any(e => e.Id == id))
                return NotFound();
            throw;
        }
        return NoContent();
    }

    // DELETE: api/Productos/5
    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteProducto(int id)
    {
        var producto = await _context.Productos.FindAsync(id);
        if (producto == null) return NotFound();
        
        _context.Productos.Remove(producto);
        await _context.SaveChangesAsync();
        return NoContent();
    }
}
```

---

### ?? PASO 6: PRUEBA LOCAL

**?? NO HAGAS MIGRACIONES** (la tabla ya existe)

```bash
# Solo ejecuta:
dotnet build
dotnet run
# O presiona F5
```

Ve a: `https://localhost:XXXX/swagger`

**Prueba:**
1. GET `/api/Productos` ? Debería mostrar datos existentes
2. POST ? Crea un nuevo producto
3. GET por ID ? Ve el que creaste
4. PUT ? Actualiza
5. DELETE ? Elimina

---

### ?? PASO 7: SUBE A GITHUB (y Azure automáticamente)

```bash
git add .
git commit -m "Implementar API Productos - Examen Final"
git push
```

---

### ?? PASO 8: ESPERA EL DEPLOYMENT

1. Ve a GitHub ? Actions
2. Espera el check verde ? (2-3 minutos)

---

### ? PASO 9: VERIFICA EN AZURE

1. Ve a: `https://api-examen-tunombre.azurewebsites.net/swagger`
2. Prueba TODOS los endpoints
3. Verifica que se conecte a la BD y muestre datos

---

### ?? PASO 10: ENTREGA

Proporciona al profesor:
- ? URL de Swagger: `https://api-examen-tunombre.azurewebsites.net/swagger`
- ? URL de GitHub: `https://github.com/tu-usuario/api-examen-final`

---

## ?? TROUBLESHOOTING

### Error: "Cannot open database"
- Verifica la cadena de conexión (copia exacta)
- Verifica usuario y password
- Verifica que tienes permisos en la BD

### Error: "Invalid column name"
- Los nombres en tu modelo no coinciden con la BD
- Usa `[Column("NombreReal")]` para mapear

### Error: "Table does not exist"
- Verifica el nombre con `[Table("NombreReal")]`
- Pregunta al profesor el nombre exacto

### Error: "Login failed for user"
- Usuario o password incorrecto
- Verifica la cadena de conexión

---

## ?? CHECKLIST EXAMEN

Antes de entregar:
- [ ] ? Compila sin errores
- [ ] ? Funciona localmente (F5)
- [ ] ? GET muestra datos existentes de la BD
- [ ] ? POST crea nuevos registros
- [ ] ? Código en GitHub
- [ ] ? GitHub Actions exitoso (?)
- [ ] ? Swagger funciona en Azure
- [ ] ? API en Azure se conecta a la BD
- [ ] ? CRUD completo funcional

---

## ?? TIEMPO ESTIMADO

| Fase | Tiempo |
|------|--------|
| Leer examen | 3 min |
| Configurar conexión | 2 min |
| Crear modelo | 5 min |
| Actualizar controlador | 10 min |
| Probar local | 5 min |
| Git push | 2 min |
| Esperar deployment | 3 min |
| Verificar Azure | 5 min |
| **TOTAL** | **35 min** |
| Buffer | 10 min |
| **Total con buffer** | **45 min** |

---

## ?? TIPS FINALES

1. **No hagas migraciones** si la tabla ya existe
2. **Copia exactamente** la cadena de conexión que te den
3. **Verifica nombres** de tablas y columnas
4. **Usa anotaciones** `[Table]` y `[Column]` si es necesario
5. **Prueba local primero** antes de subir
6. **Git push frecuente** después de cada funcionalidad

---

**?? ¡ÉXITO EN TU EXAMEN! ??**
