﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaNegocios;
using CapaDatos;
using System.Data;
namespace CapaPresentacions
{
    public partial class ListaAtencionConsultas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e){

          if (!IsPostBack)
                CargarLista();
        }
        private void CargarLista()
        {
            try
            {
                List<Consulta> consulta = ConsultaBLL.GetConsulta();
                MinuevaTabla.DataSource = consulta;
                MinuevaTabla.DataBind();
            }
            catch (Exception ex)
            {

            }
        }


        protected void MinuevaTabla_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Eliminar")
            {
                try
                {
                    int consultaId = Convert.ToInt32(e.CommandArgument);
                    ConsultaBLL.EliminarConsulta(consultaId);
                    CargarLista();
                }
                catch (Exception ex)
                {

                }
            }

            if (e.CommandName == "Editar")
            {
                Response.Redirect("~/FormularioConsulta.aspx?id=" + e.CommandArgument.ToString());
            }
        }
    }
}