using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dao;
using System.Data;

namespace Negocio
{
    public class NegocioEstadisticas
    {
        private DaoEstadisticas _daoEstadisticas = new DaoEstadisticas();

        public NegocioEstadisticas() { }

        public DataTable gastosPorProducto(DateTime fechaInicio, DateTime fechaCierre)
        {

            return _daoEstadisticas.ObtenerGastosPorProducto(fechaInicio, fechaCierre);
        }

        public DataTable recaudacionTotal(DateTime fechaInicio, DateTime fechaCierre)
        {

            return _daoEstadisticas.ObtenerRecaudacionTotal(fechaInicio, fechaCierre);
        }

        public DataTable recaudacionPorArticulo(DateTime fechaInicio, DateTime fechaCierre)
        {

            return _daoEstadisticas.ObtenerRecaudacionPorArticulo(fechaInicio, fechaCierre);
        }

        public DataTable ventasPorCategorias(DateTime fechaInicio, DateTime fechaCierre)
        {

            return _daoEstadisticas.ObtenerVentasPorCategoria(fechaInicio, fechaCierre);
        }

        public DataTable totalGastado(DateTime fechaInicio, DateTime fechaCierre)
        {

            return _daoEstadisticas.ObtenerTotalGastado(fechaInicio, fechaCierre);
        }
    }
}
