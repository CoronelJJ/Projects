package negocio;

import entidad.Usuario;

public interface usuarioNegocio {
	public Usuario obtenerUsuario(String nombreUsuario, String password);
}
