package dao;
import java.util.ArrayList;

import entidad.Cliente;

public interface ClienteDao {
public int agregarCliente(Cliente cliente);
public int eliminarCliente(Cliente cliente);
public int modificarCliente(Cliente cliente);
public ArrayList<Cliente> listarClientes();
}
