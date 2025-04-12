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

namespace Vistas.Articulos
{
    public partial class CompraArticulo : Clientes
    {
        private NegocioCategorias _negocioCat = new NegocioCategorias();
        private NegocioArticulos _negocioArt = new NegocioArticulos();
        static private DataTable _tablaInicial;
        static private DataTable _tabla;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlCategorias.DataSource = _negocioCat.ObtenerCategorias();
                ddlCategorias.DataTextField = "NombreCategoria";
                ddlCategorias.DataValueField = "IDCategoria";
                ddlCategorias.DataBind();

                _tablaInicial = _negocioArt.ObtenerArticulos();
                _tabla = _tablaInicial.Copy();

                gvComprarArticulos.DataSource = _tablaInicial;
                gvComprarArticulos.DataBind();

                VerUsuarioConectado();
            }
        }

        protected void gvComprarArticulos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvComprarArticulos.PageIndex = e.NewPageIndex;

            gvComprarArticulos.DataSource = _tabla;
            gvComprarArticulos.DataBind();
        }

        protected void ddlCategorias_SelectedIndexChanged(object sender, EventArgs e)
        {
            string categoria = ddlCategorias.SelectedValue;
            DataView dv = new DataView(_tablaInicial)
            {
                RowFilter = $"IDCategoria = {categoria}"
            };

            _tabla = categoria != "-- Seleccione --" ? dv.ToTable() : _tablaInicial.Copy();

            gvComprarArticulos.DataSource = _tabla;
            gvComprarArticulos.DataBind();
        }

        protected void gvComprarArticulos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EventoAgregar")
            {
                if (Session["Venta"] == null)
                {
                    Session["Venta"] = new List<DetalleVenta>();
                }

                var fila = gvComprarArticulos.Rows[Convert.ToInt32(e.CommandArgument)];
                CustomValidator cv = (CustomValidator)fila.FindControl("cv_it_Cantidad");
                cv.Validate();

                if (!cv.IsValid)
                {
                    return;
                }
                
                DetalleVenta detalleVenta = new DetalleVenta
                {
                    Cantidad = int.Parse(((TextBox)fila.FindControl("txt_it_Cantidad")).Text),
                    PrecioUnitario = decimal.Parse(fila.Cells[2].Text.Substring(1)),
                    Articulo = new Articulo
                    {
                        Id = int.Parse(((Label)fila.FindControl("lbl_it_IdArticulo")).Text),
                        Nombre = ((Label)fila.FindControl("lbl_it_Articulo")).Text
                    }
                };


                AgregarDetalleVenta(detalleVenta, fila);
            }
        }

        private void AgregarDetalleVenta(DetalleVenta nuevoDetalle, GridViewRow fila)
        {
            var lista = (List<DetalleVenta>)Session["Venta"];
            DetalleVenta detalle = lista.Find(x => x.Articulo.Id == nuevoDetalle.Articulo.Id);
            if (detalle != null)
            {
                int cantidad = nuevoDetalle.Cantidad + detalle.Cantidad;
                if (cantidad > int.Parse(fila.Cells[3].Text))
                {
                    MessageBox.Show("Alcanzaste el stock máximo disponible", "Aviso");
                    return;
                }
                else
                {
                    detalle.Cantidad = cantidad;
                }
            }
            else
            {
                lista.Add(nuevoDetalle);
            }

            Session["Venta"] = lista;

            ((TextBox)fila.FindControl("txt_it_Cantidad")).Text = "";
        }

        protected void cv_it_Cantidad_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = int.TryParse(args.Value, out int cantidad) && cantidad > 0;
        }

        private void VerUsuarioConectado()
        {
            var datos = (Cliente)Session["Datos"];
            lblCuentaIngresada.Text = datos.Usuario.Alias;
        }
        protected void btnBuscarArt_Click(object sender, EventArgs e)
        {
            ddlCategorias.SelectedIndex = 0;
            string nombre = tbBuscarArticulo.Text.Trim();
            gvComprarArticulos.DataSource = _negocioArt.ObtenerArticuloPorNombre(nombre);
            gvComprarArticulos.DataBind();
            tbBuscarArticulo.Text = "";
            if (gvComprarArticulos.Rows.Count == 0) System.Windows.Forms.MessageBox.Show("No se ha encontrado ningún artículo", "Aviso");
        }

        protected void btnVistaPrincipal_Click(object sender, EventArgs e)
        {
            tbBuscarArticulo.Text = "";
            gvComprarArticulos.PageIndex = 0;
            gvComprarArticulos.DataSource = _tablaInicial;
            gvComprarArticulos.DataBind();
        }
    }
}