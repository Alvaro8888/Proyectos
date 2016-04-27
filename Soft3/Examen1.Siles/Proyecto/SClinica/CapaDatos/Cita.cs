using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    
    public class Cita
    {
        public int citaId { get; set; }
        public string fechaHora { get; set; }
        public string observacion { get; set; }
        public int doctorId { get; set; }
        public int pacienteid { get; set; }
        public int usuarioId { get; set; }
        public Cita() { }



    }
}
