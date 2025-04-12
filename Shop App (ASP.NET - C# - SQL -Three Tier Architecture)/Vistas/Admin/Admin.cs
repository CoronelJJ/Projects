using Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Vistas.Admin
{
    public class Admin : System.Web.UI.Page
    {
        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);

            var datos = Session["Datos"];

            if (datos == null || datos.GetType() != typeof(Usuario))
            {
                Response.Redirect($"~/Admin/Error.aspx?uri={Request.Url.AbsolutePath}");
            }
        }
    }
}