using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Entidades;

namespace Dao
{
    public class DaoUsuarios
    {
        private AccesoDatos _datos = new AccesoDatos("TPIntegradorGrupo6");

        public DaoUsuarios() { }

        public Usuario ObtenerUsuario(string alias, string contrasenia)
        {

            try
            {
                string consulta = "SELECT Alias, Contrasenia, Tipo " +
                    $"FROM LOGINUSUARIOS WHERE Estado = 1 AND Alias = '{alias}' AND Contrasenia = '{contrasenia}'";
                
                DataRow dato = _datos.ObtenerTabla("Usuario", consulta).Rows[0];
                return new Usuario
                {
                    Alias = dato.Field<string>("Alias"),
                    Contrasenia = dato.Field<string>("Contrasenia"),
                    Tipo = dato.Field<string>("Tipo")[0],
                    Estado = true
                };
            }
            catch
            {
                return null;
            }
        }

        public int CambiarContrasenia(string user, string password)
        {
            string consulta = $"UPDATE LOGINUSUARIOS SET Contrasenia = '{password}' WHERE Alias = '{user}'";
            return _datos.EjecutarConsulta(consulta);
        }
    }
}
