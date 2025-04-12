using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using Entidades;
using Negocio;


namespace Vistas.Admin.Categorias
{
    public partial class AgregarCategoria : Admin
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblResultado.Text = "";

            VerUsuarioConectado();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            NegocioCategorias negocio = new NegocioCategorias();
            Categoria nuevaCategoria = new Categoria
            {
                Nombre = txtNombre.Text.Trim(),
                Descripcion = txtDescripcion.Text.Trim()
            };

            txtNombre.Text = "";
            txtDescripcion.Text = "";
            
            if (negocio.AgregarCategoria(nuevaCategoria)) 
            {
                MessageBox.Show("Se agregó la categoría correctamente", "Mensaje");
            }
            else
            {
                MessageBox.Show("No se pudo agregar la categoria", "Mensaje");
            }


        }
        private void VerUsuarioConectado()
        {
            var datos = (Usuario)Session["Datos"];
            lblCuentaIngresada.Text = datos.Alias;
        }
    }
}