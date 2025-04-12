using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Entidades;
using Negocio;

namespace Vistas.Admin.Clientes
{
    public partial class ListarClientes : Admin
    {
        private NegocioClientes _negocio = new NegocioClientes();
        static private DataTable _tablaInicial;
        static private DataTable _tabla;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                _tablaInicial = _negocio.ObtenerClientes();
                _tabla = _tablaInicial.Copy();

                gvClientes.DataSource = _tablaInicial;
                gvClientes.DataBind();

                VerUsuarioConectado();
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string dni = txtBuscar.Text.Trim();
            DataView dv = new DataView(_tablaInicial)
            {
                RowFilter = $"DNI = {dni}"
            };

            _tabla = dni.Length > 0 ? dv.ToTable() : _tablaInicial.Copy();

            gvClientes.DataSource = _tabla;
            gvClientes.DataBind();
        }

        private void VerUsuarioConectado()
        {
            var datos = (Usuario)Session["Datos"];
            lblCuentaIngresada.Text = datos.Alias;
        }

        protected void gdvClientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvClientes.PageIndex = e.NewPageIndex;

            gvClientes.DataSource = _tabla;
            gvClientes.DataBind();
        }
    }
}