package controladores;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.beans.*;
import modelo.datos.*;

@WebServlet("/Nominas")
public class NominasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public NominasServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("op");
		String pagina="";
		String url = Constantes.REGRESAR_RH;
		
		
		//NOMINAS
		Nominas nom = new Nominas();
		//NOMINAS DAO
		NominasDAO nomDAO = new NominasDAO();
		
		
		
		switch(op)
		{
			case "Listar":
				pagina = request.getParameter("pagina");
				List<Nominas> datos = nomDAO.Consultar(pagina);
				request.setAttribute("datos",datos);
				request.setAttribute("pagina",pagina);
				url = Constantes.REGRESAR_RH_CONSULTA+"nominas.jsp";
				break;
				
			case "Eliminar":
				break;	
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
