using Microsoft.EntityFrameworkCore;
using API_EXAMEN_FINAL.Models;

namespace API_EXAMEN_FINAL.Data
{
    /// <summary>
    /// Contexto de base de datos - ApplicationDbContext
    /// ?? IMPORTANTE: El día del examen, ajusta el nombre del DbSet según la tabla que te pidan
    /// </summary>
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        // ?? Define el DbSet para la tabla
        // Si el examen pide "Productos", cambia a: public DbSet<Producto> Productos { get; set; }
        public DbSet<Item> Items { get; set; }

        // ?? Si necesitas más tablas, agrégalas aquí:
        // public DbSet<OtraTabla> OtraTablas { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // ?? Configuración adicional si es necesaria
            // Por ejemplo, especificar el nombre de la tabla si difiere del DbSet:
            // modelBuilder.Entity<Item>().ToTable("NombreTablaReal");
        }
    }
}
