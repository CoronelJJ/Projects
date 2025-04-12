using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Entidades;
using Negocio;

namespace Vistas.Admin.Pedidos
{
    public partial class ListarPedidos : Admin
    {
        private NegocioProveedores _negocioProv = new NegocioProveedores();
        private NegocioPedidos _negocioPed = new NegocioPedidos();
        static private DataTable _tablaInicial;
        static private DataTable _tabla;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlProveedor.DataSource = _negocioProv.ObtenerProveedores();
                ddlProveedor.DataTextField = "NombreProveedor";
                ddlProveedor.DataValueField = "IDProveedor";
                ddlProveedor.DataBind();

                _tablaInicial = _negocioPed.ObtenerPedidos();
                _tabla = _tablaInicial.Copy();

                gvListarPedidos.DataSource = _tablaInicial;
                gvListarPedidos.DataBind();
                VerUsuarioConectado();
            }
        }


        protected void gdvListarPedidos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvListarPedidos.PageIndex = e.NewPageIndex;

            gvListarPedidos.DataSource = _tabla;
            gvListarPedidos.DataBind();
        }

        private void VerUsuarioConectado()
        {
            var datos = (Usuario)Session["Datos"];
            lblCuentaIngresada.Text = datos.Alias;
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            string filtro = "";


            // ID PROVEEDOR
            if (ddlProveedor.SelectedValue != "-- Seleccione --")
            {
                filtro += "IDProveedor = " + ddlProveedor.SelectedValue;
            }
            ///COsTO TOTAL
            string precio = tbTotal.Text.Trim();

            if (precio.Length > 0)
            {
                if (filtro.Length > 0)
                {
                    filtro += " AND ";
                }

                switch (ddlFiltroTotal.SelectedValue)
                {
                    case "<=":
                        filtro += "CostoTotal <= " + precio;
                        break;
                    case ">=":
                        filtro += "CostoTotal >= " + precio;
                        break;
                }
            }

            string id = tbIDPedido.Text.Trim();

            if (id.Length > 0)
            {
                if (filtro.Length > 0)
                {
                    filtro += " AND ";
                }

                filtro += "IDPedido = " + id;
            }


            DataView dv = new DataView(_tablaInicial)
            {
                RowFilter = filtro
            };

            _tabla = filtro.Length > 0 ? dv.ToTable() : _tablaInicial.Copy();

            gvListarPedidos.DataSource = _tabla;
            gvListarPedidos.DataBind();

        }


        protected void cvFiltroPrecioTotal_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = decimal.TryParse(args.Value, out decimal precio) && precio > 0;
        }
    }
}

   

