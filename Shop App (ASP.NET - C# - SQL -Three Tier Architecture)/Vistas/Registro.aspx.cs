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

namespace Vistas
{
    public partial class Registro : Index
    {
        private NegocioClientes _negocioCli = new NegocioClientes();
        private NegocioCiudades _negocioCiu = new NegocioCiudades();
        private NegocioProvincia _negocioProv = new NegocioProvincia();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {   
                ddlProvincias.DataSource = _negocioProv.ObtenerProvincias();
                ddlProvincias.DataTextField = "NombreProvincia";
                ddlProvincias.DataValueField = "CodigoProvincia";
                ddlProvincias.DataBind();
               
            }
        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            Cliente nuevoCliente = PrepararCliente();
            if (_negocioCli.ExisteCliente(nuevoCliente))
            {
                MessageBox.Show("El nombre de usuario y/o DNI ingresado(s) ya existe(n)", "Error al registrarse");
                txtContrasenia.Text = txtRepetirContrasenia.Text = "";
                return;
            }

            if (_negocioCli.AgregarCliente(nuevoCliente))
            {
                MessageBox.Show("Tu cuenta fue creada exitosamente. Proceda a iniciar sesión.", "Bienvenido/a");
                Response.Redirect("Login.aspx");
            }
            else
            {
                MessageBox.Show("Hubo un error al crear tu cuenta. Intente nuevamente", "Error al registrarse");
                txtContrasenia.Text = txtRepetirContrasenia.Text = "";
            }
        }

        public Cliente PrepararCliente()
        {
            Cliente cliente = new Cliente
            {
                Dni = int.Parse(txtDni.Text.Trim()),
                Nombre = txtNombres.Text.Trim(),
                Apellido = txtApellido.Text.Trim(),
                Direccion = txtDireccion.Text.Trim(),
                Telefono = txtTelefono.Text.Trim(),
                Email = txtEmail.Text.Trim(),
                Usuario = new Usuario
                {
                    Alias = txtUsuario.Text.Trim(),
                    Contrasenia = txtContrasenia.Text.Trim(),
                    Tipo = 'C',
                    Estado = true
                },
                Ciudad = new Ciudad
                {
                    Codigo = int.Parse(ddlCiudades.SelectedValue)
                }
            };

            return cliente;
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
    }
}