package controladores;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.beans.Horarios;
import modelo.datos.HorariosDAO;


/**
 * Servlet implementation class EmpleadosServlet
 */
 @WebServlet("/Horarios")
 public class HorariosServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   public HorariosServlet() {
       super();
   }


   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		System.out.println("##Dentro de HorariosServlet##");

 		String op = request.getParameter("op");
 		String url = "";

    //HORARIOS
		Horarios h = new Horarios();
		HorariosDAO hdao = new HorariosDAO();


    switch (op) {
    case "Listar":
		String pagina = request.getParameter("pagina");
		List<Horarios> datos = hdao.consultar(pagina);
		request.setAttribute("datos", datos);
		request.setAttribute("pagina",pagina);
		url=modelo.datos.Constantes.REGRESAR_RH_CONSULTA+"horarios.jsp";
	break;
	case "Editar":
		Horarios datoshorarios = hdao.consultaIndividual(Integer.parseInt(request.getParameter("id")));
		request.setAttribute("datoshorarios", datoshorarios);
		url=modelo.datos.Constantes.REGRESAR_RH_EDITAR+"horarios.jsp";
		break;
	case "Eliminar":
		hdao.eliminar(request.getParameter("id"));
		url = "Horarios?op=Listar&pagina=1";
		break;
	case "Modificar":
		//obtener los valores del jsp editar,almacenarlos y actualizar el horario del id 
		break;
		}

    RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
  
 }
