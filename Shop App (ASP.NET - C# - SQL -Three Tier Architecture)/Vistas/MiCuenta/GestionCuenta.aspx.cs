using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;
using System.Data;
using System.Windows.Forms;

namespace Vistas.MiCuenta
{
    public partial class GestionCuenta : Index
    {
        private NegocioClientes _negocioCli = new NegocioClientes();
        private NegocioCiudades _negocioCiu = new NegocioCiudades();
        private NegocioProvincia _negocioProv = new NegocioProvincia();
        private NegocioUsuario _negocioUsu = new NegocioUsuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                VerUsuarioConectado();
                var datos = Session["Datos"];

                if (datos.GetType() != typeof(Usuario))
                {
                    CargarDatosCliente((Cliente)datos);

                    ddlProvincias.DataSource = _negocioProv.ObtenerProvincias();
                    ddlProvincias.DataTextField = "NombreProvincia";
                    ddlProvincias.DataValueField = "CodigoProvincia";
                    ddlProvincias.DataBind();
                }
                else
                {
                    OcultarControlesCliente();
                }
            }

        }

        protected void ddlProvincias_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlProvincias.SelectedValue != "-- Seleccionar --")
            {
                CargarCiudades(int.Parse(ddlProvincias.SelectedValue));
            }
            else
            {
                ddlCiudades.Items.Clear();
                ddlCiudades.Items.Add(new ListItem("--Seleccione una provincia--", "--Seleccione una provincia--"));
            }
        }

        protected void btnAceptarPass_Click(object sender, EventArgs e)
        {
            var resultado = MessageBox.Show("¿Confirma cambiar su contraseña?", "Cambio de contraseña", MessageBoxButtons.YesNo);

            if (resultado == DialogResult.Yes)
            {
                if ((_negocioUsu.CambiarContrasenia(((Cliente)Session["Datos"]).Usuario.Alias, txtNuevaPass.Text.Trim())) == 1)
                {
                    MessageBox.Show("Contraseña actualizada correctamente");
                }
                else
                {
                    MessageBox.Show("Se ha producido un error. Intente nuevamente");
                }

                txtNuevaPass.Text = txtRepetirPass.Text = "";
            }
        }

        protected void btnAceptarDatos_Click(object sender, EventArgs e)
        {
            var resultado = MessageBox.Show("¿Confirma cambiar sus datos personales?", "Cambio de información personal", MessageBoxButtons.YesNo);

            if (resultado == DialogResult.Yes)
            {
                var actual = (Cliente)Session["Datos"];
                Cliente nuevosDatos = new Cliente
                {
                    Nombre = txtNombres.Text.Trim(),
                    Apellido = txtApellidos.Text.Trim(),
                    Ciudad = new Ciudad
                    {
                        Codigo = int.Parse(ddlCiudades.SelectedValue),
                        Nombre = ddlCiudades.SelectedItem.Text,
                        Provincia = new Provincia
                        {
                            Codigo = int.Parse(ddlProvincias.SelectedValue),
                            Nombre = ddlProvincias.SelectedItem.Text
                        },
                    },
                    Direccion = txtDireccion.Text.Trim(),
                    Telefono = txtTelefono.Text.Trim(),
                    Email = txtEmail.Text.Trim(),
                    Usuario = actual.Usuario,
                    Dni = actual.Dni
                };

                if (_negocioCli.ModificarCliente(nuevosDatos))
                {
                    MessageBox.Show("Datos actualizados correctamente");
                    Session["Datos"] = nuevosDatos;
                }
                else
                {
                    MessageBox.Show("Se ha producido un error. Intente nuevamente");
                }
            }
        }


        private void CargarCiudades(int idProvincia)
        {
            DataView dv = new DataView(_negocioCiu.ObtenerCiudades())
            {
                RowFilter = "CodigoProvincia = " + idProvincia
            };

            ddlCiudades.DataSource = dv.ToTable();
            ddlCiudades.DataTextField = "NombreCiudad";
            ddlCiudades.DataValueField = "CodigoCiudad";
            ddlCiudades.DataBind();
        }

        private void CargarDatosCliente(Cliente cliente)
        {
            txtNombres.Text = cliente.Nombre;
            txtApellidos.Text = cliente.Apellido;
            txtDireccion.Text = cliente.Direccion;
            txtTelefono.Text = cliente.Telefono;
            txtEmail.Text = cliente.Email;

            ddlProvincias.DataSource = _negocioProv.ObtenerProvincias();
            ddlProvincias.DataTextField = "NombreProvincia";
            ddlProvincias.DataValueField = "CodigoProvincia";
            ddlProvincias.SelectedValue = cliente.Ciudad.Provincia.Codigo.ToString();
            ddlProvincias.DataBind();

            ddlCiudades.SelectedValue = cliente.Ciudad.Codigo.ToString();
            CargarCiudades(cliente.Ciudad.Provincia.Codigo);
        }

        private void OcultarControlesCliente()
        {
            lblNombres.Visible = false;
            lblApellidos.Visible = false;
            lblDireccion.Visible = false;
            lblTelefono.Visible = false;
            lblEmail.Visible = false;
            lblProvincia.Visible = false;
            lblCiudad.Visible = false;
            txtNombres.Visible = false;
            txtApellidos.Visible = false;
            txtDireccion.Visible = false;
            txtTelefono.Visible = false;
            txtEmail.Visible = false;
            ddlProvincias.Visible = false;
            ddlCiudades.Visible = false;
            btnAceptarDatos.Visible = false;
        }
        public void VerUsuarioConectado()
        {
            var datos = Session["Datos"];

            if (datos.GetType() == typeof(Usuario))
            {
                lblCuentaIngresada.Text = ((Usuario)Session["Datos"]).Alias;
            }
            else
            {
                lblCuentaIngresada.Text = ((Cliente)Session["Datos"]).Usuario.Alias;
            }
        }
    }
}