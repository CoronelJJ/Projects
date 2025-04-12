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
    public class DaoPedidos
    {
        private AccesoDatos _datos = new AccesoDatos("TPIntegradorGrupo6");
        public DaoPedidos() { }

        public DataTable ObtenerPedidos()
        {
            string consulta = "SELECT P.*, NombreProveedor, NombreArticulo " +
                "FROM PEDIDOS P INNER JOIN ARTICULOS A ON P.IDArticulo = A.IDArticulo " +
                "INNER JOIN PROVEEDORES PR ON PR.IDProveedor = P.IDProveedor";

            return _datos.ObtenerTabla("Pedidos", consulta);
        }

        public int AgregarPedido(Pedido pedido)
        {
            SqlCommand cmd = new SqlCommand();
            ArmarParametrosAgregar(ref cmd, pedido);
            return _datos.EjecutarProcedimientoAlmacenado(ref cmd, "sp_AgregarPedidoMercaderia");
        }
        
        private void ArmarParametrosAgregar(ref SqlCommand cmd, Pedido pedido)
        {
            cmd.Parameters.AddWithValue("@IDArticulo", pedido.Articulo.Id);
            cmd.Parameters.AddWithValue("@Cantidad", pedido.Cantidad);
        }
    }
}
