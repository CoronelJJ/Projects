using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Cliente
    {
        public long Dni { get; set; }
        public string Apellido { get; set; }
        public string Nombre { get; set; }
        public Usuario Usuario { get; set; }
        public string Telefono { get; set; }
        public string Email { get; set; }
        public string Direccion { get; set; }
        public Ciudad Ciudad { get; set; }

        public Cliente() { }

        public Cliente(int dni, string apellido, string nombre, Usuario usuario, string telefono, string email, string direccion, Ciudad ciudad)
        {
            Dni = dni;
            Apellido = apellido;
            Nombre = nombre;
            Usuario = usuario;
            Telefono = telefono;
            Email = email;
            Direccion = direccion;
            Ciudad = ciudad;
        }
    }
}
