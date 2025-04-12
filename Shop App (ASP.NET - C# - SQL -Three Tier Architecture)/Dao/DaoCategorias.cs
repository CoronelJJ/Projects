using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Entidades;
using System.Data.SqlClient;

namespace Dao
{
    public class DaoCategorias
    {
        private AccesoDatos _datos = new AccesoDatos("TPIntegradorGrupo6");

        public DaoCategorias() { }

        public DataTable ObtenerCategorias()
        {
            return _datos.ObtenerTabla("Categorias", "SELECT * FROM CATEGORIAS");
        }

        public int AgregarCategoria(Categoria cat)
        {
            SqlCommand cmd = new SqlCommand();
            ArmarParametrosAgregar(ref cmd, cat);
            return _datos.EjecutarProcedimientoAlmacenado(ref cmd, "sp_AgregarCategoria");
        }

        public int ModificarCategoria(Categoria cat)
        {
            SqlCommand cmd = new SqlCommand();
            ArmarParametrosModificar(ref cmd, cat);
            return _datos.EjecutarProcedimientoAlmacenado(ref cmd, "sp_ModificarCategoria");
        }

        public int BorrarCategoria(int id)
        {
            return _datos.EjecutarConsulta($"DELETE FROM Categorias WHERE IDCategoria = {id}");
        }

        private void ArmarParametrosAgregar(ref SqlCommand cmd, Categoria cat)
        {
            cmd.Parameters.AddWithValue("@NOMBRECAT", cat.Nombre);
            cmd.Parameters.AddWithValue("@DESCRIP", cat.Descripcion);
        }

        private void ArmarParametrosModificar(ref SqlCommand cmd, Categoria cat)
        {
            cmd.Parameters.AddWithValue("@IDCAT", cat.Id);
            cmd.Parameters.AddWithValue("@NOMBRECAT", cat.Nombre);
            cmd.Parameters.AddWithValue("@DESCRIP", cat.Descripcion);
        }
    }
}