using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace API_EXAMEN_FINAL.Models
{
    [Table("Chat_Mensaje", Schema = "dbo")]
    public class ChatMensaje
    {
        [Key]
        [Column("ID_Mensaje")]
        public long IdMensaje { get; set; }  // Cambiado a long

        [Column("Cod_Sala")]
        public long CodSala { get; set; }  // Cambiado a long

        [Column("Login_Emisor")]
        [StringLength(50)]
        public string LoginEmisor { get; set; } = string.Empty;

        [Column("Contenido")]
        [StringLength(500)]
        public string Contenido { get; set; } = string.Empty;

        [Column("Fecha_Envio")]
        public DateTime FechaEnvio { get; set; }

        [Column("Estado")]
        [StringLength(1)]
        public string Estado { get; set; } = string.Empty;
    }
}
