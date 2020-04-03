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
import modelo.beans.Departamentos;
import modelo.datos.DeduccionesDAO;
import modelo.datos.DepartamentosDAO;

/**
 * Servlet implementation class DepartamentosServlet
 */
@WebServlet("/Departamentos")
public class DepartamentosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DepartamentosServlet() {
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
						System.out.println("##Dentro de DepartamentoServelet##");
						String url = "index.jsp";
						HttpSession sesion;
						String op = request.getParameter("op");
						
						switch(op)
						{
							case "Listar":
								DepartamentosDAO dedao = new DepartamentosDAO();
							    String pagina = request.getParameter("pagina");
								List<Departamentos> datos = dedao.consultar(pagina);
								request.setAttribute("datos", datos);
								request.setAttribute("pagina",pagina);
								url=modelo.datos.Constantes.REGRESAR_RH_CONSULTA+"departamentos.jsp";
							break;
							case "Editar":
								dedao = new DepartamentosDAO();
								Departamentos datosdepartamentos = dedao.consultaIndividual(Integer.parseInt(request.getParameter("id")));
								request.setAttribute("datosdepartamentos", datosdepartamentos);
								url=modelo.datos.Constantes.REGRESAR_RH_EDITAR+"departamentos.jsp";
								break;
							case "Eliminar":
								dedao = new DepartamentosDAO();
								dedao.eliminar(request.getParameter("id"));
								url = "Departamentos?op=Listar&pagina=1";
								break;
							case "Modificar":
							   Departamentos departamentos = new Departamentos();
							    departamentos.setIdDepartamento(Integer.parseInt(request.getParameter("idDepartamento")));
							    departamentos.setNombre(request.getParameter("nom_departamentos"));
								departamentos.setEstatus(request.getParameter("estatus"));
								dedao = new DepartamentosDAO();
								dedao.actualizar(departamentos);
								url="Departamentos?op=Listar&pagina=1";
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
