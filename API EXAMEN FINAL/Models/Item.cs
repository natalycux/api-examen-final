namespace API_EXAMEN_FINAL.Models
{
    /// <summary>
    /// Modelo de ejemplo - RENOMBRAR según las especificaciones del examen
    /// Ejemplo: Si el examen pide "Productos", renombra esta clase a "Producto"
    /// </summary>
    public class Item
    {
        // Clave primaria - mantén el nombre "Id" o ajusta según el examen
        public int Id { get; set; }

        // Propiedad de ejemplo 1 - renombrar según necesites
        public string Nombre { get; set; } = string.Empty;

        // Propiedad de ejemplo 2 - renombrar según necesites
        public string Descripcion { get; set; } = string.Empty;

        // ?? AGREGAR MÁS PROPIEDADES SEGÚN EL EXAMEN
        // Ejemplos comunes:
        // public decimal Precio { get; set; }
        // public int Cantidad { get; set; }
        // public DateTime FechaCreacion { get; set; }
        // public bool Activo { get; set; }
    }
}
