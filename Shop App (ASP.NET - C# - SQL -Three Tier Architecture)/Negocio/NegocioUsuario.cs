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
    public class NegocioUsuario
    {
        public int CambiarContrasenia(string user, string pass)
        {
            DaoUsuarios _daoUsuarios = new DaoUsuarios();
            return _daoUsuarios.CambiarContrasenia(user, pass);
        }
    }
}
