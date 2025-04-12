using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using System.Data;
using Entidades;

namespace Vistas.Admin.Ventas
{
    public partial class Estadisticas : Admin
    {
        NegocioEstadisticas nEstadisticas = new NegocioEstadisticas();
        bool mostrarGrafico1 = false;
        bool mostrarGrafico2 = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                VerUsuarioConectado();
            }

            chGrafico1.Visible = mostrarGrafico1;
            chGrafico2.Visible = mostrarGrafico2;
        }

        protected void calInicio_DayRender(object sender, DayRenderEventArgs e)
        {

        }

        protected void calInicio_SelectionChanged(object sender, EventArgs e)
        {
            txtFechaInicio.Text = calInicio.SelectedDate.ToString();
            if (calInicio.SelectedDate.ToString() == "01/01/0001 00:00:00")
            {
                txtFechaInicio.Text = string.Empty;
            }
        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            txtFechaCierre.Text = calCierre.SelectedDate.ToString();
            if (calCierre.SelectedDate.ToString() == "01/01/0001 00:00:00")
            {
                txtFechaCierre.Text = string.Empty;
            }
        }
        private void VerUsuarioConectado()
        {
            var datos = (Usuario)Session["Datos"];
            lblCuentaIngresada.Text = datos.Alias;
        }

        protected void btnVisualizar_Click(object sender, EventArgs e)
        {
            DataTable datos = new DataTable();

            switch (ddlCategorias.SelectedIndex)
            {
                case 1://ganancias totales
                    datos = nEstadisticas.recaudacionTotal(calInicio.SelectedDate, calCierre.SelectedDate);
                    grvDatos.DataSource = datos;
                    grvDatos.DataBind();

                    mostrarGrafico1 = false;
                    mostrarGrafico2 = false;
                    chGrafico1.Visible = mostrarGrafico1;
                    chGrafico2.Visible = mostrarGrafico2;

                    break;
                case 2://por mercaderia
                    datos = nEstadisticas.recaudacionPorArticulo(calInicio.SelectedDate, calCierre.SelectedDate);
                    grvDatos.DataSource = datos;
                    grvDatos.DataBind();


                    chGrafico1.DataSource = datos;
                    chGrafico1.Series["Series1"].XValueMember = "NombreArticulo";
                    chGrafico1.Series["Series1"].YValueMembers = "Cantidad Vendida";
                    chGrafico1.DataBind();

                    chGrafico2.DataSource = datos;
                    chGrafico2.Series["Series1"].XValueMember = "NombreArticulo";
                    chGrafico2.Series["Series1"].YValueMembers = "Total";
                    chGrafico2.DataBind();

                    mostrarGrafico1 = true;
                    mostrarGrafico2 = true;
                    chGrafico1.Visible = mostrarGrafico1;
                    chGrafico2.Visible = mostrarGrafico2;

                    break;
                case 3://cantidad por categoria
                    datos = nEstadisticas.ventasPorCategorias(calInicio.SelectedDate, calCierre.SelectedDate);
                    grvDatos.DataSource = datos;
                    grvDatos.DataBind();

                    chGrafico1.DataSource = datos;
                    chGrafico1.Series["Series1"].XValueMember = "NombreCategoria";
                    chGrafico1.Series["Series1"].YValueMembers = "Cantidad Vendidas";
                    chGrafico1.DataBind();

                    mostrarGrafico1 = true;
                    mostrarGrafico2 = false;
                    chGrafico1.Visible = mostrarGrafico1;
                    chGrafico2.Visible = mostrarGrafico2;

                    break;
                case 4://gastos totales
                    datos = nEstadisticas.totalGastado(calInicio.SelectedDate, calCierre.SelectedDate);
                    grvDatos.DataSource = datos;
                    grvDatos.DataBind();

                    mostrarGrafico1 = false;
                    mostrarGrafico2 = false;
                    chGrafico1.Visible = mostrarGrafico1;
                    chGrafico2.Visible = mostrarGrafico2;

                    break;
                case 5://gasto por producto
                    datos = nEstadisticas.gastosPorProducto(calInicio.SelectedDate, calCierre.SelectedDate);
                    grvDatos.DataSource = datos;
                    grvDatos.DataBind();


                    chGrafico1.DataSource = datos;
                    chGrafico1.Series["Series1"].XValueMember = "NombreArticulo";
                    chGrafico1.Series["Series1"].YValueMembers = "Gastos";
                    chGrafico1.DataBind();

                    mostrarGrafico1 = true;
                    mostrarGrafico2 = false;
                    chGrafico1.Visible = mostrarGrafico1;
                    chGrafico2.Visible = mostrarGrafico2;
                    break;
                default:
                    break;
            }


        }
    }
}