using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using CapaDatos;
using System.Data;
//fecha= String.Format("25/05/2016","dd/MM/yyyy"),
                //hora = String.Format("25/05/2016", "HH:mm"),
namespace CapaNegocios
{
    public class ConsultaBLL
    {
        public ConsultaBLL()
        {

        }

        public static List<Consulta> GetConsulta()
        {
            CapaDatos.ConsultaDSTableAdapters.ConsultaTableAdapter adapter = new CapaDatos.ConsultaDSTableAdapters.ConsultaTableAdapter();
            ConsultaDS.ConsultaDataTable table = adapter.GetConsulta();

            List<Consulta> list = new List<Consulta>();
            foreach (var row in table)
            {
                Consulta obj = getConsultaFromRow(row);
                list.Add(obj);
            }
            return list;
        }

        public static Consulta getConsultaFromRow(ConsultaDS.ConsultaRow row)
        {
            Consulta obj = new Consulta()
            {

                consultaId = row.atencion_id,
                fechaHora=row.fechaHora,
                observacion = row.observacion,
                diagnostico = row.diagnostico,
                estudio = row.estudio,
                citaId = row.Fk_cita_id
            };
            return obj;
        }

        public static void EliminarConsulta(int consultaId)
        {
            if (consultaId <= 0)
                throw new ArgumentException("El id de la Atencion Consulta no puede ser menor o igual que cero");
            CapaDatos.ConsultaDSTableAdapters.ConsultaTableAdapter adapter = new CapaDatos.ConsultaDSTableAdapters.ConsultaTableAdapter();
            adapter.EliminarConsulta(consultaId);
        }

        public static int InsertarConsulta(Consulta obj)
        {
            if (obj == null)
            {
                throw new ArgumentException("El objeto no puede ser nulo");
            }

            if (string.IsNullOrEmpty(obj.fechaHora))
            {
                throw new ArgumentException("El fecha no puede ser nulo o vacio");
            }
            if (string.IsNullOrEmpty(obj.observacion))
            {
                throw new ArgumentException("El observacion no puede ser nulo o vacio");
            }
            if (string.IsNullOrEmpty(obj.diagnostico))
            {
                throw new ArgumentException("El diagnostico no puede ser nulo o vacio");
            }
            if (string.IsNullOrEmpty(obj.estudio))
            {
                throw new ArgumentException("El estudios no puede ser nulo o vacio");
            }

            if (obj.citaId ==null)
            {
                throw new ArgumentException("El citaId no puede ser nulo o vacio");
            }

            int? id = 0;

            CapaDatos.ConsultaDSTableAdapters.ConsultaTableAdapter adapter = new CapaDatos.ConsultaDSTableAdapters.ConsultaTableAdapter();
            adapter.InsertarConsulta(obj.fechaHora, obj.observacion, obj.diagnostico, obj.estudio, obj.citaId, ref id);

            if (id == null || id <= 0)
                throw new Exception("La llave primaria no se generó correctamente");

            return id.Value;
        }

        public static void ActualizarConsulta(Consulta obj)
        {
            if (obj == null)
            {
                throw new ArgumentException("El objeto no puede ser nulo");
            }

            if (string.IsNullOrEmpty(obj.fechaHora))
            {
                throw new ArgumentException("El fecha no puede ser nulo o vacio");
            }
            if (string.IsNullOrEmpty(obj.observacion))
            {
                throw new ArgumentException("El observacion no puede ser nulo o vacio");
            }
            if (string.IsNullOrEmpty(obj.diagnostico))
            {
                throw new ArgumentException("El diagnostico no puede ser nulo o vacio");
            }
            if (string.IsNullOrEmpty(obj.estudio))
            {
                throw new ArgumentException("El estudios no puede ser nulo o vacio");
            }
            if (obj.citaId==null)
            {
                throw new ArgumentException("El citaId no puede ser nulo o vacio");
            }

            CapaDatos.ConsultaDSTableAdapters.ConsultaTableAdapter adapter = new CapaDatos.ConsultaDSTableAdapters.ConsultaTableAdapter();
            adapter.ActualizarConsulta(obj.fechaHora,obj.observacion, obj.diagnostico, obj.estudio, obj.citaId, obj.consultaId);
        }

        public static Consulta GetConsultaById(int consultaId)
        {
            if (consultaId <= 0)
                throw new ArgumentException("El id del contacto no puede ser menor o igual que cero");
            CapaDatos.ConsultaDSTableAdapters.ConsultaTableAdapter adapter = new CapaDatos.ConsultaDSTableAdapters.ConsultaTableAdapter();
            ConsultaDS.ConsultaDataTable table = adapter.GetConsultaById(consultaId);
            Consulta obj = getConsultaFromRow(table[0]);
            return obj;
        }

    }
}
