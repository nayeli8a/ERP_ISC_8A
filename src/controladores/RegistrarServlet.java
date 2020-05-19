package controladores;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.sql.Time;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import modelo.beans.*;
import modelo.datos.*;

@MultipartConfig(maxFileSize = 16177216)//15mb necesario para obtener objetos desde el formulario de envio de archivos
@WebServlet("/Registrar")
public class RegistrarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

   
    public RegistrarServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
				
				response.setContentType("text/html;charset=UFT-8");
				Part Documento = request.getPart("foto");
		        InputStream InputS = Documento.getInputStream();
		        e.setFotografia(InputS);
				
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

				case "AusenciasJustificadas":
					int idEmpleadoAusente;
					int idEmpleadoJefe;
					AusenciasJustificadasDAO ausJusdao = new AusenciasJustificadasDAO();
					fechaInicio = (Date.valueOf(request.getParameter("fechaInicio")));
					fechaFin = (Date.valueOf(request.getParameter("fechaFin")));
					String tipo = request.getParameter("tipo");
					String nssAusente = request.getParameter("nssAusente");
					String nssJefe = request.getParameter("nssJefe");
					//obtenemos los ID
				    idEmpleadoAusente = ausJusdao.validarNSSEmpleado(nssAusente);
				    idEmpleadoJefe = ausJusdao.validarNSSEmpleado(nssJefe);
				    //Obtenemos los dias disponibles de permiso 
				    int diasVacaciones= ausJusdao.validarVacaciones(idEmpleadoAusente);
				    int diasPermiso= ausJusdao.validarPermiso(idEmpleadoAusente);
				    //calculamos los dias de permiso
				    int calDias =(Integer.valueOf(request.getParameter("dias"))); 
					System.out.println("dias calculados " + calDias);
					System.out.println("EMPLEADO AUSENTE "+idEmpleadoAusente);
					System.out.println("JEFE "+idEmpleadoJefe);
					System.out.println("DIAS VACACIONES "+diasVacaciones);
					System.out.println("DIAS PERMISO "+diasPermiso);
					System.out.println(tipo);

					if (idEmpleadoAusente != -1 && idEmpleadoJefe != -1) // Existen los
						// empleados
					{
						if (idEmpleadoAusente != idEmpleadoJefe) // Son diferentes
						{
							if ("V".equals(tipo)) { // vacaciones
								if (calDias <= diasVacaciones) {
									ausJusdao.insertarAusenciasJustificadas(fechaInicio, fechaFin, tipo, idEmpleadoAusente,
											idEmpleadoJefe);
									mensaje = "Ausencia Justificada registrada con exito";
									request.setAttribute("Mensajes", mensaje);

								} else {
									error = "El empleado solo cuenta con " + diasVacaciones + " dias de vacaiones";
									request.setAttribute("Errores", error);
								}

							}

							if ("P".equals(tipo)) {// permiso
								if (calDias <= diasPermiso) {
									ausJusdao.insertarAusenciasJustificadas(fechaInicio, fechaFin, tipo, idEmpleadoAusente,
											idEmpleadoJefe);
									mensaje = "Ausencia Justificada registrada con exito";
									request.setAttribute("Mensajes", mensaje);
								}

								else {
									error = "El empleado solo cuenta con " + diasPermiso + "dias de permiso";
									request.setAttribute("Errores", error);
								}

							}
						}

						else {
							error = "El usuario que autoriza no puede ser el mismo que el ausente";
							request.setAttribute("Errores", error);

						}

					} else {
						error = "Empleado no encontrado";
						request.setAttribute("Errores", error);
					}

					url="AusenciasJustificadas?op=Listar&pagina=1";
					break;

				case "Nomina":
					NominasDAO ndao = new NominasDAO();
					HorariosDAO hdao = new HorariosDAO();//para sacar el idEmpleado con el nss, por flojera jaja
					Nominas n = new Nominas();
					NominasDeduccionesDAO nddao = new NominasDeduccionesDAO();
					NominasPercepcionesDAO npdao = new NominasPercepcionesDAO();

					int idempleado = hdao.validarNSSEmpleado(request.getParameter("nss"));
					if(idempleado!=-1)
					{
						//existe
						n.setIdEmpleado(idempleado);
						n.setIdFormaPago(Integer.parseInt(request.getParameter("idformapago")));

						n.setFechaPago(Date.valueOf(request.getParameter("fechapago")));
						n.setTotalP(0);
						n.setTotalD(0);
						n.setCantidadNeta(0);
						n.setDiasTrabajados(0);
						n.setFaltas(0);
						n.setFechaInicio(Date.valueOf(request.getParameter("fechainicio")));
						n.setFechaFin(Date.valueOf(request.getParameter("fechafin")));

						ndao.Insertar(n.getFechaPago(),n.getTotalP(),n.getTotalD(),
								n.getCantidadNeta(),n.getDiasTrabajados(),n.getFaltas(),n.getFechaInicio(),
								n.getFechaFin(),n.getIdEmpleado(),n.getIdFormaPago());

						//ahora insertamos las percepciones a la nueva nomina
						int cantidadpercepciones = Integer.parseInt(request.getParameter("percepciones"));
						float importetotalp=0;
						
						for (int i = 0; i < cantidadpercepciones; i++) {
							int idPercepcion = Integer.parseInt(request.getParameter("select-p-"+(i+1)));
							int idNomina = ndao.NominaEmpleado(idempleado);
							float importe = 0;
							//System.out.println(idPercepcion+" || "+idNomina+" || "+importe);
							importetotalp+=importe;
							npdao.Insertar(idNomina,idPercepcion,importe);
						}

						//ahora insertamos las deducciones a la nueva nomina
						int cantidaddeducciones = Integer.parseInt(request.getParameter("deducciones"));
						float importetotald=0;
						
						for (int i = 0; i < cantidaddeducciones; i++) {
							int idDeduccion = Integer.parseInt(request.getParameter("select-d-"+(i+1)));
							int idNomina = ndao.NominaEmpleado(idempleado);
							float importe = 0;
							//System.out.println(idDeduccion+" || "+idNomina+" || "+importe);
							importetotald+=importe;
							nddao.Insertar(idNomina,idDeduccion,importe);
						}
						
						

						mensaje = "La nomina ha ido registrada con exito";
						request.setAttribute("Mensajes",mensaje);
					}else
					{
						//no existe, regresamos
						error="El NSS ingresado no corresponde a \\n ningun empleado,\\n Porfavor ingrese uno valido";
						request.setAttribute("Errores",error);
					}

					url="Nominas?op=Listar&pagina=1";
					break;
					
				case "FormasPago":
					FormasPagoDAO pagodao = new FormasPagoDAO();

					String nombre = request.getParameter("nombre");
				    estatus = ("A");
					if(!pagodao.ValidarFormaPago(nombre))
					{
						pagodao.insertarFormaPago(nombre, estatus);
						mensaje = "Forma de Pago insertada con exito";
						request.setAttribute("Mensajes",mensaje);
					}else
					{
						error="Esta forma de pago ya habia sido registrada";
						request.setAttribute("Errores",error);
					}
					url="FormasPago?op=Listar&pagina=1";
					break;
					
				case "DocumentacionEmpleado" :
						error = "";
						mensaje="";
						DocumentacionEmpleadoDAO dcedao = new DocumentacionEmpleadoDAO();
						
						String nombreDocumento = request.getParameter("nombreDocumento");
						Date fechaEntrega = (Date.valueOf(request.getParameter("fechaEntrega")));
						
						response.setContentType("text/html;charset=UFT-8");
						Documento = request.getPart("documento");
				        InputS = Documento.getInputStream();
				        
						nssempleado = request.getParameter("nss");

					    estatus = "A";
						idEmpleado = dcedao.validarNSSEmpleado(nssempleado);
						if(idEmpleado != -1)
						{
							dcedao.insertar(InputS,nombreDocumento, fechaEntrega,idEmpleado, estatus);
							mensaje = "Documentacion Empleado registrada con exito para el NSS: "+nssempleado;
							request.setAttribute("Mensajes",mensaje);

						}else
						{
							error = "El NSS del empleado no es valido, inserta uno valido.";
							request.setAttribute("Errores",error);
						}
						url="DocumentacionEmpleado?op=Listar&pagina=1";
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
