using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using API_EXAMEN_FINAL.Data;
using API_EXAMEN_FINAL.Models;

namespace API_EXAMEN_FINAL.Controllers
{
    /// <summary>
    /// Controlador CRUD para Items
    /// ?? RENOMBRAR el día del examen según la entidad requerida
    /// Ejemplo: Si piden "Productos", renombra a "ProductosController"
    /// y cambia [Route("api/[controller]")] o ponlo explícito: [Route("api/Productos")]
    /// </summary>
    [Route("api/[controller]")]
    [ApiController]
    public class ItemsController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public ItemsController(ApplicationDbContext context)
        {
            _context = context;
        }

        // ?? GET: api/Items - Obtener todos los registros
        /// <summary>
        /// Obtiene todos los Items de la base de datos
        /// </summary>
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Item>>> GetItems()
        {
            try
            {
                return await _context.Items.ToListAsync();
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error al obtener los datos: {ex.Message}");
            }
        }

        // ?? GET: api/Items/5 - Obtener un registro por ID
        /// <summary>
        /// Obtiene un Item específico por su ID
        /// </summary>
        [HttpGet("{id}")]
        public async Task<ActionResult<Item>> GetItem(int id)
        {
            try
            {
                var item = await _context.Items.FindAsync(id);

                if (item == null)
                {
                    return NotFound($"Item con ID {id} no encontrado.");
                }

                return item;
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error al obtener el dato: {ex.Message}");
            }
        }

        // ?? POST: api/Items - Crear un nuevo registro
        /// <summary>
        /// Crea un nuevo Item en la base de datos
        /// </summary>
        [HttpPost]
        public async Task<ActionResult<Item>> PostItem(Item item)
        {
            try
            {
                _context.Items.Add(item);
                await _context.SaveChangesAsync();

                return CreatedAtAction(nameof(GetItem), new { id = item.Id }, item);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error al crear el registro: {ex.Message}");
            }
        }

        // ?? PUT: api/Items/5 - Actualizar un registro existente
        /// <summary>
        /// Actualiza un Item existente
        /// </summary>
        [HttpPut("{id}")]
        public async Task<IActionResult> PutItem(int id, Item item)
        {
            if (id != item.Id)
            {
                return BadRequest("El ID de la ruta no coincide con el ID del objeto.");
            }

            _context.Entry(item).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ItemExists(id))
                {
                    return NotFound($"Item con ID {id} no encontrado.");
                }
                else
                {
                    throw;
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error al actualizar el registro: {ex.Message}");
            }

            return NoContent(); // 204: Actualización exitosa
        }

        // ?? DELETE: api/Items/5 - Eliminar un registro
        /// <summary>
        /// Elimina un Item de la base de datos
        /// </summary>
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteItem(int id)
        {
            try
            {
                var item = await _context.Items.FindAsync(id);
                if (item == null)
                {
                    return NotFound($"Item con ID {id} no encontrado.");
                }

                _context.Items.Remove(item);
                await _context.SaveChangesAsync();

                return NoContent(); // 204: Eliminación exitosa
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Error al eliminar el registro: {ex.Message}");
            }
        }

        // Método auxiliar para verificar si existe un Item
        private bool ItemExists(int id)
        {
            return _context.Items.Any(e => e.Id == id);
        }
    }
}
