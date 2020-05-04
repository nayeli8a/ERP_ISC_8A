package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

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
		
		String error="";
		String mensaje="";
		
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
			case "VerIndividual":
				//Este caso me servira para mostrar los distintos elementos que conforman al empleado
				
				//obtenemos la opcion segun lo que queremos ver
				String opcion = request.getParameter("opcion");
				//obtenemos el nss del empleado seleccionado
				String nssempleado = request.getParameter("nss");
				switch(opcion)
				{
					case "Horario":
						Horarios hrio = new Horarios();
						List<Horarios> datosh = new ArrayList<Horarios>();
						HorariosDAO hdao = new HorariosDAO();
						int idEmpleado = hdao.validarNSSEmpleado(nssempleado);
							
						hrio = hdao.consultaIndividual(idEmpleado);
						if(hrio.getIdEmpleado() == 0)
						{
							error="Este empleado no tiene Horario asignado";
							request.setAttribute("Errores",error);
						}else
						{
							datosh.add(hrio);
							request.setAttribute("datos",datosh);
							request.setAttribute("pagina",1);
						}
						url=modelo.datos.Constantes.REGRESAR_RH_CONSULTA+"horarios.jsp";
						break;
					case "Nomina":
					break;
					case "Pedido":
					break;
					case "Incapacidades":
					break;
				}
				break;
			case "Editar":
				e = new Empleados();
				e.setIdEmpleado(Integer.parseInt(request.getParameter("edit_id")));
				e.setNombre(request.getParameter("edit_nombre"));
				e.setApaterno(request.getParameter("edit_apaterno"));
				e.setAmaterno(request.getParameter("edit_amaterno"));
				e.setSexo(request.getParameter("edit_sexo"));
				e.setFechaContratacion(Date.valueOf(request.getParameter("edit_fecha-contratacion")));
				e.setFechaNacimiento(Date.valueOf(request.getParameter("edit_fecha-nacimiento")));
				e.setSalario(Float.parseFloat(request.getParameter("edit_salario")));
				e.setNss(request.getParameter("edit_nss"));
				e.setEstadoCivil(request.getParameter("edit_estado-civil"));
				e.setDiasVacaciones(Integer.parseInt(request.getParameter("edit_dias-vacaciones")));
				e.setDiasPermiso(Integer.parseInt(request.getParameter("edit_dias-permiso")));
				e.setFotografia(null);
				e.setDireccion(request.getParameter("edit_direccion"));
				e.setColonia(request.getParameter("edit_colonia"));
				e.setCodigoPostal(request.getParameter("edit_codigo-postal"));
				e.setEscolaridad(request.getParameter("edit_escolaridad"));
				e.setPorcentajeComision(Float.parseFloat(request.getParameter("edit_porcentaje-comision")));
				e.setEstatus("A");
				e.setIdDepartamento(Integer.parseInt(request.getParameter("edit_departamento")));
				e.setIdPuesto(Integer.parseInt(request.getParameter("edit_puesto")));
				e.setIdCiudad(Integer.parseInt(request.getParameter("edit_ciudad")));
				e.setIdSucursal(Integer.parseInt(request.getParameter("edit_sucursal")));
				
				edao.Actualizar(e);
				url = "Empleados?op=Listar&pagina=1";
				break;
			case "Eliminar":
				int id = Integer.parseInt(request.getParameter("id"));
				edao.Eliminar(id);
				url = "Empleados?op=Listar&pagina=1";
				break;
				
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("op");
		String[] array = new String[2];
		int i=0;
		
		//revisamos si la peticion es AJAX o no
		if(op.equals("AJAX"))
		{
			//ponemos el modo de respuestas en text/html para poder mandar objetos html
			response.setContentType("text/html");
			op="";//dejamos la op en vacio para que si envian de un form no AJAX 
			String datos = request.getParameter("datos");//tomamos los datos necesarios para mostrar
			String ContenidoModal="";
			String CuerpoModal="";
			System.out.println(datos);
			StringTokenizer st = new StringTokenizer(datos,"&");
			while(st.hasMoreTokens())
			{
				array[i] = st.nextToken();
				i++;
			}
			
			switch(array[0])
			{
				case "Horario":
					HorariosDAO hdao = new HorariosDAO();
					
					int idEmpleado = hdao.validarNSSEmpleado(array[1]);
					System.out.println(array[1]+" || "+idEmpleado);
					List<Horarios> datosh  = hdao.consultaIndividual(idEmpleado+"");
					String aux="";
					System.out.println("size: "+datosh.size());
					for (int j = 0; j < datosh.size(); j++) {
						aux += 	"				<tr>"
								+"				<td>"+datosh.get(j).getIdHorario()+"</td>"
								+"				<td>"+datosh.get(j).getHoraInicio()+"</td>"
								+"				<td>"+datosh.get(j).getHoraFin()+"</td>"
								+"				<td>"+datosh.get(j).getDias()+"</td>"
								+"              <td>"+datosh.get(j).getIdEmpleado()+"</td>"
								+"				<td>"+datosh.get(j).getEstatus()+"</td>"
								+"				</tr>";
					}
					System.out.println("aux: "+aux);
					ContenidoModal = ""
							+"<div class=\"table-responsive table-bordered table-striped\">"
						    +"  <table class=\"table table-sm\">"
						    +"	<thead class=\"thead-dark\">"
						    +"		<tr>"
							+"			<th>ID Horario</th>"
							+"			<th>Hora Inicio</th>"
							+"			<th>Hora Fin</th>"
							+"			<th>Días</th>"
							+"           <th>id Empleado</th>"
							+"            <th>Estatus</th>"
							+"		</tr>"
							+"	</thead>"
						    +"   <tbody id=\"myTable\">"
							+aux+""
							+"	</tbody>"
						    +" </table>"
						    +"</div>";
					
					CuerpoModal=""
							+ "<div class=\"modal fade\" id=\"modalVER\">"
								+"<div class=\"modal-dialog modal-lg\">"
								  +"<div class=\"modal-content\">"
								      
								  	+"<!-- Modal Header -->"
								      +"<div class=\"modal-header\">"
								      	+"<h4 class=\"modal-title\">Ver Elemento</h4>"
								      	+"<button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>"
								      +"</div>"
								      	
									+"<!-- Modal body -->"
									+"<div class=\"modal-body\" id=\"modal_div\">"
										+ContenidoModal+""
									+"</div>"
								
									+"<!-- Modal footer -->"
									+"<div class=\"modal-footer\">"
									+"</div>"
									
									+"</div>"
								+"</div>"
							+"</div>";
					
					response.getWriter().write(CuerpoModal);
				break;
				
				case "":
					
				break;
			}
			
			
		}else
		{
			doGet(request, response);
		}	
		
		
		
	}

}
