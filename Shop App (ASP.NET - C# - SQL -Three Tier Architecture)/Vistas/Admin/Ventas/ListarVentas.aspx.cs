using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Negocio;
using Entidades;

namespace Vistas.Admin.Ventas
{
    public partial class ListarVentas : Admin
    {
        private NegocioVentas _negocio = new NegocioVentas();
        static private DataTable _tablaInicial;
        static private DataTable _tabla;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                _tablaInicial = _negocio.ObtenerVentas();
                _tabla = _tablaInicial.Copy();

                gvVentas.DataSource = _tablaInicial;
                gvVentas.DataBind();
                VerUsuarioConectado();
            }
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            string idVenta = txtIdVenta.Text.Trim();
            string fecha = txtFechaVenta.Text.Trim();
            string dni = txtDniCliente.Text.Trim();
            string articulo = txtArticulo.Text.Trim();

            string filtro = "";

            if (idVenta.Length > 0)
            {
                filtro += $"IDVenta = {idVenta}";
            }

            if (fecha.Length > 0)
            {
                if (filtro.Length > 0)
                {
                    filtro += $" AND ";
                }

                filtro += $"FechaVenta = '{fecha}'";
            }

            if (dni.Length > 0)
            {
                if (filtro.Length > 0)
                {
                    filtro += $" AND ";
                }

                filtro += $"DNI = {dni}";
            }

            if (articulo.Length > 0)
            {
                if (filtro.Length > 0)
                {
                    filtro += $" AND ";
                }

                filtro += $"NombreArticulo LIKE '%{articulo}%'";
            }

            DataView dv = new DataView(_tablaInicial)
            {
                RowFilter = filtro
            };

            _tabla = filtro.Length > 0 ? dv.ToTable() : _tablaInicial.Copy();

            gvVentas.DataSource = _tabla;
            gvVentas.DataBind();
        }

        protected void gvVentas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvVentas.PageIndex = e.NewPageIndex;

            gvVentas.DataSource = _tabla;
            gvVentas.DataBind();
        }

        private void VerUsuarioConectado()
        {
            var datos = (Usuario)Session["Datos"];
            lblCuentaIngresada.Text = datos.Alias;
        }
    }
}
