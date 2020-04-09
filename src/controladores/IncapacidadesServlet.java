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
import modelo.beans.Puestos;
import modelo.datos.IncapacidadesDAO;
import modelo.datos.PuestosDAO;

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
					String error = "";
					String mensaje="";
				    indao = new IncapacidadesDAO();
				   
					Date fechaInicio = (Date.valueOf(request.getParameter("fechaInicio")));
					Date fechaFin = (Date.valueOf(request.getParameter("fechaFin")));
					String enfermedad =request.getParameter("enfermedad");
					String estatus = request.getParameter("estatus");
					int idEmpleado=Integer.parseInt(request.getParameter("idEmpleado"));
					String nssempleado=  indao.obtenernss(idEmpleado);

					//validamos que el empleado con el nss dado si existe
					idEmpleado = indao.validarNSSEmpleado(nssempleado);
					if(idEmpleado != -1)
					{
						indao.actualizar(fechaInicio, fechaFin, enfermedad, null,idEmpleado, estatus);
						mensaje = "Incapacidad modificada con exito para el NSS: "+nssempleado;
						request.setAttribute("Mensajes",mensaje);
						url="Incapacidades?op=Listar&pagina=1";
					}else
					{
						error = "El NSS del empleado no es valido, inserta uno valido.";
						request.setAttribute("Errores",error);
					}
			
					
		
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
