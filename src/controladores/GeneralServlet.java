package controladores;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.datos.*;

/**
 * Servlet implementation class GeneralServlet
 */
@WebServlet("/General")
public class GeneralServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GeneralServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession sesion;
	    response.setContentType("text/html");
		String op = request.getParameter("op");
		String url="";
		
		switch (op) {
		case "RegresarInicio":
			url = modelo.datos.Constantes.PAGINAPRINCIPAL;
			break;
		case "RegresarRH":
				url=modelo.datos.Constantes.REGRESAR_RH;
			break;

		case "RegresarVentas":
			
			break;
			
		case "RegresarCompras":
			
			break;
			
		case "EvaluaSesion":
			break;
		}
		
		
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
