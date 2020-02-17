package controladores;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

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
			case "ListarPCiudades":
				esdao = new EstadoDAO();
				datos = esdao.consultar();
				request.setAttribute("datos", datos);
				url="/comunes/RecursosHumanos/registrar-ciudades.jsp";
			break;
			case "Eliminar":
				esdao = new EstadoDAO();
				esdao.eliminar(request.getParameter("id"));
				url="Estado?op=Listar";
				break;
			case "Editar":
				esdao = new EstadoDAO();
				Estado datosestado = esdao.consultaIndividual(Integer.parseInt(request.getParameter("id")));
				request.setAttribute("datosestado", datosestado);
				url="/comunes/RecursosHumanos/editar-estados.jsp";
				break;
			case "Modificar":
				Estado estado = new Estado();
				estado.setIdEstado(Integer.parseInt(request.getParameter("idestado")));
				estado.setNombre(request.getParameter("nom_estado"));
				estado.setSiglas(request.getParameter("siglas"));
				estado.setEstatus(request.getParameter("estatus"));
				esdao = new EstadoDAO();
				esdao.actualizar(estado);
				url="Estado?op=Listar";
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
