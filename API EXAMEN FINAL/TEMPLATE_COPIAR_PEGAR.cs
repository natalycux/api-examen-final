// ========================================
// ?? TEMPLATE RÁPIDO PARA COPIAR/PEGAR
// ========================================

// 1?? EJEMPLO DE MODELO (Models/NombreModelo.cs)
// Copia esto y ajusta según el examen:
/*
namespace API_EXAMEN_FINAL.Models
{
    public class Producto  // ?? CAMBIAR nombre
    {
        public int Id { get; set; }
        public string Nombre { get; set; } = string.Empty;
        public string Descripcion { get; set; } = string.Empty;
        public decimal Precio { get; set; }
        public int Stock { get; set; }
        public DateTime FechaCreacion { get; set; }
        public bool Activo { get; set; }
        
        // Agregar más propiedades según necesites
    }
}
*/

// 2?? ACTUALIZAR DBCONTEXT (Data/ApplicationDbContext.cs)
// Reemplaza el DbSet<Item> por:
/*
public DbSet<Producto> Productos { get; set; }  // ?? Ajustar nombre
*/

// Si el nombre de la tabla es diferente:
/*
protected override void OnModelCreating(ModelBuilder modelBuilder)
{
    base.OnModelCreating(modelBuilder);
    modelBuilder.Entity<Producto>().ToTable("NombreTablaReal");  // ?? Nombre real de la tabla
}
*/

// 3?? CADENA DE CONEXIÓN (appsettings.json)
// Reemplaza los valores:
/*
"ConnectionStrings": {
    "DefaultConnection": "Server=TU_SERVIDOR;Database=TU_BASE_DATOS;User Id=TU_USUARIO;Password=TU_PASSWORD;MultipleActiveResultSets=True;TrustServerCertificate=True"
}
*/

// 4?? CONTROLADOR - BÚSQUEDA Y REEMPLAZO
// En ItemsController.cs, usa "Buscar y Reemplazar" (Ctrl+H):
// 
// Buscar:         Item
// Reemplazar por: Producto  (o el nombre que necesites)
//
// Buscar:         Items
// Reemplazar por: Productos (o el plural que necesites)
//
// ?? No olvides renombrar también:
// - El nombre de la clase: ItemsController ? ProductosController
// - La ruta: [Route("api/[controller]")] ? [Route("api/Productos")]

// 5?? ANOTACIONES ÚTILES SI LAS NECESITAS
// Usar sobre las propiedades del modelo:
/*
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

public class Producto
{
    [Key]  // Si el campo clave no se llama "Id"
    public int ProductoId { get; set; }
    
    [Required]  // Campo obligatorio
    [StringLength(100)]  // Longitud máxima
    public string Nombre { get; set; } = string.Empty;
    
    [Column("PrecioUnitario")]  // Si el nombre en la BD es diferente
    public decimal Precio { get; set; }
    
    [Table("TblProductos")]  // Si el nombre de la tabla es diferente
}
*/

// 6?? COMANDOS DE MIGRACIÓN (Solo si necesitas crear la tabla)
// Ejecutar en "Consola del Administrador de Paquetes":
/*
Add-Migration NombreMigracion
Update-Database
*/

// 7?? COMANDOS GIT
/*
git init
git add .
git commit -m "API Examen Final - [TuNombre]"
git branch -M main
git remote add origin https://github.com/TU_USUARIO/TU_REPO.git
git push -u origin main
*/

// ========================================
// ?? PROCESO COMPLETO PASO A PASO
// ========================================
/*
1. Abre appsettings.json ? Actualiza ConnectionString
2. Renombra Models/Item.cs ? Ajusta propiedades
3. Actualiza Data/ApplicationDbContext.cs ? Cambia DbSet
4. Renombra Controllers/ItemsController.cs ? Buscar/Reemplazar nombres
5. Presiona F5 ? Prueba en https://localhost:7209/swagger
6. Git: init ? add ? commit ? push
7. Clic derecho en proyecto ? Publicar ? Azure App Service
8. Verifica: https://TU_APP.azurewebsites.net/swagger
9. Entrega la URL de Swagger
*/
