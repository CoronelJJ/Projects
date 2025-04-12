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
    public class NegocioCiudades
    {
        private DaoCiudad _dao = new DaoCiudad();
        private DataTable _ciudades;
        public NegocioCiudades() 
        {
            _ciudades = _dao.ObtenerCiudades();
        }

        public DataTable ObtenerCiudades(bool actualizar = false)
        {
            if (actualizar)
            {
                _ciudades = _dao.ObtenerCiudades();
            }

            return _ciudades;
        }

        public Ciudad ObtenerCiudad(int idCiudad)
        {
            try
            {
                DataRow fila = _ciudades.Rows[idCiudad - 1];
                Ciudad ciudad = new Ciudad
                {
                    Codigo = idCiudad,
                    Nombre = fila.Field<string>("Ciudad"),
                    Provincia = new Provincia
                    {
                        Nombre = fila.Field<string>("Provincia")
                    }
                };

                return ciudad;
            }
            catch
            {
                return null;
            }
        }
    }
}
