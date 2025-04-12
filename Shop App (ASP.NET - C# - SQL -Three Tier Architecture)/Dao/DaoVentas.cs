using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Entidades;

namespace Dao
{
    public class DaoVentas
    {
        private AccesoDatos _datos = new AccesoDatos("TPIntegradorGrupo6");
        public DaoVentas() { }

        public int AgregarVenta(Venta venta)
        {
            SqlCommand cmd = new SqlCommand();
            ArmarParametrosAgregar(ref cmd, venta);
            return _datos.EjecutarProcAlmacenadoObtenerId(ref cmd, "sp_AgregarVenta");
        }

        public int AgregarDetalleVenta(DetalleVenta detalleVenta)
        {
            SqlCommand cmd = new SqlCommand();
            ArmarParametrosAgregarDetalle(ref cmd, detalleVenta);
            return _datos.EjecutarProcedimientoAlmacenado(ref cmd, "sp_AgregarDetalleVenta");
        }

        public DataTable ObtenerVentas()
        {
            string consulta = "SELECT IDVenta, CONCAT_WS(' ', Nombre, Apellido) AS Comprador," +
                "PrecioTotal, FechaVenta FROM VENTAS V INNER JOIN CLIENTES C ON V.DNICliente = C.DNI";

            return _datos.ObtenerTabla("Ventas", consulta);
        }

        public DataTable ObtenerDetalleVenta(int idVenta)
        {
            string consulta = "SELECT NombreArticulo, PrecioUnitario, Cantidad " +
                $"FROM DETALLEVENTAS DV INNER JOIN ARTICULOS A ON A.IDArticulo = DV.IDArticulo WHERE IDVenta = {idVenta}";

            return _datos.ObtenerTabla("DetalleVenta", consulta);
        }

        private void ArmarParametrosAgregar(ref SqlCommand cmd, Venta venta)
        {
            cmd.Parameters.AddWithValue("@DNICliente", venta.Cliente.Dni);
            cmd.Parameters.AddWithValue("@TOTAL", venta.PrecioTotal);
        }

        private void ArmarParametrosAgregarDetalle(ref SqlCommand cmd, DetalleVenta detalleVenta)
        {
            cmd.Parameters.AddWithValue("@IDVenta", detalleVenta.Venta.Id);
            cmd.Parameters.AddWithValue("@IDArticulo", detalleVenta.Articulo.Id);
            cmd.Parameters.AddWithValue("@PrecioUnitario", detalleVenta.PrecioUnitario);
            cmd.Parameters.AddWithValue("@Cantidad", detalleVenta.Cantidad);
        }
    }
}
