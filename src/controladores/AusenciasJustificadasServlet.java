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
					AusenciasJustificadas datosAusencia = ausJusdao.consultaIndividual(Integer.parseInt(request.getParameter("id")));
					request.setAttribute("datosAusencia", datosAusencia);
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
					
					int idEmpleadoAusente;
					ausJusdao = new AusenciasJustificadasDAO();
					int idAusencia =(Integer.parseInt((request.getParameter("idAusencia"))));
					Date fechaSolicitud = (Date.valueOf(request.getParameter("fecha-Solicitud")));
					Date fechaInicio = (Date.valueOf(request.getParameter("fechaInicio")));
					Date fechaFin = (Date.valueOf(request.getParameter("fechaFin")));
					String tipo = request.getParameter("tipo");
					String nssAusente = request.getParameter("nssAusente");
					//obtenemos los ID
				    idEmpleadoAusente = ausJusdao.validarNSSEmpleado(nssAusente);
				    //Obtenemos los dias disponibles de permiso 
				    int diasVacaciones= ausJusdao.validarVacaciones(idEmpleadoAusente);
				    int diasPermiso= ausJusdao.validarPermiso(idEmpleadoAusente);
				    //calculamos los dias de permiso
				    int calDias =(Integer.valueOf(request.getParameter("dias"))); 
				
		
					if ("V".equals(tipo)) { // vacaciones
						if (calDias <= diasVacaciones) {
							ausJusdao.actualizar(fechaSolicitud, fechaInicio, fechaFin, tipo, idAusencia);
									
							mensaje = "Ausencia Justificada modificada con exito";
							request.setAttribute("Mensajes", mensaje);

						} else {
							error = "El empleado solo cuenta con " + diasVacaciones + " dias de vacaiones";
							request.setAttribute("Errores", error);
						}

					}
					
					if ("P".equals(tipo)) {// permiso
						if (calDias <= diasPermiso) {
							ausJusdao.actualizar(fechaSolicitud, fechaInicio, fechaFin, tipo, idAusencia);
							mensaje = "Ausencia Justificada modificada con exito";
							request.setAttribute("Mensajes", mensaje);
						}

						else {
							error = "El empleado solo cuenta con " + diasPermiso + "dias de permiso";
							request.setAttribute("Errores", error);
						}

					}
				
			

					url="AusenciasJustificadas?op=Listar&pagina=1";
				break;
            }

            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
      }


      	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      		
      		String op = request.getParameter("op");
      		if(op.equals("AJAX"))
      		{
      			//ponemos el modo de respuestas en text/html para poder mandar objetos html
    			response.setContentType("text/html");
    			op="";//dejamos la op en vacio para que si envian de un form no AJAX 
      			
      			int idAusencia = Integer.parseInt(request.getParameter("Ausencia"));
      			int AoR = Integer.parseInt(request.getParameter("AOR"));
      			AusenciasJustificadasDAO ajdao = new AusenciasJustificadasDAO();
      			
      			
      			//AoR es si fue aceptada=1 o rechazada=2
      			if(AoR == 1)
      			{
      				//vamos a las ausencias y aceptamos la ausencia con idAusencia
      				ajdao.actualizarIndividual(idAusencia,"A");
      				response.getWriter().write("status-"+idAusencia);
      			}else if(AoR==2)
      			{
      				//vamos a las ausencias y rechazamos la ausencia con idAusencia
      				ajdao.actualizarIndividual(idAusencia,"R");
      				response.getWriter().write("status-"+idAusencia);
      			}
      			
      		}else
      		{
      			doGet(request, response);
      		}
      		
      	}

      }
