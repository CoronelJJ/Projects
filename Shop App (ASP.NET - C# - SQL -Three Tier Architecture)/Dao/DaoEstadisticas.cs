using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Entidades;
using System.Data.SqlClient;

namespace Dao
{
    public class DaoEstadisticas
    {
        private AccesoDatos _datos = new AccesoDatos("TPIntegradorGrupo6");

        private void ArmarParametrosParaAregar(ref SqlCommand cmd, DateTime fechaInicio, DateTime fechaCierre)
        {
            cmd.Parameters.AddWithValue("@FechaInicio", fechaInicio);
            cmd.Parameters.AddWithValue("@FechaCierre", fechaCierre);
        }

        public DataTable ObtenerGastosPorProducto(DateTime fechaIn, DateTime fechaCi)
        {
            SqlCommand cmd = new SqlCommand();
            ArmarParametrosParaAregar(ref cmd, fechaIn, fechaCi);

            return _datos.ObtenerTablaDesdeProcedimiento(ref cmd, "sp_TotalGastadoPorProductoEnPeriodo");
        }

        public DataTable ObtenerRecaudacionTotal(DateTime fechaIn, DateTime fechaCi)
        {
            SqlCommand cmd = new SqlCommand();
            ArmarParametrosParaAregar(ref cmd, fechaIn, fechaCi);

            return _datos.ObtenerTablaDesdeProcedimiento(ref cmd, "sp_RecaudacionTotalEnPeriodo");
        }

        public DataTable ObtenerRecaudacionPorArticulo(DateTime fechaIn, DateTime fechaCi)
        {
            SqlCommand cmd = new SqlCommand();
            ArmarParametrosParaAregar(ref cmd, fechaIn, fechaCi);

            return _datos.ObtenerTablaDesdeProcedimiento(ref cmd, "sp_RecaudacionPorArticuloEnPeriodo");
        }

        public DataTable ObtenerVentasPorCategoria(DateTime fechaIn, DateTime fechaCi)
        {
            SqlCommand cmd = new SqlCommand();
            ArmarParametrosParaAregar(ref cmd, fechaIn, fechaCi);

            return _datos.ObtenerTablaDesdeProcedimiento(ref cmd, "sp_VentasPorCategoriaEnPeriodo");
        }

        public DataTable ObtenerTotalGastado(DateTime fechaIn, DateTime fechaCi)
        {
            SqlCommand cmd = new SqlCommand();
            ArmarParametrosParaAregar(ref cmd, fechaIn, fechaCi);

            return _datos.ObtenerTablaDesdeProcedimiento(ref cmd, "sp_TotalGastadoEnPeriodo");
        }
    }
}
