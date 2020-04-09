package controladores;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
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
		String error = "";
		String mensaje="";
		String nssempleado;
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
				
				url="Ciudades?op=Listar&pagina=1";
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
				url="Deducciones?op=Listar&pagina=1";
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
				url="Percepciones?op=Listar&pagina=1";
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
				url="Departamentos?op=Listar&pagina=1";
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
				url="Puestos?op=Listar&pagina=1";
			break;
			case "Empleado":
				Empleados e = new Empleados();
				e.setNombre(request.getParameter("nombre"));
				e.setApaterno(request.getParameter("apaterno"));
				e.setAmaterno(request.getParameter("amaterno"));
				e.setSexo(request.getParameter("sexo"));
				e.setFechaContratacion(Date.valueOf(request.getParameter("fecha-contratacion")));
				e.setFechaNacimiento(Date.valueOf(request.getParameter("fecha-nacimiento")));
				e.setSalario(Float.parseFloat(request.getParameter("salario")));
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
			
			case "Horarios":
				//variable para los errores
				error = "";
				mensaje="";
				
				//generamos el objeto que nos permitira insertar,actualizar,eliminar
				HorariosDAO hrDAO = new HorariosDAO();
				
				String horaInicio = request.getParameter("horaInicio");
				String horaFin = request.getParameter("horaFin");
				nssempleado = request.getParameter("nssempleado");
				//para la parte de los dias, concatenaremos todos los dias separandolos por ";"
				String dias="";
					dias += (request.getParameter("lunes")== null)?"":request.getParameter("lunes")+";";
					dias += (request.getParameter("martes")== null)?"":request.getParameter("martes")+";";
					dias += (request.getParameter("miercoles")== null)?"":request.getParameter("miercoles")+";";
					dias += (request.getParameter("jueves")== null)?"":request.getParameter("jueves")+";";
					dias += (request.getParameter("viernes")== null)?"":request.getParameter("viernes")+";";
					dias += (request.getParameter("sabado")== null)?"":request.getParameter("sabado")+";";
					dias += (request.getParameter("domingo")== null)?"":request.getParameter("domingo")+";";
				estatus = "A";
				System.out.println(dias+"||"+horaInicio+"||"+horaFin);
				//validamos que el empleado con el nss dado si existe
				
				int idEmpleado = hrDAO.validarNSSEmpleado(nssempleado);
				if(idEmpleado != -1)
				{
					hrDAO.insertarHorarios(idEmpleado,horaInicio, horaFin, dias, estatus);
					mensaje = "El Horario ha sido insertado con exito para el NSS: "+nssempleado;
					request.setAttribute("Mensajes",mensaje);
				}else
				{
					error = "El NSS del empleado no es valido, inserta uno valido.";
					request.setAttribute("Errores",error);
				}
				
				url="Horarios?op=Listar&pagina=1";
				
				break;
			case "Incapacidades" : 
				error = "";
				mensaje="";
				IncapacidadesDAO indao = new IncapacidadesDAO();
				Date fechaInicio = (Date.valueOf(request.getParameter("fechaInicio")));
				Date fechaFin = (Date.valueOf(request.getParameter("fechaFin")));
				nssempleado= request.getParameter("nssempleado");
				String enfermedad =request.getParameter("enfermedad");
			    estatus = "A";
				idEmpleado = indao.validarNSSEmpleado(nssempleado);
				if(idEmpleado != -1)
				{
					indao.insertarIncapacidades(fechaInicio, fechaFin, enfermedad, null,idEmpleado, estatus);
					mensaje = "Incapacidad registrada con exito para el NSS: "+nssempleado;
					request.setAttribute("Mensajes",mensaje);
					
				}else
				{
					error = "El NSS del empleado no es valido, inserta uno valido.";
					request.setAttribute("Errores",error);
				}
				url="Incapacidades?op=Listar&pagina=1";
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
