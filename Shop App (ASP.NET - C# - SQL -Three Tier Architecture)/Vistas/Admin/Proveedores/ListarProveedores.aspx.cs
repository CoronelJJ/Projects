using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;
using System.Data;

namespace Vistas.Admin.Proveedores
{
    public partial class ListarProveedores : Admin
    {
        private NegocioProveedores _negocioProv = new NegocioProveedores();
        private NegocioCiudades _negocioCiu = new NegocioCiudades();
        static private DataTable _tablaInicial;
        static private DataTable _tabla;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                VerUsuarioConectado();

                ddlFiltroCiudad.DataSource = _negocioCiu.ObtenerCiudades();
                ddlFiltroCiudad.DataTextField = "NombreCiudad";
                ddlFiltroCiudad.DataValueField = "CodigoCiudad";
                ddlFiltroCiudad.DataBind();

                CargarTablaInicial();
                VerUsuarioConectado();
            }
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            string nombre = txtNombreProveedor.Text.Trim();
            string idProveedor = txtIdProveedor.Text.Trim();

            string filtro = "";

            if (nombre.Length > 0)
            {
                filtro += $"NombreProveedor LIKE '%{nombre}%'";
            }

            if (idProveedor.Length > 0)
            {
                if (filtro.Length > 0)
                {
                    filtro += " AND ";
                }

                filtro += $"IDProveedor = {idProveedor}";
            }

            if (ddlFiltroCiudad.SelectedValue != "-- Seleccione --")
            {
                if (filtro.Length > 0)
                {
                    filtro += " AND ";
                }

                filtro += $"CodigoCiudad = {ddlFiltroCiudad.SelectedValue}";
            }

            DataView dv = new DataView(_tablaInicial)
            {
                RowFilter = filtro
            };

            _tabla = filtro.Length > 0 ? dv.ToTable() : _tablaInicial.Copy();

            gvProveedores.DataSource = _tabla;
            gvProveedores.DataBind();
        }

        protected void gvProveedores_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvProveedores.EditIndex = e.NewEditIndex;

            gvProveedores.DataSource = _tabla;
            gvProveedores.DataBind();

            DropDownList ciudades = (DropDownList)gvProveedores.Rows[e.NewEditIndex].FindControl("ddl_eit_Ciudad");

            ciudades.DataSource = _negocioCiu.ObtenerCiudades();
            ciudades.DataTextField = "NombreCiudad";
            ciudades.DataValueField = "CodigoCiudad";
            ciudades.SelectedValue = ((Label)gvProveedores.Rows[e.NewEditIndex].FindControl("lbl_eit_CodigoCiudad")).Text;
            ciudades.DataBind();
        }

        protected void gvProveedores_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvProveedores.PageIndex = e.NewPageIndex;

            gvProveedores.DataSource = _tabla;
            gvProveedores.DataBind();
        }

        protected void gvProveedores_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvProveedores.EditIndex = -1;

            gvProveedores.DataSource = _tabla;
            gvProveedores.DataBind();
        }

        protected void gvProveedores_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var fila = gvProveedores.Rows[e.RowIndex];
            Proveedor proveedor = new Proveedor
            {
                Id = int.Parse(((Label)fila.FindControl("lbl_eit_Id")).Text),
                Nombre = ((TextBox)fila.FindControl("txt_eit_Nombre")).Text.Trim(),
                Telefono = ((TextBox)fila.FindControl("txt_eit_Telefono")).Text.Trim(),
                Email = ((TextBox)fila.FindControl("txt_eit_Email")).Text.Trim(),
                Direccion = ((TextBox)fila.FindControl("txt_eit_Direccion")).Text.Trim(),
                Ciudad = new Ciudad
                {
                    Codigo = int.Parse(((DropDownList)fila.FindControl("ddl_eit_Ciudad")).SelectedValue),
                }
            };

            _negocioProv.ModificarProveedor(proveedor);

            gvProveedores.EditIndex = -1;
            CargarTablaInicial(true);
        }

        protected void gvProveedores_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int idProv = int.Parse(((Label)gvProveedores.Rows[e.RowIndex].FindControl("lbl_it_Id")).Text);
            _negocioProv.EliminarProveedor(idProv);

            CargarTablaInicial(true);
        }

        private void CargarTablaInicial(bool actualizar = false)
        {
            _tablaInicial = _negocioProv.ObtenerProveedores(actualizar);
            _tabla = _tablaInicial.Copy();

            gvProveedores.DataSource = _tablaInicial;
            gvProveedores.DataBind();
        }

        private void VerUsuarioConectado()
        {
            var datos = (Usuario)Session["Datos"];
            lblCuentaIngresada.Text = datos.Alias;
        }
    }
}