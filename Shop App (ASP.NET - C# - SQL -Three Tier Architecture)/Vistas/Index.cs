using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Entidades;

namespace Vistas
{
    public class Index : System.Web.UI.Page
    {
        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);
            
            string uri = Request.Url.AbsolutePath;
            var datos = Session["Datos"];

            // Si estoy logueado, no deberia poder entrar ni al registro ni al login. Se va a Inicio
            if (datos != null && (uri == "/Login.aspx" || uri == "/Registro.aspx"))
            {
                Response.Redirect("~/Inicio.aspx");
            }
            // No estoy logueado e ingreso a cualquier cosa que no sea ni login ni registro. Lo redirecciono a login
            else if (datos == null && uri != "/Login.aspx" && uri != "/Registro.aspx")
            {
                Response.Redirect("~/Login.aspx");
            }
        }
    }
}