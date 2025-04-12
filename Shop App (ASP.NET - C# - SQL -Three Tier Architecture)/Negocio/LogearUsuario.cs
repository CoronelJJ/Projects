using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Dao;
using System.Data;

namespace Negocio
{
    public class LogearUsuario
    {
        public LogearUsuario() 
        {

        }

        public object IniciarSesion(string alias, string contrasenia)
        {
            DaoUsuarios daoUsuarios = new DaoUsuarios();
            Usuario usuario = daoUsuarios.ObtenerUsuario(alias, contrasenia);

            if (usuario != null && usuario.Tipo != 'V')
            {
                NegocioClientes negocioClientes = new NegocioClientes();
                return negocioClientes.ObtenerCliente(usuario);
            }

            return usuario;
        }
    }
}
