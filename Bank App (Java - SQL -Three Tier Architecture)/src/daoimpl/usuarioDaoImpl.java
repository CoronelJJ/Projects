package daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.usuarioDao;
import daoimpl.Conexion;
import entidad.Usuario;

public class usuarioDaoImpl implements usuarioDao{
	
	private static final String select = "SELECT * FROM usuario WHERE nombreUsuario = ? AND passwordUsuario = ?";
	private static final String insert= "INSERT INTO usuario (nombreUsuario,passwordUsuario,tipoUsuario) VALUES (?,?,?)";

	@Override
	public Usuario obtenerUsuario(String nombreUsuario, String passwordUsuario) {
		Usuario usuario = null;
        PreparedStatement statement;
        Connection conexion = Conexion.getConexion().getSQLConexion();
        
        try {
        	statement = conexion.prepareStatement(select);
            statement.setString(1, nombreUsuario);
        	statement.setString(2, passwordUsuario);
            ResultSet rs = statement.executeQuery();
    
            if (rs.next()) {
                usuario = getUsuarioFromResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return usuario;
    }

	private Usuario getUsuarioFromResultSet(ResultSet rs) throws SQLException {
        Usuario usuario = new Usuario();
        usuario.setNombreUsuario(rs.getString("nombreUsuario"));
        usuario.setContraseñaUsuario(rs.getString("passwordUsuario"));
        String tipoUsuario=(rs.getString("tipoUsuario"));
        usuario.setTipoUsuario(tipoUsuario.charAt(0));
        String usuarioActivo=(rs.getString("usuarioActivo"));
        usuario.setUsuarioActivo(usuarioActivo.charAt(0));
        return usuario;
    }
		
	public int agregarUsuario(Usuario usuario) {
		{
			PreparedStatement statement;
			Connection conexion = Conexion.getConexion().getSQLConexion();
			int filas = 0;
			try
			{
				statement = conexion.prepareStatement(insert);
				statement.setString(1,usuario.getNombreUsuario() );
				statement.setString(2,usuario.getContraseñaUsuario());
				statement.setString(3, "C");
				filas = statement.executeUpdate();
				if (filas > 0) {
	                conexion.commit();
	            }
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
				try {
					conexion.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
			
			return filas;
	}
}
}
