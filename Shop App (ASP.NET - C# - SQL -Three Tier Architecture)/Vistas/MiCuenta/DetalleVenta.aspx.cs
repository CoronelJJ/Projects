using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace Vistas.MiCuenta
{
    public partial class DetalleVenta : Index
    {
        private int IDVenta;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["id"] != null) { 
                    IDVenta = Convert.ToInt32(Request.QueryString["id"]);
                    NegocioClientes negocio = new NegocioClientes();
                    Cliente cliente = (Cliente)Session["Datos"];
                    gvDetalleVenta.DataSource = negocio.ObtenerDetalleVenta(cliente, IDVenta);
                    gvDetalleVenta.DataBind();
                }
            }

        }         
    }
}