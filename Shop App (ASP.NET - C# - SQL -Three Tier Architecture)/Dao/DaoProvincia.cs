using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace Dao
{
    public class DaoProvincia
    {
        private AccesoDatos _datos = new AccesoDatos("TPIntegradorGrupo6");

        public DaoProvincia() { }

        public DataTable ObtenerProvincias()
        {
            return _datos.ObtenerTabla("Provincias", "SELECT * FROM PROVINCIA");
        }
    }
}
