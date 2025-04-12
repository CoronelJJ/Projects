using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;
using MessageBox = System.Windows.Forms.MessageBox;

namespace Vistas.Admin.Categorias
{
    public partial class ListarCategoria : Admin
    {
        private NegocioCategorias _negocio = new NegocioCategorias();
        static private DataTable _tablaInicial;
        static private DataTable _tabla;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarTablaInicial();
                VerUsuarioConectado();
            }
        }
        
        protected void gvCategorias_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label idCategoria = (Label)gvCategorias.Rows[e.RowIndex].FindControl("lbl_it_Id");

            if (_negocio.EliminarCategoria(int.Parse(idCategoria.Text)))
            {
                MessageBox.Show("Se elimino correctamente la categoria", "Mensaje");
            }
            else
            {
                MessageBox.Show("No se pudo eliminar la categoria, Checkee que no posea articulos adheridos a la misma", "Mensaje");
            }

            CargarTablaInicial();
        }

        protected void gvCategorias_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCategorias.PageIndex = e.NewEditIndex;

            gvCategorias.DataSource = _tabla;
            gvCategorias.DataBind();
        }

        protected void gvCategorias_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCategorias.EditIndex = -1;

            gvCategorias.DataSource = _tabla;
            gvCategorias.DataBind();
        }

        protected void gvCategorias_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var fila = gvCategorias.Rows[e.RowIndex];
            Categoria cat = new Categoria
            {
                Id = int.Parse(((Label)fila.FindControl("lbl_eit_Id")).Text),
                Nombre = ((TextBox)fila.FindControl("txt_eit_Categoria")).Text.Trim(),
                Descripcion = ((TextBox)fila.FindControl("txt_eit_Descripcion")).Text.Trim()
            };

            if (_negocio.ModificarCategorias(cat))
            {
                MessageBox.Show("¡El registro se ha modificado correctamente!", "Mensaje de edición");
            }

            gvCategorias.EditIndex = -1;
            CargarTablaInicial(true);
        }

        protected void gvCategorias_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCategorias.PageIndex = e.NewPageIndex;

            gvCategorias.DataSource = _tabla;
            gvCategorias.DataBind();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string filtro = "";
            string idCategoria = txtIdCategoria.Text.Trim();
            string nombreCategoria = txtNombre.Text.Trim();

            if (idCategoria.Length > 0)
            {
                filtro += $"IDCategoria = {idCategoria}";
            }

            if (nombreCategoria.Length > 0)
            {
                if (filtro.Length > 0)
                {
                    filtro += " AND ";
                }

                filtro += $"NombreCategoria LIKE '%{nombreCategoria}%'";
            }

            DataView dv = new DataView(_tablaInicial)
            {
                RowFilter = filtro
            };  

            _tabla = filtro.Length > 0 ? dv.ToTable() : _tablaInicial.Copy();

            gvCategorias.DataSource = _tabla;
            gvCategorias.DataBind();

            txtIdCategoria.Text = txtNombre.Text = "";
        }

        private void CargarTablaInicial(bool actualizar = false)
        {
            _tablaInicial = _negocio.ObtenerCategorias(actualizar);
            _tabla = _tablaInicial.Copy();

            gvCategorias.DataSource = _tablaInicial;
            gvCategorias.DataBind();
        }

        private void VerUsuarioConectado()
        {
            var datos = (Usuario)Session["Datos"];
            lblCuentaIngresada.Text = datos.Alias;
        }
    }
}