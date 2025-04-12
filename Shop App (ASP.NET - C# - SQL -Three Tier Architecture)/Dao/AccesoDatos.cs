using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace Dao
{
    public class AccesoDatos
    {
        public string Ruta { get; set; }

        public AccesoDatos() { }

        public AccesoDatos(string baseDeDatos)
        {
            Ruta = $"Data Source=localhost\\sqlexpress;Initial Catalog={baseDeDatos};Integrated Security=True";
        }

        private SqlConnection ObtenerConexion()
        {
            SqlConnection cn = new SqlConnection(Ruta);

            try
            {
                cn.Open();
                return cn;
            } 
            catch
            {
                return null;
            }
        }

        private SqlDataAdapter ObtenerAdaptador(string consulta, SqlConnection cn)
        {
            try
            {
                return new SqlDataAdapter(consulta, cn);
            }
            catch
            {
                return null;
            }
        }

        public DataTable ObtenerTabla(string nombre, string consulta)
        {
            DataSet ds = new DataSet();
            SqlConnection cn = ObtenerConexion();
            SqlDataAdapter adap = ObtenerAdaptador(consulta, cn);

            try
            {
                adap.Fill(ds, nombre);
                cn.Close();
                return ds.Tables[nombre];
            }
            catch
            {
                return null;
            }
        }

        public int EjecutarProcedimientoAlmacenado(ref SqlCommand cmd, string nombreSp)
        {
            SqlConnection cn = ObtenerConexion();
            cmd.Connection = cn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = nombreSp;

            try
            {
                int filasCambiadas = cmd.ExecuteNonQuery();
                cn.Close();
                return filasCambiadas;

            }
            catch
            {
                return 0;
            }
        }

        public int EjecutarProcAlmacenadoObtenerId(ref SqlCommand cmd, string nombreSp)
        {
            SqlConnection cn = ObtenerConexion();
            cmd.Connection = cn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = nombreSp;

            try
            {
                int id = Convert.ToInt32(cmd.ExecuteScalar());
                cn.Close();
                return id;
            }
            catch
            {
                return 0;
            }
        }

        public int EjecutarConsulta(string consulta)
        {
            SqlConnection cn = ObtenerConexion();
            SqlCommand cmd = new SqlCommand(consulta, cn);
            
            try
            {
                int filasCambiadas = cmd.ExecuteNonQuery();
                cn.Close();
                return filasCambiadas;
            }
            catch
            {
                return 0;
            }
        }

        public bool ExisteRegistro(string consulta)
        {
            SqlConnection cn = ObtenerConexion();
            SqlCommand cmd = new SqlCommand(consulta, cn);
            SqlDataReader dr = cmd.ExecuteReader();

            try
            {
                bool existe = dr.Read();
                cn.Close();
                return existe;
            }
            catch
            {
                return false;
            }
        }

        public DataTable ObtenerTablaDesdeProcedimiento(ref SqlCommand cmd, string nombreSp)
        {
            DataSet ds = new DataSet();
            SqlConnection cn = ObtenerConexion();
            cmd.Connection = cn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = nombreSp;

            SqlDataAdapter adap = new SqlDataAdapter(cmd);


            try
            {
                adap.Fill(ds,"tabla");
                cn.Close();
                return ds.Tables["tabla"];
            }
            catch
            {
                return null;
            }
        }
    }
}
