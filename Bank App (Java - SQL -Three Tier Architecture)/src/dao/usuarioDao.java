package dao;

import entidad.Usuario;

public interface usuarioDao {
	Usuario obtenerUsuario(String nombreUsuario, String contraseñaUsuario);

	int agregarUsuario(Usuario usuario);
}
