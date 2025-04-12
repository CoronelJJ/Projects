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
    public class NegocioProveedores
    {
        private DaoProveedores _dao = new DaoProveedores();
        private DataTable _proveedores;

        public NegocioProveedores() 
        {
            _proveedores = _dao.ObtenerProveedores();
        }

        public DataTable ObtenerProveedores(bool actualizar = false)
        {
            if (actualizar)
            {
                _proveedores = _dao.ObtenerProveedores();
            }

            return _proveedores;
        }

        public Proveedor ObtenerProveedor(int idProveedor)
        {
            try
            {
                DataRow fila = _proveedores.Rows[idProveedor - 1];
                Proveedor proveedor = new Proveedor
                {
                    Id = idProveedor,
                    Nombre = fila.Field<string>("Proveedor"),
                    Direccion = fila.Field<string>("Direccion"),
                    Telefono = fila.Field<string>("Telefono"),
                    Email = fila.Field<string>("EMail"),
                    Ciudad = new Ciudad
                    {
                        Nombre = fila.Field<string>("Ciudad")
                    },
                    Estado = fila.Field<bool>("Estado")
                };

                return proveedor;
            }
            catch
            {
                return null;
            }
        }

        public bool ModificarProveedor(Proveedor proveedor)
        {
            return _dao.ModificarProveedor(proveedor) == 1;
        }

        public bool AgregarProveedor(Proveedor proveedor)
        {
            return _dao.AgregarProveedor(proveedor) == 1;
        }

        public bool EliminarProveedor(int id)
        {
            return _dao.BorrarProveedor(id) == 1;
        }
    }
}
