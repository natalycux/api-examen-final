using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using API_EXAMEN_FINAL.Data;
using API_EXAMEN_FINAL.Models;

namespace API_EXAMEN_FINAL.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MensajesController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public MensajesController(ApplicationDbContext context)
        {
            _context = context;
        }

        /// <summary>
        /// GET: api/Mensajes
        /// Obtiene todos los mensajes ordenados cronológicamente (más recientes primero)
        /// </summary>
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ChatMensaje>>> GetMensajes()
        {
            try
            {
                var mensajes = await _context.ChatMensajes
                    .OrderByDescending(m => m.FechaEnvio)  // Más recientes primero
                    .ToListAsync();

                return Ok(mensajes);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { 
                    error = "Error al obtener los mensajes",
                    detalle = ex.Message 
                });
            }
        }

        /// <summary>
        /// GET: api/Mensajes/5
        /// Obtiene un mensaje específico por ID
        /// </summary>
        [HttpGet("{id}")]
        public async Task<ActionResult<ChatMensaje>> GetMensaje(long id)
        {
            try
            {
                var mensaje = await _context.ChatMensajes.FindAsync(id);

                if (mensaje == null)
                {
                    return NotFound(new { error = "Mensaje no encontrado" });
                }

                return Ok(mensaje);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { 
                    error = "Error al obtener el mensaje",
                    detalle = ex.Message 
                });
            }
        }

        /// <summary>
        /// GET: api/Mensajes/sala/0
        /// Obtiene mensajes de una sala específica
        /// </summary>
        [HttpGet("sala/{codSala}")]
        public async Task<ActionResult<IEnumerable<ChatMensaje>>> GetMensajesPorSala(long codSala)
        {
            try
            {
                var mensajes = await _context.ChatMensajes
                    .Where(m => m.CodSala == codSala)
                    .OrderByDescending(m => m.FechaEnvio)
                    .ToListAsync();

                return Ok(mensajes);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { 
                    error = "Error al obtener mensajes de la sala",
                    detalle = ex.Message 
                });
            }
        }

        /// <summary>
        /// GET: api/Mensajes/recientes/10
        /// Obtiene los últimos N mensajes
        /// </summary>
        [HttpGet("recientes/{cantidad}")]
        public async Task<ActionResult<IEnumerable<ChatMensaje>>> GetMensajesRecientes(int cantidad = 10)
        {
            try
            {
                var mensajes = await _context.ChatMensajes
                    .OrderByDescending(m => m.FechaEnvio)
                    .Take(cantidad)
                    .ToListAsync();

                return Ok(mensajes);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { 
                    error = "Error al obtener mensajes recientes",
                    detalle = ex.Message 
                });
            }
        }
    }
}
