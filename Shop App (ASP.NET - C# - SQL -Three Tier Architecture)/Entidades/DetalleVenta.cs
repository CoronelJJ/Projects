using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class DetalleVenta
    {
        public Venta Venta { get; set; }
        public Articulo Articulo { get; set; }
        public decimal PrecioUnitario { get; set; }
        public int Cantidad { get; set; }

        public DetalleVenta()
        {

        }

        public DetalleVenta(Venta venta, Articulo articulo, decimal precioUnitario, int cantidad)
        {
            Venta = venta;
            Articulo = articulo;
            PrecioUnitario = precioUnitario;
            Cantidad = cantidad;
        }
    }
}
