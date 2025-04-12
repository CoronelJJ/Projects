using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Pedido
    {
        public int Id { get; set; }
        public Articulo Articulo { get; set; }
        public Proveedor Proveedor { get; set; }
        public int Cantidad { get; set; }
        public DateTime Fecha { get; set; }
        public decimal CostoTotal { get; set; }

        public Pedido() { }


        public Pedido(Articulo articulo, int cantidad)
        {
            Articulo = articulo;
            Cantidad = cantidad;
        }
        public Pedido(int id, Articulo articulo, Proveedor proveedor, int cantidad, DateTime fecha, decimal costoTotal)
        {
            Id = id;
            Articulo = articulo;
            Proveedor = proveedor;
            Cantidad = cantidad;
            Fecha = fecha;
            CostoTotal = costoTotal;
        }



    }
}
