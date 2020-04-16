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

import modelo.beans.*;
import modelo.datos.*;

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
		
		
		switch(op)
		{
			case "Listar":
				pagina = request.getParameter("pagina");
				List<Nominas> datos = nomDAO.Consultar(pagina);
				List<FormasPago> datospagos = fpdao.consultar();
				request.setAttribute("datos",datos);
				request.setAttribute("datospagos",datospagos);
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
				nomDAO.Actualizar(nom);
				url="Nominas?op=Listar&pagina=1";
				break;
			case "Editar":
				String id = request.getParameter("id");
				Nominas n = new Nominas();
				n = nomDAO.ConsultaIndividual(id+"");
				datospagos = fpdao.consultar();
				request.setAttribute("datosnomina",n);
				request.setAttribute("datospagos",datospagos);
				url = Constantes.REGRESAR_RH_EDITAR+"nominas.jsp";
				break;
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
