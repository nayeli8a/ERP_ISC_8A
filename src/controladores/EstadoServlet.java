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
 * Servlet implementation class EstadoServlet
 */
@WebServlet("/Estado")
public class EstadoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EstadoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		// aqui va todo el codigo
		System.out.println("##Dentro de EstadoServlet##");
		String url = "index.jsp";
		HttpSession sesion;
		String op = request.getParameter("op");
		
		switch(op)
		{
			case "Listar":
				EstadoDAO esdao = new EstadoDAO();
				List<Estado> datos = esdao.consultar();
				request.setAttribute("datos", datos);
				url="/comunes/RecursosHumanos/consultar-estados.jsp";
			break;
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
