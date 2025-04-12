using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Ciudad
    {
        public int Codigo { get; set; }
        public string Nombre { get; set; }
        public Provincia Provincia { get; set; }

        public Ciudad() { }

        public Ciudad(int codigo, string nombre, Provincia provincia)
        {
            Codigo = codigo;
            Nombre = nombre;
            Provincia = provincia;
        }
    }
}
