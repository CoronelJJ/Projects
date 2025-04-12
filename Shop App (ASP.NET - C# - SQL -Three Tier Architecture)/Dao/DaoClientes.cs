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
    public class DaoClientes
    {
        private AccesoDatos _datos = new AccesoDatos("TPIntegradorGrupo6");

        public DaoClientes() { }

        public int ModificarCliente(Cliente cli)
        {
            SqlCommand cmd = new SqlCommand();
            ArmarParametrosModificar(ref cmd, cli);
            return _datos.EjecutarProcedimientoAlmacenado(ref cmd, "sp_ModificarCliente");
        }

        public DataTable ObtenerClientes()
        {
            string consulta = "SELECT DNI, Nombre, Apellido," +
                "C.Alias, Telefono, Email, Direccion," +
                "C.CodigoCiudad, NombreCiudad, CodigoProvincia," +
                "Contrasenia, Tipo, LU.Estado " +
                "FROM CLIENTES C INNER JOIN LOGINUSUARIOS LU ON C.Alias = LU.Alias " +
                "INNER JOIN CIUDAD CI ON C.CodigoCiudad = CI.CodigoCiudad";

            return _datos.ObtenerTabla("Clientes", consulta);
        }

        public DataTable ObtenerDetalleDeVenta(Cliente cliente, int id)
        {
            string consulta = "SELECT DV.IDVenta as Venta, " +
                "A.NombreArticulo as Articulo, " +
                "(DV.Cantidad * DV.PrecioUnitario) as PrecioTotal, " +
                "DV.Cantidad, " +
                "V.FechaVenta " +
                "FROM ARTICULOS as A INNER JOIN DETALLEVENTAS as DV ON A.IDArticulo = DV.IDArticulo " +
                "INNER JOIN VENTAS as V ON V.IDVenta = DV.IDVenta " +
                $"WHERE V.DNICliente = {cliente.Dni} AND DV.IDVenta = {id}";

            return _datos.ObtenerTabla("Clientes", consulta);
        }

        public DataTable ObtenerHistorial(long dni)
        {
            string consulta = $"SELECT IDVenta, PrecioTotal, FechaVenta FROM VENTAS WHERE DNICliente = {dni}";
            return _datos.ObtenerTabla("Historial", consulta);
        }

        public int BorrarCliente(int id)
        {
            return _datos.EjecutarConsulta($"DELETE FROM Clientes WHERE Dni = {id}");
        }

        public int AgregarCliente(Cliente cliente)
        {
            SqlCommand cmd = new SqlCommand();
            ArmarParametrosAgregar(ref cmd, cliente);
            return _datos.EjecutarProcedimientoAlmacenado(ref cmd, "sp_RegistrarCliente");
        }

        public bool ExisteCliente(Cliente cliente)
        {
            string consulta = "SELECT DNI, Alias FROM CLIENTES C INNER JOIN LOGINUSUARIOS LU " +
                $"ON LU.Alias = C.Alias WHERE C.DNI = {cliente.Dni} OR C.Alias = '{cliente.Usuario.Alias}'";

            return _datos.ExisteRegistro(consulta);
        }

        private void ArmarParametrosModificar(ref SqlCommand cmd, Cliente cli)
        {
            cmd.Parameters.AddWithValue("@DNI", cli.Dni);
            cmd.Parameters.AddWithValue("@APELLIDO", cli.Apellido);
            cmd.Parameters.AddWithValue("@NOMBRE", cli.Nombre);
            cmd.Parameters.AddWithValue("@TELEFONO", cli.Telefono);
            cmd.Parameters.AddWithValue("@EMAIL", cli.Email);
            cmd.Parameters.AddWithValue("@DIRECCION", cli.Direccion);
            cmd.Parameters.AddWithValue("@CODCIUDAD", cli.Ciudad.Codigo);
        }

        private void ArmarParametrosAgregar(ref SqlCommand cmd, Cliente cli)
        {
            cmd.Parameters.AddWithValue("@ALIAS", cli.Usuario.Alias);
            cmd.Parameters.AddWithValue("@CONTRASENIA", cli.Usuario.Contrasenia);
            cmd.Parameters.AddWithValue("@DNI",  cli.Dni);
            cmd.Parameters.AddWithValue("@APELLIDO", cli.Apellido);
            cmd.Parameters.AddWithValue("@NOMBRE", cli.Nombre);
            cmd.Parameters.AddWithValue("@TELEFONO", cli.Telefono);
            cmd.Parameters.AddWithValue("@EMAIL", cli.Email);
            cmd.Parameters.AddWithValue("@DIRECCION", cli.Direccion);
            cmd.Parameters.AddWithValue("@CODIGOCIUDAD", cli.Ciudad.Codigo);
        }
    }
}
