using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using Entidades;

namespace Vistas
{
    public class Clientes : Index
    {
        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);

            string uri = Request.Url.AbsolutePath;
            var datos = Session["Datos"];

            if (datos != null && datos.GetType() == typeof(Usuario))
            {
                Response.Redirect("~/Inicio.aspx");
            }
        }
    }
}