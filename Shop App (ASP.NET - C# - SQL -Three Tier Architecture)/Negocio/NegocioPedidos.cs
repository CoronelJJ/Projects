using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Dao;
using Entidades;

namespace Negocio
{
    public class NegocioPedidos
    {
        private DaoPedidos _dao = new DaoPedidos();
        private DataTable _pedidos;
        public NegocioPedidos() 
        {
            _pedidos = _dao.ObtenerPedidos();
        }

        public DataTable ObtenerPedidos(bool actualizar = false)
        {   
            if (actualizar)
            {
                _pedidos = _dao.ObtenerPedidos();
            }

            return _pedidos;
        }

        public Pedido ObtenerPedido(int idPedido)
        {
            try
            {
                DataRow fila = _pedidos.Rows[idPedido - 1];
                Pedido pedido = new Pedido
                {
                    Id = idPedido,
                    Articulo = new Articulo
                    {
                        Nombre = fila.Field<string>("Articulo")
                    },
                    Proveedor = new Proveedor
                    {
                        Nombre = fila.Field<string>("Proveedor")
                    },
                    Cantidad = fila.Field<int>("Cantidad"),
                    Fecha = fila.Field<DateTime>("Fecha"),
                    CostoTotal = fila.Field<decimal>("Total")
                };

                return pedido;
            }
            catch
            {
                return null;
            }
        }

        public bool AgregarPedido(Pedido pedido)
        {
            return _dao.AgregarPedido(pedido) == 1;
        }
    }
}
