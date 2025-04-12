using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Entidades;
using Dao;

namespace Negocio
{
    public class NegocioArticulos
    {
        private DaoArticulos _dao = new DaoArticulos();
        private DataTable _articulos;

        public NegocioArticulos() 
        {
            _articulos = _dao.ObtenerArticulos();
        }

        public DataTable ObtenerArticulos(bool actualizar = false)
        {
            if (actualizar)
            {
                _articulos = _dao.ObtenerArticulos();
            }

            return _articulos;
        }

        public Articulo ObtenerArticulo(int idArticulo)
        {
            try
            {
                DataRow fila = _articulos.Rows[idArticulo - 1];
                Articulo articulo = new Articulo
                {
                    Id = idArticulo,
                    Nombre = fila.Field<string>("Articulo"),
                    PrecioCompra = fila.Field<decimal>("Precio Compra"),
                    PrecioVenta = fila.Field<decimal>("Precio Venta"),
                    Stock = fila.Field<int>("Stock"),
                    Categoria = new Categoria
                    {
                        Nombre = fila.Field<string>("Categoria")
                    },
                    Proveedor = new Proveedor
                    {
                        Nombre = fila.Field<string>("Proveedor")
                    },
                    Estado = fila.Field<bool>("Estado"),
                };

                return articulo;
            }
            catch
            {
                return null;
            }
        }
        public DataTable ObtenerArticuloPorNombre(string nombreArticulo)
        {
            return _dao.ObtenerArticuloPorNombre(nombreArticulo);
        }
        public bool AgregarArticulo(Articulo art)
        {
            return _dao.AgregarArticulo(art) == 1;
        }
        public bool ModificarArticulo(Articulo art)
        {
            return _dao.ModificarArticulo(art) == 1;
        }
        public bool EliminarArticulo(int id)
        {
            return _dao.BorrarArticulo(id) == 1;
        }
    }
}
