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
    public partial class AgregarProveedor : Admin
    {
        private NegocioProveedores _negocioProve = new NegocioProveedores();
        private NegocioProvincia _negocioProvi = new NegocioProvincia();
        private NegocioCiudades _negocioCiu = new NegocioCiudades();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlProvincia.DataSource = _negocioProvi.ObtenerProvincias();
                ddlProvincia.DataTextField = "NombreProvincia";
                ddlProvincia.DataValueField = "CodigoProvincia";
                ddlProvincia.DataBind();

                VerUsuarioConectado();
            }
        }

        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlProvincia.SelectedValue != "--Seleccionar--")
            {
                CargarCiudades(int.Parse(ddlProvincia.SelectedValue));
            }
            else
            {
                ddlCiudad.Items.Clear();
                ddlCiudad.Items.Add(new ListItem("--Seleccione una provincia--", "--Seleccione una provincia--"));
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Proveedor proveedor = new Proveedor()
            {
                Nombre = txtNombreProveedor.Text.Trim(),
                Telefono = txtTelefono.Text.Trim(),
                Email = txtEmail.Text.Trim(),
                Direccion = txtDireccion.Text.Trim(),
                Ciudad = new Ciudad()
                {
                    Codigo = int.Parse(ddlCiudad.SelectedValue)
                }
            };

            if (_negocioProve.AgregarProveedor(proveedor))
            {
                lblNotificacion.Text = "Se pudo agregar el proveedor exitosamente";
                txtNombreProveedor.Text = txtTelefono.Text = txtEmail.Text = txtDireccion.Text = "";
            }
            else
            {
                lblNotificacion.Text = "No se pudo agregar el proveedor";
            }
        }

        private void CargarCiudades(int idProvincia)
        {
            DataView dv = new DataView(_negocioCiu.ObtenerCiudades())
            {
                RowFilter = "CodigoProvincia = " + idProvincia
            };

            ddlCiudad.DataSource = dv.ToTable();
            ddlCiudad.DataValueField = "CodigoCiudad";
            ddlCiudad.DataTextField = "NombreCiudad";
            ddlCiudad.DataBind();
        }

        private void VerUsuarioConectado()
        {
            var datos = (Usuario)Session["Datos"];
            lblCuentaIngresada.Text = datos.Alias;
        }
    }
}