package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daoimpl.usuarioDaoImpl;
import entidad.Usuario;
import negocio.usuarioNegocio;
import negocioImpl.usuarioNegocioImpl;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public LoginServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nombreUsuario = request.getParameter("usuario");
        String passwordUsuario = request.getParameter("contraseña");
       
        usuarioNegocioImpl usuarioNeg= new usuarioNegocioImpl();
        Usuario usuario= usuarioNeg.obtenerUsuario(nombreUsuario,passwordUsuario);
        
        if (usuario != null) {
            HttpSession session = request.getSession();
            session.setAttribute("usuario", nombreUsuario);
        	
            if (usuario.isTipoUsuario()=='A') {
                response.sendRedirect("AdminHome.jsp");
            } else {
                response.sendRedirect("UsuarioHome.jsp");
            }
        } else {
            response.sendRedirect("Login.jsp?error=true");
        }
	}

}
