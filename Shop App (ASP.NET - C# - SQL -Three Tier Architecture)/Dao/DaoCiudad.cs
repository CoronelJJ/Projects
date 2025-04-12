using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace Dao
{
    public class DaoCiudad
    {
        private AccesoDatos _datos = new AccesoDatos("TPIntegradorGrupo6");

        public DaoCiudad() { }

        public DataTable ObtenerCiudades()
        {
            string consulta = "SELECT C.*, NombreProvincia " +
                "FROM CIUDAD C INNER JOIN PROVINCIA P ON C.CodigoProvincia = P.CodigoProvincia";

            return _datos.ObtenerTabla("Ciudades", consulta);
        }
    }
}
