package controladores;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.beans.Incapacidades;
import modelo.datos.IncapacidadesDAO;

/**
 * Servlet implementation class IncapacidadesServlet
 */
@WebServlet("/Incapacidades")
public class IncapacidadesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IncapacidadesServlet() {
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
				System.out.println("##Dentro de IncapacidadesServlet##");
				String url = "index.jsp";
				HttpSession sesion;
				String op = request.getParameter("op");
				
				switch(op)
				{
				case "Listar":
					IncapacidadesDAO indao = new IncapacidadesDAO();
				    String pagina = request.getParameter("pagina");
					List<Incapacidades> datos = indao.consultar(pagina);
					request.setAttribute("datos", datos);
					request.setAttribute("pagina",pagina);
					url=modelo.datos.Constantes.REGRESAR_RH_CONSULTA+"incapacidades.jsp";
				break;
				case "Editar":
					indao = new IncapacidadesDAO();
					Incapacidades datosIncapacidades = indao.consultaIndividual(Integer.parseInt(request.getParameter("id")));
					request.setAttribute("datosIncapacidades", datosIncapacidades);
					url=modelo.datos.Constantes.REGRESAR_RH_EDITAR+"incapacidades.jsp";
					break;
				case "Eliminar":
					indao = new IncapacidadesDAO();
					indao.eliminar(request.getParameter("id"));
					url = "Incapacidades?op=Listar&pagina=1";
					break;
				case "Modificar":
				    indao = new IncapacidadesDAO();
					Incapacidades in = new Incapacidades ();
					in.setFechaInicio(Date.valueOf(request.getParameter("fechaInicio")));
					in.setFechaFin(Date.valueOf(request.getParameter("fechaFin")));
					in.setEnfermedad(request.getParameter("enfermedad"));
					in.setEvidencia(null);
					in.setIdEmpleado(Integer.valueOf(request.getParameter("idEmpleado")));
					in.setEstatus(request.getParameter("estatus"));
					in.setIdIncapacidad(Integer.valueOf(request.getParameter("idIncapacidad")));
					indao.actualizar(in);
					url = "Incapacidades?op=Listar&pagina=1";
					System.out.println("##modificar##");
					System.out.println(in.getFechaInicio());
					System.out.println(in.getFechaFin());
					System.out.println(in.getEnfermedad());
					System.out.println(in.getEvidencia());
					System.out.println(in.getIdEmpleado());
					System.out.println(in.getEstatus());
					System.out.println(in.getIdIncapacidad());
					
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
