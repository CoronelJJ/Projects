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
    public class NegocioClientes
    {
        private DaoClientes _dao = new DaoClientes();
        private DataTable _clientes;
        public NegocioClientes() 
        {
            _clientes = _dao.ObtenerClientes();
            _clientes.PrimaryKey = new DataColumn[] { _clientes.Columns["Alias"] };
        }

        public DataTable ObtenerClientes(bool actualizar = false)
        {
            if (actualizar)
            {
                _clientes = _dao.ObtenerClientes();
            }

            return _clientes;
        }

        public Cliente ObtenerCliente(Usuario usuario)
        {
            try
            {
                DataRow fila = _clientes.Rows.Find(usuario.Alias);
                Cliente cliente = new Cliente
                {
                    Apellido = fila.Field<string>("Apellido"),
                    Nombre = fila.Field<string>("Nombre"),
                    Dni = fila.Field<long>("DNI"),
                    Direccion = fila.Field<string>("Direccion"),
                    Telefono = fila.Field<string>("Telefono"),
                    Email = fila.Field<string>("EMail"),
                    Ciudad = new Ciudad
                    {
                        Codigo = fila.Field<int>("CodigoCiudad"),
                        Nombre = fila.Field<string>("NombreCiudad"),
                        Provincia = new Provincia
                        {
                            Codigo = fila.Field<int>("CodigoProvincia")
                        }
                    },
                    Usuario = usuario
                };

                return cliente;
            }
            catch
            {
                return null;
            }
        }
        public DataTable ObtenerDetalleVenta(Cliente cliente,int id)
        {
            return _dao.ObtenerDetalleDeVenta(cliente, id);
        }
        public DataTable ObtenerHistorial(Cliente cliente)
        {
            return _dao.ObtenerHistorial(cliente.Dni);
        }

        public bool EliminarCliente(int dni)
        {
            return _dao.BorrarCliente(dni) == 1;
        }
        public bool ModificarCliente(Cliente cliente)
        {
            return _dao.ModificarCliente(cliente) == 1;
        }

        public bool AgregarCliente(Cliente cliente)
        {
            return _dao.AgregarCliente(cliente) == 1;
        }

        public bool ExisteCliente(Cliente cliente)
        {
            return _dao.ExisteCliente(cliente);
        }
    }
}



    

