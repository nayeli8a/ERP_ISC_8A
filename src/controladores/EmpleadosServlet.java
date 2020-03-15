package controladores;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.datos.*;
import modelo.beans.*;

/**
 * Servlet implementation class EmpleadosServlet
 */
@WebServlet("/Empleados")
public class EmpleadosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public EmpleadosServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("##Dentro de EmpleadosServlet##");
		
		String op = request.getParameter("op");
		String url = "";
		
		//EMPLEADOS
		Empleados e = new Empleados();
		EmpleadosDAO edao = new EmpleadosDAO();
		
		//PUESTOS
		PuestosDAO pudao = new PuestosDAO();
		//DEPARTAMENTOS
		DepartamentosDAO ddao = new DepartamentosDAO();
		//SUCURSALES
		SucursalesDAO sdao = new SucursalesDAO();
		//CIUDADES
		CiudadesDAO cdao = new CiudadesDAO();
		
		switch (op) {
			case "Listar":
				//obtenemos el valor de la pagina que vamos a mostrar
				String pagina = request.getParameter("pagina");
				//empleados
				List<Empleados> datos = edao.consultar(pagina);
				//puestos
				List<Puestos> pdatos = pudao.consultar();
				//sucursales 
				List<Sucursales> sdatos = sdao.consultar();
				//ciudades
				List<Ciudades> cdatos = cdao.consultar();
				//departamentos
				List<Departamentos> ddatos = ddao.consultar();
				
				request.setAttribute("datosempleados",datos);
				request.setAttribute("datospuestos",pdatos);
				request.setAttribute("datossucursales",sdatos);
				request.setAttribute("datosciudades",cdatos);
				request.setAttribute("datosdepartamentos",ddatos);
				request.setAttribute("pagina",pagina);
				url=modelo.datos.Constantes.REGRESAR_RH_CONSULTA+"empleados.jsp";
			break;
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
