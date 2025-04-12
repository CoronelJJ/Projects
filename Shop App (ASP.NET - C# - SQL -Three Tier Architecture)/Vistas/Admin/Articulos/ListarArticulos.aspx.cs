using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using System.Data;
using Negocio;

namespace Vistas.Admin.Articulos
{
    public partial class ListarArticulos : Admin
    {
        private NegocioArticulos _negocioArt = new NegocioArticulos();
        private NegocioCategorias _negocioCat = new NegocioCategorias();
        private NegocioProveedores _negocioProv = new NegocioProveedores();
        static private DataTable _tablaInicial;
        static private DataTable _tabla;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlFiltroProveedor.DataSource = _negocioProv.ObtenerProveedores();
                ddlFiltroProveedor.DataTextField = "NombreProveedor";
                ddlFiltroProveedor.DataValueField = "IDProveedor";
                ddlFiltroProveedor.DataBind();

                ddlFiltroCategoria.DataSource = _negocioCat.ObtenerCategorias();
                ddlFiltroCategoria.DataTextField = "NombreCategoria";
                ddlFiltroCategoria.DataValueField = "IDCategoria";
                ddlFiltroCategoria.DataBind();

                VerUsuarioConectado();
                CargarTablaInicial();
            }
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            string filtro = "";
            switch (ddlFiltroEstado.SelectedValue)
            {
                case "1":
                    filtro = "Estado = 1";
                    break;
                case "2":
                    filtro = "Estado = 0";
                    break;
            }

            if (ddlFiltroCategoria.SelectedValue != "-- Seleccione --")
            {
                if (filtro.Length > 0)
                {
                    filtro += " AND ";
                }

                filtro += "IDCategoria = " + ddlFiltroCategoria.SelectedValue;
            }

            if (ddlFiltroProveedor.SelectedValue != "-- Seleccione --")
            {
                if (filtro.Length > 0)
                {
                    filtro += " AND ";
                }

                filtro += "IDProveedor = " + ddlFiltroProveedor.SelectedValue;
            }

            string precio = txtFiltroPrecio.Text.Trim();

            if (precio.Length > 0)
            {
                if (filtro.Length > 0)
                {
                    filtro += " AND ";
                }

                switch (ddlFiltroPrecio.SelectedValue)
                {
                    case "<=":
                        filtro += "PrecioDeVenta <= " + precio;
                        break;
                    case ">=":
                        filtro += "PrecioDeVenta >= " + precio;
                        break;
                }
            }

            string id = txtFiltroId.Text.Trim();

            if (id.Length > 0)
            {
                if (filtro.Length > 0)
                {
                    filtro += " AND ";
                }

                filtro += "IDArticulo = " + id;
            }

            DataView dv = new DataView(_tablaInicial)
            {
                RowFilter = filtro
            };

            _tabla = filtro.Length > 0 ? dv.ToTable() : _tablaInicial.Copy();

            gvArticulos.DataSource = _tabla;
            gvArticulos.DataBind();
        }

        protected void gvArticulos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvArticulos.PageIndex = e.NewPageIndex;

            gvArticulos.DataSource = _tabla;
            gvArticulos.DataBind();
        }

        protected void gvArticulos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvArticulos.EditIndex = -1;

            gvArticulos.DataSource = _tabla;
            gvArticulos.DataBind();
        }

        protected void gvArticulos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label idArticulo = (Label)gvArticulos.Rows[e.RowIndex].FindControl("lbl_it_Id");
            _negocioArt.EliminarArticulo(int.Parse(idArticulo.Text));

            CargarTablaInicial(true);
        }

        protected void gvArticulos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvArticulos.EditIndex = e.NewEditIndex;

            gvArticulos.DataSource = _tabla;
            gvArticulos.DataBind();
        }

        protected void gvArticulos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var fila = gvArticulos.Rows[e.RowIndex];

            Articulo articuloEditado = new Articulo
            {
                Id = int.Parse(((Label)fila.FindControl("lbl_eit_Id")).Text),
                Nombre = ((TextBox)fila.FindControl("txt_eit_Nombre")).Text.Trim(),
                Categoria = new Categoria
                {
                    Id = int.Parse(((DropDownList)fila.FindControl("ddl_eit_Categoria")).SelectedValue)
                },
                Proveedor = new Proveedor
                {
                    Id = int.Parse(((DropDownList)fila.FindControl("ddl_eit_Proveedor")).SelectedValue)
                },
                PrecioVenta = decimal.Parse(((TextBox)fila.FindControl("txt_eit_Precio")).Text.Trim()),
                Stock = int.Parse(((Label)fila.FindControl("lbl_eit_Stock")).Text.Trim()),
                Estado = ((CheckBox)fila.FindControl("chk_eit_Estado")).Checked
            };

            _negocioArt.ModificarArticulo(articuloEditado);

            gvArticulos.EditIndex = -1;
            CargarTablaInicial(true);
        }

        protected void gvArticulos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    DropDownList ddlCat = (DropDownList)e.Row.FindControl("ddl_eit_Categoria");
                    DropDownList ddlProv = (DropDownList)e.Row.FindControl("ddl_eit_Proveedor");

                    ddlCat.DataSource = _negocioCat.ObtenerCategorias();
                    ddlCat.DataTextField = "NombreCategoria";
                    ddlCat.DataValueField = "IDCategoria";
                    ddlCat.SelectedValue = ((Label)e.Row.FindControl("lbl_eit_IdCategoria")).Text;
                    ddlCat.DataBind();

                    ddlProv.DataSource = _negocioProv.ObtenerProveedores();
                    ddlProv.DataTextField = "NombreProveedor";
                    ddlProv.DataValueField = "IDProveedor";
                    ddlProv.SelectedValue = ((Label)e.Row.FindControl("lbl_eit_IdProveedor")).Text;
                    ddlProv.DataBind();
                }
            }
        }

        private void CargarTablaInicial(bool actualizar = false)
        {
            _tablaInicial = _negocioArt.ObtenerArticulos(actualizar);
            _tabla = _tablaInicial.Copy();

            gvArticulos.DataSource = _tablaInicial;
            gvArticulos.DataBind();
        }

        private void VerUsuarioConectado()
        {
            var datos = (Usuario)Session["Datos"];
            lblCuentaIngresada.Text = datos.Alias;
        }

        protected void cv_eit_Precio_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = decimal.TryParse(args.Value, out decimal precio) && precio > 0;
        }

        protected void cvFiltroPrecio_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = decimal.TryParse(args.Value, out decimal precio) && precio > 0;
        }
    }
}