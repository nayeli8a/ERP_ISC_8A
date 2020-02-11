package controladores;

import java.io.IOException;
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
					// creamos un usuario con sus datos para saber de que tipo es
					System.out.println("Existe el usuario en la BD");
					
					sesion = request.getSession(true);
					sesion.setAttribute("usuario", u);
					u = (Usuarios) sesion.getAttribute("usuario");
					url="/comunes/RecursosHumanos/registrar-estados.jsp";
				}
			break;
			
			case "CS":
				sesion = request.getSession();
				sesion.invalidate();
				url="index.jsp";
			break;
			
		}

		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
