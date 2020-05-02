package controladores;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.datos.AusenciasJustificadasDAO;

/**
 * Servlet implementation class AJAXServlet
 */
@WebServlet("/AJAX")
public class AJAXServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AJAXServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("op");
		switch(op)
		{
			case "BuscarNSS":
				//ponemos el modo de respuestas en text/html para poder mandar objetos html
				response.setContentType("text/html");
				op="";//dejamos la op en vacio para que si envian de un form no AJAX
				
	  			String nombre = request.getParameter("nombre");
	  			String apaterno = request.getParameter("apaterno");
	  			String amaterno = request.getParameter("amaterno");
	  			
	  			//buscamos en la base de datos los nss 
	  			AusenciasJustificadasDAO ajdao = new AusenciasJustificadasDAO();
	  			List<String> datos = ajdao.nssEmpleado(nombre, apaterno, amaterno);
	  			String aux="";
	  			aux+="<div style=\"border: solid\">";
	  			for (int i = 0; i < datos.size(); i++) {
					aux+="<label>"+datos.get(i)+"</label><br>";
				}
	  			aux+="</div>";
	  			response.getWriter().write(aux);
			break;
  			
		}
	}

}
