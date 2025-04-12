using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;

namespace Vistas
{
    public partial class Login : Index
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            LogearUsuario negocioLogIn = new LogearUsuario();
            var usuarioLogueado = negocioLogIn.IniciarSesion(txtUsuario.Text.Trim(), txtContrasenia.Text.Trim());

            if (usuarioLogueado == null)
            {
                lblErrorLogeo.Text = "Usuario y/o contraseña incorrectos.";
                return;
            }
          
            Session["Datos"] = usuarioLogueado;
            Response.Redirect("Inicio.aspx");
        }
    }
}