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

/**
 * Servlet implementation class RegistrarServlet
 */
@WebServlet("/Registrar")
public class RegistrarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrarServlet() {
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
		System.out.println("##Dentro de RegistrarServlet##");
		String op = request.getParameter("op");
		String url = "index.jsp";
		
		switch(op)
		{
			case "Estado":
				//generamos el objeto a llenar
				EstadoDAO esdao = new EstadoDAO();
				
				String nom_estado = request.getParameter("nom_estado");
				String siglas = request.getParameter("siglas");
				String estatus = request.getParameter("estatus");
				
				//validamos que el estado no exista ya en la BD
				//si el estado no existe en la bd, entonces lo agregamos
				if(!esdao.ValidarEstado(nom_estado))
				{
					esdao.insertarEstado(nom_estado, siglas, estatus);
				}
				url="Estado?op=Listar&pagina=1";
			break;
			
			case "Ciudad":
				//generamos el objeto a llenar
				CiudadesDAO cdao = new CiudadesDAO();
				
				String nom_ciudad = request.getParameter("nom_ciudad");
				nom_estado = request.getParameter("nom_estado");
				estatus = request.getParameter("estatus");
				if(!cdao.ValidarCiudades(nom_ciudad))
				{
					cdao.insertarCiudades(nom_ciudad,nom_estado, estatus);
				}
				
				url="Ciudades?op=Listar";
				break;
				
			case "Deducciones":
				//generamos el objeto a llenar
				DeduccionesDAO ddao = new DeduccionesDAO();
				
				String nom_deducciones = request.getParameter("nom_deducciones");
				String descripcion = request.getParameter("descripcion");
				float porcentaje = 	Float.parseFloat(request.getParameter("porcentaje"));
				estatus = request.getParameter("estatus");
				
				//validamos que el estado no exista ya en la BD
				//si el estado no existe en la bd, entonces lo agregamos
				System.out.println(ddao.ValidarDeducciones(nom_deducciones));
				if(!ddao.ValidarDeducciones(nom_deducciones))
				{
					ddao.insertarDeducciones(nom_deducciones, descripcion, porcentaje, estatus);
				}
				url="Deducciones?op=Listar";
			break;
			case "Percepciones":
				//generamos el objeto a llenar
				PercepcionesDAO pdao = new PercepcionesDAO();
				String nom_percepciones = request.getParameter("nom_percepciones");
				String descripcion_percepciones = request.getParameter("descripcion");
				int diasPagar = Integer.parseInt(request.getParameter("diasPagar"));
				estatus = request.getParameter("estatus");
				
				//validamos que el estado no exista ya en la BD
				//si el estado no existe en la bd, entonces lo agregamos
				System.out.println(pdao.ValidarPercepciones(nom_percepciones));
				if(!pdao.ValidarPercepciones(nom_percepciones))
				{
					pdao.insertarPercepciones(nom_percepciones, descripcion_percepciones, diasPagar, estatus);
				}
				url="Percepciones?op=Listar";
			break;
			case "Departamentos":
				//generamos el objeto a llenar
				DepartamentosDAO dedao = new DepartamentosDAO();
				String nom_departamentos = request.getParameter("nom_departamentos");
				estatus = request.getParameter("estatus");
				
				//validamos que el estado no exista ya en la BD
				//si el estado no existe en la bd, entonces lo agregamos
				System.out.println(dedao.ValidarDepartamento(nom_departamentos));
				if(!dedao.ValidarDepartamento(nom_departamentos))
				{
					dedao.insertarDepartamento(nom_departamentos, estatus);
				}
				url="Departamentos?op=Listar";
			break;
			case "Puestos":
				//generamos el objeto a llenar
				PuestosDAO pudao = new PuestosDAO();
				String nom_puestos = request.getParameter("nom_puestos");
				float salarioMinimo = Float.parseFloat(request.getParameter("salarioMinimo"));
				float salarioMaximo=Float.parseFloat(request.getParameter("salarioMaximo"));
				estatus = request.getParameter("estatus");
				//validamos que el estado no exista ya en la BD
				//si el estado no existe en la bd, entonces lo agregamos
				System.out.println(pudao.ValidarPuesto(nom_puestos));
				if(!pudao.ValidarPuesto(nom_puestos))
				{
					pudao.insertarPuesto(nom_puestos,salarioMinimo,salarioMaximo, estatus);
				}
				url="Puestos?op=Listar";
			break;
			case "Empleado":
				Empleados e = new Empleados();
				e.setNombre(request.getParameter("nombre"));
				e.setApaterno(request.getParameter("apaterno"));
				e.setAmaterno(request.getParameter("amaterno"));
				e.setSexo(request.getParameter("sexo"));
				e.setFechaContratacion(Date.valueOf(request.getParameter("fecha-contratacion")));
				e.setFechaNacimiento(Date.valueOf(request.getParameter("fecha-nacimiento")));
				e.setSalario(Integer.parseInt(request.getParameter("salario")));
				e.setNss(request.getParameter("nss"));
				e.setEstadoCivil(request.getParameter("estado-civil"));
				e.setDiasVacaciones(Integer.parseInt(request.getParameter("dias-vacaciones")));
				e.setDiasPermiso(Integer.parseInt(request.getParameter("dias-permiso")));
				e.setFotografia(null);
				e.setDireccion(request.getParameter("direccion"));
				e.setColonia(request.getParameter("colonia"));
				e.setCodigoPostal(request.getParameter("codigo-postal"));
				e.setEscolaridad(request.getParameter("escolaridad"));
				e.setPorcentajeComision(Float.parseFloat(request.getParameter("porcentaje-comision")));
				e.setEstatus("A");
				e.setIdDepartamento(Integer.parseInt(request.getParameter("departamento")));
				e.setIdPuesto(Integer.parseInt(request.getParameter("puesto")));
				e.setIdCiudad(Integer.parseInt(request.getParameter("ciudad")));
				e.setIdSucursal(Integer.parseInt(request.getParameter("sucursal")));
				
				EmpleadosDAO emdao = new EmpleadosDAO();
				emdao.insertar(e);
				url = "Empleados?op=Listar&pagina=1";
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
