package controladores;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import modelo.beans.*;
import modelo.datos.*;

/**
 * Servlet implementation class UsuarioServlet
 */
@WebServlet("/Usuario")
public class UsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public UsuarioServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		// aqui va todo el codigo
		System.out.println("##Dentro de UsuarioServlet##");
		String op = request.getParameter("op");
		String url = "index.jsp";
		HttpSession sesion;
	    response.setContentType("text/html");
	    
		//generamos las referencias de los objetos a llenar
		Usuarios u = new Usuarios();
		UsuarioDAO udao = new UsuarioDAO();
		switch (op) {
			case "L":// caso de login
				// verificamos que los datos son de algun usuario en la bd
				String Usuario = request.getParameter("Usuario");
				String Password = request.getParameter("Password");
				u = udao.ValidarUsuarios(Usuario,Password);
				
				if (u.getNombre() != null) {
					// si existe el usuario en la base de datos
					// creamos un objeto usuario con sus datos para saber de que tipo es
					System.out.println("Existe el usuario en la BD");
					PrintWriter out = response.getWriter();
					out.println("alert('');");
					if(u.getEstatus().equals("I"))
					{
						System.out.println("El usuario ha sido inhabilitado");
						out.print("alert( 'El usuario ha sido inhabilitado, comuniquese con "
								+ "el administrador.' );");
					}else if(u.getEstatus().equals("A"))
					{
						sesion = request.getSession(true);
						//hacemos que la sesion nunca expire con un -1
						sesion.setMaxInactiveInterval(-1);
						sesion.setAttribute("usuario", u);
						url=modelo.datos.Constantes.PAGINAPRINCIPAL;
					}
					
				}else
				{
					System.out.println("El usuario no existe, o la contraseña o el nombre de usuario estan mal");
					PrintWriter out = response.getWriter();
					out.println("<tr><td><input type='button' name='Button' value='Search' onclick=\"searchRecord('j');\"></td></tr>");
					
				}
				
			break;
			
			case "CS":
				//sesion = request.getSession();
				//sesion.invalidate();
				request.getSession().invalidate();
				url=modelo.datos.Constantes.LOGIN;
			break;
			
		}

		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
