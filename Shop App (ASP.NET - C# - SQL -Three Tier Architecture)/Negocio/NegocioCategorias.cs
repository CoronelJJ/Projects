using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Entidades;
using Dao;

namespace Negocio
{
    public class NegocioCategorias
    {
        private DaoCategorias _dao = new DaoCategorias();
        private DataTable _categorias;

        public NegocioCategorias() 
        {
            _categorias = _dao.ObtenerCategorias();
        }

        public DataTable ObtenerCategorias(bool actualizar = false)
        {
            if (actualizar)
            {
                _categorias = _dao.ObtenerCategorias();
            }

            return _categorias;
        }

        public Categoria ObtenerCategoria(int idCategoria)
        {
            try
            {
                DataRow fila = _categorias.Rows[idCategoria - 1];
                Categoria categoria = new Categoria
                {
                    Id = idCategoria,
                    Nombre = fila.Field<string>("Categoria"),
                    Descripcion = fila.Field<string>("Descripcion"),
                };

                return categoria;
            }
            catch
            {
                return null;
            }
        }

        public bool AgregarCategoria(Categoria cat)
        {
            return _dao.AgregarCategoria(cat) == 1;
        }
        public bool EliminarCategoria(int id)
        {
            return _dao.BorrarCategoria(id) == 1;
        }

        public bool ModificarCategorias(Categoria cat)
        {
            return _dao.ModificarCategoria(cat) == 1;
        }
    }
}
