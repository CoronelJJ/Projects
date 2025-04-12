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
    public class NegocioVentas
    {
        private DaoVentas _dao = new DaoVentas();
        private DataTable _ventas;

        public NegocioVentas() 
        {
            _ventas = _dao.ObtenerVentas();
        }

        public DataTable ObtenerVentas(bool actualizar = false)
        {
            if (actualizar)
            {
                _ventas = _dao.ObtenerVentas();
            }

            return _ventas;
        }

        public Venta ObtenerVenta(int idVenta)
        {
            try
            {
                DataRow fila = _ventas.Rows[idVenta - 1];
                string[] nombreCompleto = fila.Field<string>("Comprador").Split(' ');

                Venta venta = new Venta
                {
                    Id = idVenta,
                    Fecha = fila.Field<DateTime>("Fecha Venta"),
                    Cliente = new Cliente
                    {
                        Nombre = nombreCompleto[0],
                        Apellido = nombreCompleto[1]
                    },
                    PrecioTotal = fila.Field<decimal>("Total")
                };

                return venta;
            }
            catch
            {
                return null;
            }
        }

        public DataTable ObtenerDetalleVentas(Venta venta)
        {
            return _dao.ObtenerDetalleVenta(venta.Id);
        }

        public bool AgregarDetalleVenta(int idVenta, List<DetalleVenta> ventas)
        {
            Venta venta = new Venta();
            venta.Id = idVenta;
            foreach (DetalleVenta detalleVenta in ventas)
            {
                detalleVenta.Venta = venta;
                if (_dao.AgregarDetalleVenta(detalleVenta) == 0)
                    return false;
            }

            return true;
        }

        public int AgregarVenta(Venta venta)
        {
            return _dao.AgregarVenta(venta);
        }
    }
}
