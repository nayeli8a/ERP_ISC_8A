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

import modelo.beans.AusenciasJustificadas;
import modelo.datos.AusenciasJustificadasDAO;



/**
 * Servlet implementation class IncapacidadesServlet
 */
@WebServlet("/AusenciasJustificadas")
public class AusenciasJustificadasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AusenciasJustificadasServlet() {
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
  				System.out.println("##Dentro de AusenciasJustificadasServlet##");
  				String url = "index.jsp";
  				HttpSession sesion;
  				String op = request.getParameter("op");


          switch(op)
          {
          case "Listar":
            AusenciasJustificadasDAO ausJusdao = new AusenciasJustificadasDAO();
              String pagina = request.getParameter("pagina");
            List<AusenciasJustificadas> datos = ausJusdao.consultar(pagina);
            request.setAttribute("datos", datos);
            request.setAttribute("pagina",pagina);
            url=modelo.datos.Constantes.REGRESAR_RH_CONSULTA+"ausenciasJustificadas.jsp";
          break;
          case "Editar":
  					ausJusdao = new AusenciasJustificadasDAO();
  					AusenciasJustificadas datosAusenciasJustificadas = ausJusdao.consultaIndividual(Integer.parseInt(request.getParameter("id")));
  					request.setAttribute("datosAusenciasJustificadas", datosAusenciasJustificadas);
  					url=modelo.datos.Constantes.REGRESAR_RH_EDITAR+"ausenciasJustificadas.jsp";
  					break;
  				case "Eliminar":
  					ausJusdao = new AusenciasJustificadasDAO();
  					ausJusdao.eliminar(request.getParameter("id"));
  					url = "AusenciasJustificadas?op=Listar&pagina=1";
  					break;
          case "Modificar":
    					String error = "";
    					String mensaje="";

    				  ausJusdao = new AusenciasJustificadasDAO();

              Date fechaSolicitud = (Date.valueOf(request.getParameter("fechaSolicitud")));
    					Date fechaInicio = (Date.valueOf(request.getParameter("fechaInicio")));
    					Date fechaFin = (Date.valueOf(request.getParameter("fechaFin")));
    					String tipo =request.getParameter("tipo");
    					String estatus = request.getParameter("estatus");
    					int idEmpleadoS=Integer.parseInt(request.getParameter("idEmpleadoS"));
              int idEmpleadoA=Integer.parseInt(request.getParameter("idEmpleadoA"));
    					String nssempleado=  request.getParameter("nss");

    					//validamos que el empleado con el nss dado si existe
    					idEmpleado = ausJusdao.validarNSSEmpleado(nssempleado);
    					if(idEmpleado != -1)
    					{
    						ausJusdao.actualizar(fechaSolicitud,fechaInicio, fechaFin, tipo,idEmpleadoS,idEmpleadoA, estatus);
    						mensaje = "AusenciasJustificadas modificada con exito para el NSS: "+nssempleado;
    						request.setAttribute("Mensajes",mensaje);
    						url="AusenciasJustificadas?op=Listar&pagina=1";
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
