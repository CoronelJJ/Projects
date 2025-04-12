using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Usuario
    {
        public string Alias { get; set; }
        public string Contrasenia { get; set; }
        public char Tipo { get; set; }
        public bool Estado { get; set; }


        public Usuario() { }

        public Usuario(string alias, string contrasenia, char tipo, bool estado)
        {
            Alias = alias;
            Contrasenia = contrasenia;
            Tipo = tipo;
            Estado = estado;
        }
    }
}
