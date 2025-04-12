using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using Entidades;
using Negocio;
using Label = System.Web.UI.WebControls.Label;

namespace Vistas.Articulos
{
    public partial class CarritoDeCompras : Clientes
    {
        private NegocioVentas _negocio = new NegocioVentas();
        private List<DetalleVenta> _articulos;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                VerUsuarioConectado();
            }

            if (Session["Venta"] != null)
            {
                _articulos = (List<DetalleVenta>)Session["Venta"];

                gvCarritoDeCompras.DataSource = _articulos;
                gvCarritoDeCompras.DataBind();

                ActualizarInfo(_articulos);
            }
            else
            {
                OcultarCarrito();
            }
        }

        protected void btnComprar_Click(object sender, EventArgs e)
        {
            if (ConfirmarAccion("comprar") == DialogResult.Yes)
            {
                Cliente Cliente = (Cliente)Session["Datos"];
                    decimal PrecioTotal = decimal.Parse(lblTotal.Text);
                Venta venta = new Venta
                {
                    Cliente = (Cliente)Session["Datos"],
                    PrecioTotal = decimal.Parse(lblTotal.Text)
                };

                int idVenta = _negocio.AgregarVenta(venta);

                if (idVenta > 0)
                {
                    if (_negocio.AgregarDetalleVenta(idVenta, _articulos))
                    {
                        MessageBox.Show("¡Compra realizada con éxito!");
                        Session["Venta"] = null;
                        OcultarCarrito();
                    }
                    else
                    {
                        MessageBox.Show("Tuvimos un problema al completar tu compra", "Error");
                    }
                }
                else
                {
                    MessageBox.Show("Tuvimos un problema al completar tu compra", "Error");
                }
            }
        }

        private DialogResult ConfirmarAccion(string accion)
        {
            string mensaje = "";

            switch (accion)
            {
                case "eliminar":
                    mensaje = "¿Está seguro que quiere eliminar todos los productos del carrito de compras?";
                    break;
                case "comprar":
                    mensaje = "Usted está a punto de hacer una compra de:\n" +
                        $"Productos: {lblCantArticulos.Text}\n" +
                        $"Total: {lblTotal.Text}\n" +
                        "¿Está seguro que quiere adquirir los productos y la cantidad especificada?\n\n";
                    break;
            }

            return MessageBox.Show(mensaje, "Confirmación", MessageBoxButtons.YesNo);
        }

        protected void gvCarritoDeCompras_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var fila = gvCarritoDeCompras.Rows[e.RowIndex];
            int idArticulo = int.Parse(((Label)fila.FindControl("lblArticuloID")).Text);

            foreach (DetalleVenta venta in _articulos)
            {
                if (idArticulo == venta.Articulo.Id)
                {
                    decimal total = decimal.Parse(lblTotal.Text);
                    int cantArt = int.Parse(lblCantArticulos.Text);

                    total -= venta.PrecioUnitario * venta.Cantidad;
                    lblTotal.Text = total.ToString();

                    cantArt -= venta.Cantidad;
                    lblCantArticulos.Text = cantArt.ToString();
                    
                    _articulos.Remove(venta);
                    break;
                }
            }

            gvCarritoDeCompras.DataSource = _articulos;
            gvCarritoDeCompras.DataBind();
        }

        protected void gvCarritoDeCompras_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCarritoDeCompras.PageIndex = e.NewPageIndex;

            gvCarritoDeCompras.DataSource = _articulos;
            gvCarritoDeCompras.DataBind();
        }

        protected void btnEliminarTodo_Click(object sender, EventArgs e)
        {
            if (ConfirmarAccion("eliminar") == DialogResult.Yes)
            { 
                Session["Venta"] = null;
                OcultarCarrito();
            }
        }

        private void ActualizarInfo(List<DetalleVenta> articulos)
        {
            int cantArt = 0;
            decimal total = 0;

            foreach (DetalleVenta articulo in articulos)
            {
                cantArt += articulo.Cantidad;
                total += articulo.PrecioUnitario * articulo.Cantidad;
            }
            
            lblCantArticulos.Text = cantArt.ToString();
            lblTotal.Text = total.ToString();
        }

        private void OcultarCarrito()
        {
            lblMensaje.Visible = true;
            gvCarritoDeCompras.Visible = false;
            btnComprar.Enabled = false;
            btnEliminarTodo.Enabled = false;
        }

        private void VerUsuarioConectado()
        {
            var datos = (Cliente)Session["Datos"];
            lblCuentaIngresada.Text = datos.Usuario.Alias;
        }
    }
}