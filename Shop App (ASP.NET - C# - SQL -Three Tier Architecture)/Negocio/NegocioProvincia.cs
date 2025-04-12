using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dao;
using System.Data;
using Entidades;

namespace Negocio
{
    public class NegocioProvincia
    {
        private DaoProvincia _dao = new DaoProvincia();
        private DataTable _provincias;

        public NegocioProvincia() 
        {
            _provincias = _dao.ObtenerProvincias();
        }
        public DataTable ObtenerProvincias(bool actualizar = false) 
        {
            if (actualizar)
            {
                _provincias = _dao.ObtenerProvincias();
            }

            return _provincias;
        }

        public Provincia ObtenerProvincia(int idProvincia)
        {
            try
            {
                DataRow fila = _provincias.Rows[idProvincia - 1];
                Provincia provincia = new Provincia
                {
                    Codigo = idProvincia,
                    Nombre = fila.Field<string>("Provincia")
                };

                return provincia;
            }
            catch
            {
                return null;
            }
        }
    }
}
