using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Venta
    {
        public int Id { get; set; }
        public Cliente Cliente { get; set; }
        public decimal PrecioTotal { get; set; }
        public DateTime Fecha { get; set; }

        
        public Venta()
        {

        }

        public Venta(int id, Cliente cliente, decimal precioTotal, DateTime fecha)
        {
            Id = id;
            Cliente = cliente;
            PrecioTotal = precioTotal;
            Fecha = fecha;
        }
    }
}
