package daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.ClienteDao;
import daoimpl.Conexion;
import entidad.Cliente;


public class clienteDaoImpl implements ClienteDao {

	private static final String insert = "INSERT INTO cliente(nombreUsuario, DNIcliente, CUILcliente, NombreCliente, ApellidoCliente, SexoCliente, NacionalidadCliente, FechaNacimientoCliente, DireccionCliente, LocalidadCliente, idProvincias, EmailCliente, TelefonoCliente, ClienteActivo) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String delete = "DELETE FROM cliente WHERE idcliente = ?";
	private static final String selectAll = "SELECT * FROM cliente";
	private static final String update = "UPDATE cliente SET nombreUsuario = ?, DNIcliente = ?, CUILcliente = ?, NombreCliente = ?, ApellidoCliente = ?, SexoCliente = ?, NacionalidadCliente = ?, FechaNacimientoCliente = ?, DireccionCliente = ?, LocalidadCliente = ?, idProvincias = ?, EmailCliente = ?, TelefonoCliente = ?, ClienteActivo = ? WHERE idcliente = ?";
	
	public int agregarCliente(Cliente cliente) {
		
		
		PreparedStatement statement;
		Connection conexion = Conexion.getConexion().getSQLConexion();
		int filas = 0;
		try
		{
			statement = conexion.prepareStatement(insert);
			 statement.setString(1, cliente.getNombreUsuario());
		        statement.setInt(2, cliente.getDNIcliente());
		        statement.setInt(3, cliente.getCUILcliente());
		        statement.setString(4, cliente.getNombreCliente());
		        statement.setString(5, cliente.getApellidoCliente());
		        statement.setString(6, String.valueOf(cliente.getSexoCliente())); // Convertimos char a String
		        statement.setString(7, cliente.getNacionalidadCliente());
		        statement.setDate(8, java.sql.Date.valueOf(cliente.getFechaNacimientoCliente())); // Convertimos LocalDate a Date
		        statement.setString(9, cliente.getDireccionCliente());
		        statement.setString(10, cliente.getLocalidadCliente());
		        statement.setInt(11, cliente.getIdProvincias());
		        statement.setString(12, cliente.getEmailCliente());
		        statement.setLong(13, cliente.getTelefonoCliente());
		        statement.setString(14, String.valueOf(cliente.getClienteActivo())); // Convertimos char a String
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


	public int eliminarCliente(Cliente cliente) {
		
		PreparedStatement statement;
	    Connection conexion = Conexion.getConexion().getSQLConexion();
	    int filas = 0;
	    try {
	        statement = conexion.prepareStatement(delete);
	        statement.setInt(1, cliente.getIdCliente());
	        filas = statement.executeUpdate();
	        if (filas > 0) {
	            conexion.commit();
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        try {
	            conexion.rollback();
	        } catch (SQLException e1) {
	            e1.printStackTrace();
	        }
	    }
	    return filas;
	}


	public int modificarCliente(Cliente cliente) {
		
		  PreparedStatement statement;
		    Connection conexion = Conexion.getConexion().getSQLConexion();
		    int filas = 0;
		    try {
		        statement = conexion.prepareStatement(update);
		        statement.setString(1, cliente.getNombreUsuario());
		        statement.setInt(2, cliente.getDNIcliente());
		        statement.setInt(3, cliente.getCUILcliente());
		        statement.setString(4, cliente.getNombreCliente());
		        statement.setString(5, cliente.getApellidoCliente());
		        statement.setString(6, String.valueOf(cliente.getSexoCliente()));
		        statement.setString(7, cliente.getNacionalidadCliente());
		        statement.setDate(8, java.sql.Date.valueOf(cliente.getFechaNacimientoCliente()));
		        statement.setString(9, cliente.getDireccionCliente());
		        statement.setString(10, cliente.getLocalidadCliente());
		        statement.setInt(11, cliente.getIdProvincias());
		        statement.setString(12, cliente.getEmailCliente());
		        statement.setLong(13, cliente.getTelefonoCliente());
		        statement.setString(14, String.valueOf(cliente.getClienteActivo()));
		        statement.setInt(15, cliente.getIdCliente());
		        
		        filas = statement.executeUpdate();
		        if (filas > 0) {
		            conexion.commit();
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		        try {
		            conexion.rollback();
		        } catch (SQLException e1) {
		            e1.printStackTrace();
		        }
		    }
		    return filas;
	}


	
	public ArrayList<Cliente> listarClientes() {
	    PreparedStatement statement;
	    Connection conexion = Conexion.getConexion().getSQLConexion();
	    ArrayList<Cliente> clientes = new ArrayList<>();
	    try {
	        statement = conexion.prepareStatement(selectAll);
	        ResultSet resultSet = statement.executeQuery();
	        while (resultSet.next()) {
	            Cliente cliente = new Cliente(); // Crear un nuevo objeto Cliente en cada iteración
	            cliente.setIdCliente(resultSet.getInt("idcliente"));
	            cliente.setNombreUsuario(resultSet.getString("nombreUsuario"));
	            cliente.setDNIcliente(resultSet.getInt("DNIcliente"));
	            cliente.setCUILcliente(resultSet.getInt("CUILcliente"));
	            cliente.setNombreCliente(resultSet.getString("NombreCliente"));
	            cliente.setApellidoCliente(resultSet.getString("ApellidoCliente"));
	            cliente.setSexoCliente(resultSet.getString("SexoCliente").charAt(0));
	            cliente.setNacionalidadCliente(resultSet.getString("NacionalidadCliente"));
	            cliente.setFechaNacimientoCliente(resultSet.getDate("FechaNacimientoCliente").toLocalDate());
	            cliente.setDireccionCliente(resultSet.getString("DireccionCliente"));
	            cliente.setLocalidadCliente(resultSet.getString("LocalidadCliente"));
	            cliente.setIdProvincias(resultSet.getInt("idProvincias"));
	            cliente.setEmailCliente(resultSet.getString("EmailCliente"));
	            cliente.setTelefonoCliente(resultSet.getInt("TelefonoCliente"));
	            cliente.setClienteActivo(resultSet.getString("ClienteActivo").charAt(0));
	            clientes.add(cliente);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return clientes;
	}
}
