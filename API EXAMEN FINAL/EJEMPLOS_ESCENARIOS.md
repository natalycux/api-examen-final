# ?? EJEMPLOS DE ADAPTACIÓN SEGÚN DIFERENTES ESCENARIOS DE EXAMEN

## ESCENARIO 1: Te piden una API de PRODUCTOS

### Paso 1: Crear el modelo (Models/Producto.cs)
```csharp
namespace API_EXAMEN_FINAL.Models
{
    public class Producto
    {
        public int Id { get; set; }
        public string Nombre { get; set; } = string.Empty;
        public string Descripcion { get; set; } = string.Empty;
        public decimal Precio { get; set; }
        public int Stock { get; set; }
    }
}
```

### Paso 2: Actualizar DbContext
```csharp
public DbSet<Producto> Productos { get; set; }
```

### Paso 3: Renombrar controlador a ProductosController
- Buscar: `Item` ? Reemplazar: `Producto`
- Buscar: `Items` ? Reemplazar: `Productos`

---

## ESCENARIO 2: Te piden una API de CLIENTES

### Paso 1: Crear el modelo (Models/Cliente.cs)
```csharp
namespace API_EXAMEN_FINAL.Models
{
    public class Cliente
    {
        public int Id { get; set; }
        public string Nombre { get; set; } = string.Empty;
        public string Apellido { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string Telefono { get; set; } = string.Empty;
    }
}
```

### Paso 2: Actualizar DbContext
```csharp
public DbSet<Cliente> Clientes { get; set; }
```

---

## ESCENARIO 3: Te piden una API de EMPLEADOS

### Paso 1: Crear el modelo (Models/Empleado.cs)
```csharp
namespace API_EXAMEN_FINAL.Models
{
    public class Empleado
    {
        public int Id { get; set; }
        public string Nombre { get; set; } = string.Empty;
        public string Puesto { get; set; } = string.Empty;
        public decimal Salario { get; set; }
        public DateTime FechaContratacion { get; set; }
    }
}
```

---

## ESCENARIO 4: La tabla ya existe con nombre diferente

Si la tabla se llama "TblProductos" pero tu modelo es "Producto":

```csharp
// En ApplicationDbContext.cs
protected override void OnModelCreating(ModelBuilder modelBuilder)
{
    base.OnModelCreating(modelBuilder);
    modelBuilder.Entity<Producto>().ToTable("TblProductos");
}
```

---

## ESCENARIO 5: La clave primaria no se llama "Id"

Si la clave primaria se llama "ProductoId" o "ClienteId":

```csharp
using System.ComponentModel.DataAnnotations;

public class Producto
{
    [Key]
    public int ProductoId { get; set; }  // En lugar de "Id"
    public string Nombre { get; set; } = string.Empty;
}
```

---

## ESCENARIO 6: Campos con nombres diferentes en la BD

Si en la base de datos la columna se llama "Nombre_Producto" pero en tu modelo quieres "Nombre":

```csharp
using System.ComponentModel.DataAnnotations.Schema;

public class Producto
{
    public int Id { get; set; }
    
    [Column("Nombre_Producto")]
    public string Nombre { get; set; } = string.Empty;
}
```

---

## ESCENARIO 7: Múltiples tablas

Si necesitas trabajar con Productos Y Categorías:

### Models/Categoria.cs
```csharp
public class Categoria
{
    public int Id { get; set; }
    public string Nombre { get; set; } = string.Empty;
}
```

### Actualizar DbContext
```csharp
public DbSet<Producto> Productos { get; set; }
public DbSet<Categoria> Categorias { get; set; }
```

### Crear CategoriasController.cs
Copia ItemsController.cs y renombra todo lo relacionado a Categoria.

---

## ESCENARIO 8: Conexión con servidor Azure específico

Ejemplo con el servidor que mencionaste:

```json
"ConnectionStrings": {
    "DefaultConnection": "Server=svr-sql-ctezo.southcentralus.cloudapp.azure.com;Database=db_DesaWebDevUMG;User Id=usr_DesaWebDevUMG;Password=!ngGuast@360;MultipleActiveResultSets=True;TrustServerCertificate=True"
}
```

---

## ? ATAJOS DE TECLADO ÚTILES EN VISUAL STUDIO

- **F5**: Ejecutar con depuración
- **Ctrl + F5**: Ejecutar sin depuración
- **Ctrl + H**: Buscar y reemplazar
- **Ctrl + Shift + B**: Compilar solución
- **F2**: Renombrar símbolo (renombra en todos los archivos)
- **Ctrl + .**: Menú de acciones rápidas (agregar usings, etc.)

---

## ?? PROBAR EN SWAGGER

Una vez ejecutes la API (F5), Swagger se abrirá en:
```
https://localhost:7209/swagger
```

### Orden de pruebas recomendado:

1. **POST** - Crear 2-3 registros nuevos
2. **GET (todos)** - Verificar que aparecen
3. **GET (por ID)** - Buscar uno específico
4. **PUT** - Actualizar uno de los registros
5. **DELETE** - Eliminar uno de los registros
6. **GET (todos)** - Confirmar que se eliminó

---

## ?? PUBLICAR A AZURE - PASOS DETALLADOS

1. **Clic derecho en el proyecto** ? Publicar...
2. Seleccionar **Azure**
3. Seleccionar **Azure App Service (Windows)**
4. **Crear nuevo**:
   - Nombre: `tu-nombre-api-examen-2025`
   - Suscripción: (tu suscripción de Azure)
   - Grupo de recursos: Crear nuevo o usar existente
   - Plan de hospedaje: Crear nuevo (puedes usar Free F1)
   - Ubicación: East US, West US, etc.
5. Clic en **Crear**
6. Clic en **Publicar**
7. Esperar a que termine
8. Se abrirá automáticamente: `https://tu-nombre-api-examen-2025.azurewebsites.net`
9. Agregar `/swagger` al final de la URL

---

## ? CHECKLIST FINAL

Antes de entregar, verifica:

- [ ] La API funciona localmente en Swagger
- [ ] Probaste las 5 operaciones CRUD
- [ ] La cadena de conexión es correcta
- [ ] El código está en GitHub
- [ ] La API está publicada en Azure
- [ ] La URL de Swagger funciona: `https://TU_APP.azurewebsites.net/swagger`
- [ ] Todas las operaciones funcionan en Azure (no solo localmente)

---

¡Listo! Con estos ejemplos puedes adaptarte rápidamente a lo que te pidan en el examen. ??
