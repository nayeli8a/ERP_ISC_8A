package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.beans.Estado;
import modelo.beans.Nominas;
import modelo.datos.NominasDAO;

/**
 * Servlet implementation class NominasExcelServlet
 */
@WebServlet("/NominasExcelServlet")
public class NominasExcelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NominasExcelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/vnd.ms-excel");
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
		LocalDateTime now = LocalDateTime.now();  
		response.setHeader("Content-Disposition","attachment; filename=\"Nominas"+dtf.format(now)+".xls\"");
		
		//Nominas
		NominasDAO ndao = new NominasDAO();
		List<Nominas> nominas = ndao.Consultar();
		
		PrintWriter out = response.getWriter();
		out.println("idNomina:\tEstatus:\tForma Pago:\tNSS Empleado:\tNombre Empleado:\tFecha Pago:\tFecha Inicio:\tFecha Fin:\tLiquido:");
		for (int i = 0; i < nominas.size(); i++) {
			out.println(
					nominas.get(i).getIdNomina()+"\t"
					+nominas.get(i).getEstatus()+"\t"
					+nominas.get(i).getFormaPago()+"\t"
					+nominas.get(i).getNss()+"\t"
					+nominas.get(i).getNombreEmpleado()+" "+nominas.get(i).getApaterno()+" "+nominas.get(i).getAmaterno()+"\t"
					+nominas.get(i).getFechaPago()+"\t"
					+nominas.get(i).getFechaInicio()+"\t"
					+nominas.get(i).getFechaFin()+"\t"
					+nominas.get(i).getCantidadNeta());
		}
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
