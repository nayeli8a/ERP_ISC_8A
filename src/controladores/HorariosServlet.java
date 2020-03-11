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

import modelo.beans.*;
import modelo.datos.*;

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
				List<Horarios> datos = hdao.consultar();
				request.setAttribute("datoshorarios",datos);
				url=modelo.datos.Constantes.REGRESAR_RH_CONSULTA+"horarios.jsp";
			break;
		}

    RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
  
 }
