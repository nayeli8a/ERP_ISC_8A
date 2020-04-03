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
import modelo.beans.Estado;
import modelo.beans.Puestos;
import modelo.datos.DeduccionesDAO;
import modelo.datos.EstadoDAO;
import modelo.datos.PuestosDAO;

/**
 * Servlet implementation class PuestosServlet
 */
@WebServlet("/Puestos")
public class PuestosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PuestosServlet() {
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
		System.out.println("##Dentro de PuestosServlet##");
		String url = "index.jsp";
		HttpSession sesion;
		String op = request.getParameter("op");
		
		switch(op)
		{
			case "Listar":
				PuestosDAO pdao = new PuestosDAO();
				String pagina = request.getParameter("pagina");
				List<Puestos> datos = pdao.consultar(pagina);
				request.setAttribute("datos", datos);
				request.setAttribute("pagina",pagina);
				url=modelo.datos.Constantes.REGRESAR_RH_CONSULTA+"puestos.jsp";
			break;
			case "Editar":
				pdao = new PuestosDAO();
				Puestos datospuestos = pdao.consultaIndividual(Integer.parseInt(request.getParameter("id")));
				request.setAttribute("datospuestos", datospuestos);
				url=modelo.datos.Constantes.REGRESAR_RH_EDITAR+"puestos.jsp";
				break;
			case "Eliminar":
				pdao = new PuestosDAO();
				pdao.eliminar(request.getParameter("id"));
				url = "Puestos?op=Listar&pagina=1";
				break;
			case "Modificar":
				Puestos puestos = new Puestos();
				puestos.setIdPuesto(Integer.parseInt(request.getParameter("idPuesto")));
				puestos.setNombre(request.getParameter("nom_puestos"));
				puestos.setSalarioMinimo(Float.parseFloat(request.getParameter("salarioMinimo")));
				puestos.setSalarioMaximo(Float.parseFloat(request.getParameter("salarioMaximo")));
				puestos.setEstatus(request.getParameter("estatus"));
				pdao = new PuestosDAO();
				pdao.actualizar(puestos);
				url="Puestos?op=Listar&pagina=1";
				break;
			
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
