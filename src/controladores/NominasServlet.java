package controladores;

import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.beans.*;
import modelo.datos.*;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperPrintManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.view.JasperViewer;

@WebServlet("/Nominas")
public class NominasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public NominasServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("op");
		String pagina="";
		String url = Constantes.REGRESAR_RH;
		
		
		//NOMINAS DAO
		NominasDAO nomDAO = new NominasDAO();
		//FORMASPAGO DAO
		FormasPagoDAO fpdao = new FormasPagoDAO();
		//PERCEPCIONES DAO
		PercepcionesDAO pdao = new PercepcionesDAO();
		//DEDUCCIONES DAO
		DeduccionesDAO ddao = new DeduccionesDAO();
		//NominasDeduccionesDAO
		NominasDeduccionesDAO nddao = new NominasDeduccionesDAO();
		//NominasPercepcionesDAO
		NominasPercepcionesDAO npdao = new NominasPercepcionesDAO();
		
		
		switch(op)
		{
			case "Listar":
				//vamos a ejecutar un procedimiento almacenado
				//para que actualize los valores de las nominas
				
				
				pagina = request.getParameter("pagina");
				List<Nominas> datos = nomDAO.Consultar(pagina);
				List<FormasPago> datospagos = fpdao.consultar();
				List<Percepciones> datosperc = pdao.consultar();
				List<Deducciones> datosded = ddao.consultar();
				request.setAttribute("datos",datos);
				request.setAttribute("datospagos",datospagos);
				request.setAttribute("datosdeducciones",datosded);
				request.setAttribute("datospercepciones",datosperc);
				request.setAttribute("pagina",pagina);
				url = Constantes.REGRESAR_RH_CONSULTA+"nominas.jsp";
				break;
				
			case "Eliminar":
				int idNomina = Integer.parseInt(request.getParameter("id"));
				nomDAO.Eliminar(idNomina);
				url = "Nominas?op=Listar&pagina=1";
				break;	
			case "Modificar":
				Nominas nom = new Nominas();
				HorariosDAO hdao = new HorariosDAO();
				
				nom.setIdNomina(Integer.parseInt(request.getParameter("id")));
				nom.setIdEmpleado(hdao.validarNSSEmpleado(request.getParameter("nss")));
				nom.setIdFormaPago(Integer.parseInt(request.getParameter("idformapago")));
				
				nom.setEstatus(request.getParameter("estatus"));
				nom.setFechaPago(Date.valueOf(request.getParameter("fechapago")));
				nom.setTotalP(Float.valueOf(request.getParameter("totalp")));
				nom.setTotalD(Float.valueOf(request.getParameter("totald")));
				nom.setCantidadNeta(Float.valueOf(request.getParameter("cantidadneta")));
				nom.setDiasTrabajados(Integer.parseInt(request.getParameter("diast")));
				nom.setFaltas(Integer.parseInt(request.getParameter("faltas")));
				nom.setFechaInicio(Date.valueOf(request.getParameter("fechainicio")));
				nom.setFechaFin(Date.valueOf(request.getParameter("fechafin")));
				nom.setEstatusNomina(request.getParameter("estatusNomina"));
				nomDAO.Actualizar(nom);
				//generamos el idNomina en basa al id del empleado
				idNomina = nomDAO.NominaEmpleado(nom.getIdEmpleado());
				
				//reseteamos las nominasdeducciones y nominaspercepciones
				npdao.resetear(idNomina);
				nddao.resetear(idNomina);
				
				//ahora actualizamos las percepciones de la nomina
				int cantidadpercepciones = Integer.parseInt(request.getParameter("percepciones"));
				for (int i = 1; i < cantidadpercepciones+1; i++) {
					int idPercepcionNueva = Integer.parseInt(request.getParameter("select-p-"+(i)));
					npdao.actualizar(idNomina,idPercepcionNueva);
				}

				//ahora insertamos las deducciones de la nomina
				int cantidaddeducciones = Integer.parseInt(request.getParameter("deducciones"));
				for (int i = 1; i < cantidaddeducciones+1; i++) {
					int idDeduccionNueva = Integer.parseInt(request.getParameter("select-d-"+(i)));
					nddao.actualizar(idNomina,idDeduccionNueva);
				}
				
				
				url="Nominas?op=Listar&pagina=1";
				break;
			case "Editar":
				String id = request.getParameter("id");
				Nominas n = new Nominas();
				n = nomDAO.ConsultaIndividual(id+"");
				datospagos = fpdao.consultar();
				
				//obtenemos un objeto de las percepciones del empleado con el idNomina
				List<NominasPercepciones> percepciones = pdao.PercepcionesEmpleado(Integer.parseInt(id));
				
				//obtenemos un objeto de las deducciones del empleado con el idNomina
				List<NominasDeducciones> deducciones = ddao.DeduccionesEmpleado(Integer.parseInt(id));
				
				//obtenemos las deducciones y las percepciones
				List<Deducciones> datosdeducciones = ddao.consultar();
				List<Percepciones> datospercepciones = pdao.consultar();
				
				
				
				request.setAttribute("percepciones",percepciones);
				request.setAttribute("deducciones",deducciones);
				request.setAttribute("datosdeducciones",datosdeducciones);
				request.setAttribute("datospercepciones",datospercepciones);
				request.setAttribute("datosnomina",n);
				request.setAttribute("datospagos",datospagos);
				url = Constantes.REGRESAR_RH_EDITAR+"nominas.jsp";
				break;
			case "Imprimir":
				int idEmpleado = Integer.parseInt(request.getParameter("idEmpleado"));
				idNomina = Integer.parseInt(request.getParameter("id"));
				
				JasperReport reporte ;//generamos el objeto para el reporte
				
				//obtenemos el contexto y la ruta del reporte 
				ServletContext context = request.getServletContext();
				String path = context.getRealPath("/WEB-INF/reportes/Reporte de Nomina.jasper");
				
				try {
					HashMap map = new HashMap();
					map.put("idEmpleado",idEmpleado);
					map.put("idNomina",idNomina);
					reporte = (JasperReport)JRLoader.loadObjectFromFile(path);
					JasperPrint jprint = JasperFillManager.fillReport(path,map,Conexion.getInstance().getCN());

			        //For Printing to the Default Printer
			        //JasperPrintManager.printReport(jprint,false); 
			        
					JasperViewer viewer = new JasperViewer(jprint,false);
					viewer.setVisible(true);
				} catch (JRException e) {
					System.out.println("Error al generar el reporte "+e.getLocalizedMessage());
				}
				url="Nominas?op=Listar&pagina=1";
				break;
			case "Pagar":
				idNomina = Integer.parseInt(request.getParameter("id"));
				nomDAO.PagarNomina(idNomina);
				url="Nominas?op=Listar&pagina=1";
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
			
		}else
		{
			doGet(request, response);
		}
		
	}

}
