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

import modelo.beans.Deducciones;
import modelo.beans.Percepciones;
import modelo.datos.DeduccionesDAO;
import modelo.datos.PercepcionesDAO;

/**
 * Servlet implementation class PercepcionesServlet
 */
@WebServlet("/Percepciones")
public class PercepcionesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PercepcionesServlet() {
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
		System.out.println("##Dentro de PercepcionesServlet##");
		String url = "index.jsp";
		HttpSession sesion;
		String op = request.getParameter("op");
		
		switch(op)
		{
			case "Listar":
				PercepcionesDAO pdao = new PercepcionesDAO();
				List<Percepciones> datos = pdao.consultar();
				request.setAttribute("datos", datos);
				url=modelo.datos.Constantes.REGRESAR_RH_CONSULTA+"percepciones.jsp";
			break;
			case "Editar":
				pdao = new PercepcionesDAO();
				Percepciones datospercepciones = pdao.consultaIndividual(Integer.parseInt(request.getParameter("id")));
				request.setAttribute("datospercepciones", datospercepciones);
				url=modelo.datos.Constantes.REGRESAR_RH_EDITAR+"percepciones.jsp";
				break;
			case "Eliminar":
				pdao = new PercepcionesDAO();
				pdao.eliminar(request.getParameter("id"));
				url = "Percepciones?op=Listar";
				break;
			case "Modificar":
				Percepciones percepciones = new Percepciones();
				percepciones.setIdPercepcion(Integer.parseInt(request.getParameter("idpercepcion")));
				percepciones.setNombre(request.getParameter("nom_percepciones"));
				percepciones.setDescripcion(request.getParameter("descripcion"));
				percepciones.setDiasPagar(Integer.parseInt(request.getParameter("diasPagar")));
				percepciones.setEstatus(request.getParameter("estatus"));
				pdao = new PercepcionesDAO();
				pdao.actualizar(percepciones);
				url="Percepciones?op=Listar";
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
