using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace API_EXAMEN_FINAL.Models
{
    [Table("Chat_Mensaje", Schema = "dbo")]
    public class ChatMensaje
    {
        [Key]
        [Column("ID_Mensaje")]
        public int IdMensaje { get; set; }  

        [Column("Cod_Sala")]
        public int CodSala { get; set; } 

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
