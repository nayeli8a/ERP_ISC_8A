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

import modelo.beans.Ciudades;
import modelo.beans.Deducciones;
import modelo.beans.Estado;
import modelo.datos.CiudadesDAO;
import modelo.datos.DeduccionesDAO;
import modelo.datos.EstadoDAO;

/**
 * Servlet implementation class DeduccionesServlet
 */
@WebServlet("/Deducciones")
public class DeduccionesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeduccionesServlet() {
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
				System.out.println("##Dentro de DeduccionesServlet##");
				String url = "index.jsp";
				HttpSession sesion;
				String op = request.getParameter("op");
				
				switch(op)
				{
					case "Listar":
						DeduccionesDAO ddao = new DeduccionesDAO();
						String pagina = request.getParameter("pagina");
						List<Deducciones> datos = ddao.consultar(pagina);
						request.setAttribute("datos", datos);
						request.setAttribute("pagina",pagina);
						url=modelo.datos.Constantes.REGRESAR_RH_CONSULTA+"deducciones.jsp";
					break;
					case "Editar":
						ddao = new DeduccionesDAO();
						Deducciones datosdeducciones = ddao.consultaIndividual(Integer.parseInt(request.getParameter("id")));
						request.setAttribute("datosdeducciones", datosdeducciones);
						url=modelo.datos.Constantes.REGRESAR_RH_EDITAR+"deducciones.jsp";
						break;
					case "Eliminar":
						ddao = new DeduccionesDAO();
						ddao.eliminar(request.getParameter("id"));
						url = "Deducciones?op=Listar";
						break;
					case "Modificar":
						Deducciones deducciones = new Deducciones();
						deducciones.setIdDeduccion(Integer.parseInt(request.getParameter("idDeduccion")));
						deducciones.setNombre(request.getParameter("nom_deducciones"));
						deducciones.setDescripcion(request.getParameter("descripcion"));
						deducciones.setPorcentaje(Float.parseFloat(request.getParameter("porcentaje")));
						deducciones.setEstatus(request.getParameter("estatus"));
						ddao = new DeduccionesDAO();
						ddao.actualizar(deducciones);
						url="Deducciones?op=Listar";
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
