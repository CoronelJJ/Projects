package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entidad.Cliente;
import entidad.Usuario;
import negocioImpl.usuarioNegocioImpl;

/**
 * Servlet implementation class agregarClienteServlet
 */
@WebServlet("/agregarClienteServlet")
public class agregarClienteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public agregarClienteServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("btnAceptar")!=null) {
			Usuario usuario= new Usuario();
			usuario.setNombreUsuario(request.getParameter("txtUsuario"));
			usuario.setContraseñaUsuario(request.getParameter("txtContraseña"));
			usuarioNegocioImpl usuarioNeg= new usuarioNegocioImpl();
			Cliente cliente=new Cliente();
			cliente.setNombreUsuario(request.getParameter("txtUsuario"));
			
			int filas=usuarioNeg.agregarUsuario(usuario);
			String mensaje;
			if(filas>0) {
				mensaje="Cliente agregado con éxito";
			}
			else {
				mensaje="No se pudo agregar al cliente"; //manejar excepción
			}
			 request.setAttribute("mensaje", mensaje);
		     RequestDispatcher rd = request.getRequestDispatcher("AgregarClientes.jsp");
		     rd.forward(request, response);
			
	
		}
	}
}
;