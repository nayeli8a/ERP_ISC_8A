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
 * Servlet implementation class CiudadesServlet
 */
@WebServlet("/Ciudades")
public class CiudadesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CiudadesServlet() {
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
				System.out.println("##Dentro de CiudadesServlet##");
				String url = "index.jsp";
				HttpSession sesion;
				String op = request.getParameter("op");
				
				switch(op)
				{
					case "Listar":
						//CIUDADES
						CiudadesDAO cdao = new CiudadesDAO();
						String pagina = request.getParameter("pagina");
						List<Ciudades> datos = cdao.consultar(pagina);
						request.setAttribute("datos", datos);
						request.setAttribute("pagina",pagina);
						url=modelo.datos.Constantes.REGRESAR_RH_CONSULTA+"estados.jsp";
						//ESTADOS
						EstadoDAO edao = new EstadoDAO();
						List<Estado> est = edao.consultar();
						request.setAttribute("datosestados",est);
						
						url=modelo.datos.Constantes.REGRESAR_RH_CONSULTA+"ciudades.jsp";
					break;
					case "Editar":
						cdao = new CiudadesDAO();
						EstadoDAO esdao = new EstadoDAO();
						Ciudades datosciudad = cdao.consultaIndividual(Integer.parseInt(request.getParameter("id")));
						Estado datosestado = esdao.consultaIndividual(datosciudad.getIdEstado());
						List<Estado> datosestados = esdao.consultar(null);
						request.setAttribute("datosciudad", datosciudad);
						request.setAttribute("datosestado",datosestado);
						request.setAttribute("datosestados",datosestados);
						url=modelo.datos.Constantes.REGRESAR_RH_EDITAR+"ciudades.jsp";
						break;
					case "Eliminar":
						cdao = new CiudadesDAO();
						cdao.eliminar(request.getParameter("id"));
						url = "Ciudades?op=Listar&pagina=1";
						break;
					case "Modificar":
						Ciudades ciudades = new Ciudades();
						ciudades.setIdEstado(Integer.parseInt(request.getParameter("idEstado")));
						ciudades.setNombre(request.getParameter("nom_ciudad"));
						ciudades.setEstatus(request.getParameter("estatus"));
						ciudades.setIdCiudad(Integer.parseInt(request.getParameter("idCiudad")));
						cdao = new CiudadesDAO();
						cdao.actualizar(ciudades);
						url="Ciudades?op=Listar&pagina=1";
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
