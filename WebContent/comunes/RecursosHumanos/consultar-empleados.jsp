<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri  = "http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html>
<head>

<title>Consultar Empleados</title>

	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- Bootstrap core CSS and JS-->
	<link href="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script type="text/javascript" src="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/jquery/jquery.js"></script>
	<script type="text/javascript" src="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/bootstrap/js/bootstrap.min.js"></script>
		
    <!-- Nuestras hojas de estilo-->
    <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/estilo.css">
    <script type="text/javascript" src="<c:out value="${pageContext.servletContext.contextPath}"/>/js/funciones.js"></script>
    
    <style>
    	 .modal-body { max-height: calc(100vh - 200px); overflow-y: auto; } 
	</style>


</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" data-target="#navbarResponsive">
		<a class="btn btn-primary"href="${pageContext.servletContext.contextPath}/General?op=RegresarRH">Atras</a>
	</nav>
	
	
	<div class="container" style="margin-top:100px">
	 <h2>Buscador</h2>
	  <p>Escribe la información a buscar</p>  
	  <input class="form-control" id="myInput" type="text" placeholder="Buscador...">
		<h2 align="center">Empleados</h2>
		<hr class="bg-info">
		<button type="button" class="btn btn-success" id="agregar" data-toggle="modal" data-target="#modalRegistro" >Agregar</button>
		
		<div class="table-responsive table-bordered table-striped">
			<table class="table table-sm">
				<thead class="thead-dark">

					<tr>
						<th>ID</th>
						<th>Nombre</th>
						<th>Sexo</th>
						<th>Fecha Contratacion</th>
						<th>Fecha Nacimiento</th>
						<th>Salario</th>
						<th>NSS</th>
						<th>Estado Civil</th>
						<th>Dias Vacaciones</th>
						<th>Dias Permisos</th>
						<th>Foto</th>
						<th>Direccion</th>
						<th>Colonia</th>
						<th>CP</th>
						<th>Escolaridad</th>
						<th>%Comision</th>
						<th>IdDepartamento</th>
						<th>idPuesto</th>
						<th>idCiudad</th>
						<th>idSucursal</th>
						<th>Horario</th>
						<th>Nomina</th>
						<th>Pedidos</th>
						<th>Incapacidades</th>
						<th>Historial Puestos</th>
						<th>Ventas</th>
						<th>Visitas</th>
						<th>Ausencias Justificadas</th>
						<th>Documentacion</th>
						<th>Acciones</th>
					</tr>
				</thead>
				<tbody id="myTable">
					<c:forEach var="dato" items="${datosempleados}">
						<c:if test="${dato.getEstatus() eq 'I'}">
							<tr>
							<td>${dato.getIdEmpleado()}</td>
							<td>${dato.getNombre()} ${dato.getApaterno()} ${dato.getAmaterno()}</td>
							<td>${dato.getSexo()}</td>
							<td>${dato.getFechaContratacion()}</td>
							<td>${dato.getFechaNacimiento()}</td>
							<td>${dato.getSalario()}</td>
							<td>${dato.getNss()}</td>
							<td>${dato.getEstadoCivil()}</td>
							<td>${dato.getDiasVacaciones()}</td>
							<td>${dato.getDiasPermiso()}</td>
							<td>${dato.getFotografia()}</td>
							<td>${dato.getDireccion()}</td>
							<td>${dato.getColonia()}</td>
							<td>${dato.getCodigoPostal()}</td>
							<td>${dato.getEscolaridad()}</td>
							<td>${dato.getPorcentajeComision()}</td>
							<td>${dato.getIdDepartamento()}</td>
							<td>${dato.getIdPuesto()}</td>
							<td>${dato.getIdCiudad()}</td>
							<td>${dato.getIdSucursal()}</td>
							<td><button>VER</button></td>
							<td><button>VER</button></td>
							<td><button>VER</button></td>
							<td><button>VER</button></td>
							<td><button>VER</button></td>
							<td><button>VER</button></td>
							<td><button>VER</button></td>
							<td><button>VER</button></td>
							<td><button>VER</button></td>
							</tr>
						</c:if>
						<c:if test="${dato.getEstatus() eq 'A'}">
							<tr>
							<td>${dato.getIdEmpleado()}</td>
							<td>${dato.getNombre()} ${dato.getApaterno()} ${dato.getAmaterno()}</td>
							<td>${dato.getSexo()}</td>
							<td>${dato.getFechaContratacion()}</td>
							<td>${dato.getFechaNacimiento()}</td>
							<td>${dato.getSalario()}</td>
							<td>${dato.getNss()}</td>
							<td>${dato.getEstadoCivil()}</td>
							<td>${dato.getDiasVacaciones()}</td>
							<td>${dato.getDiasPermiso()}</td>
							<td>${dato.getFotografia()}</td>
							<td>${dato.getDireccion()}</td>
							<td>${dato.getColonia()}</td>
							<td>${dato.getCodigoPostal()}</td>
							<td>${dato.getEscolaridad()}</td>
							<td>${dato.getPorcentajeComision()}</td>
							<td>${dato.getIdDepartamento()}</td>
							<td>${dato.getIdPuesto()}</td>
							<td>${dato.getIdCiudad()}</td>
							<td>${dato.getIdSucursal()}</td>
							<td><button>VER</button></td>
							<td><button>VER</button></td>
							<td><button>VER</button></td>
							<td><button>VER</button></td>
							<td><button>VER</button></td>
							<td><button>VER</button></td>
							<td><button>VER</button></td>
							<td><button>VER</button></td>
							<td><button>VER</button></td>
							<td>
								<form action="Empleados" method="post">
									<input type="hidden" name="id" value="${dato.getIdEmpleado()}">
									<div id="${dato.getIdEmpleado()}">
										<input type="submit" class="btn btn-warning" name="op" value="Editar"> 
										<input type="submit" class="btn btn-danger" name="op" value="Eliminar" onclick="javascript:eliminar()">
									</div>
								</form>
							</td>
							</tr>
						</c:if>
						
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<!-- MODAL PARA REGISTRO -->
	<div class="modal fade" id="modalRegistro">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">Registro de Empleados</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body" id="modal_div">
	      <% //Aqui va todo el cuerpo del modal%>
	      	<form action="#">
			    <div class="container">
			      <legend> Datos Generales: </legend>
			      <div class="row">
			        <div class="col-md-4" id="nombre">
			          <div class="form-group">
			            <input type="text" class="form-control" placeholder="Nombre(s)">
			          </div>
			        </div>
			        <div class="col-md-4" id="apaterno">
			          <div class="form-group">
			            <input type="text" class="form-control" placeholder="Apellido Paterno">
			          </div>
			        </div>
			        <div class="col-md-4" id="amaterno">
			          <div class="form-group">
			            <input type="text" class="form-control" placeholder="Apellido Materno">
			          </div>
			        </div>
			      </div>
			      <div class="row">
			        <div class="col-md-6">
			        	<label>Sexo:</label>
			          <select class="form-control" id="sexo" name="sexo">
			            <option value="M">Masculino</option>
			            <option value="M">Femenino</option>
			          </select>
			        </div>
			        <div class="col-md-6">
			        	<label>Estado Civil:</label>
			          <select class="form-control" id="estado-civil" name="estado-civil">
			            <option value="Casado">Casado</option>
			            <option value="Soltero">Soltero</option>
			            <option value="Union Libre">Union Libre</option>
			            <option value="Divorciado">Divorciado</option>
			          </select>
			        </div>
			      </div>
			      <br>
			      <div class="row">
			        <div class="col-md-6">
			        	<label>Numero de Seguro Social:</label>
			          <div class="form-group">
			            <input type="text" name="nss" placeholder="NSS" value="" required class="form-control">
			          </div>
			        </div>
			        <div class="col-md-6">
			        	<label>Fecha de Nacimiento:</label>
			          <div class="form-group">
			            <input type="date" name="fecha-nacimiento" value="" required class="form-control">
			          </div>
			        </div>
			      </div>

			      <div class="row">
			      	<div class="col-md-12">
			      		<small>Domicilio del empleado:</small>
			      	</div>
			        <div class="col-md-4">
			          <div class="form-group">
			            <input type="text" name="direccion" placeholder="Direccion" value="" required class="form-control">
			          </div>
			        </div>
			        <div class="col-md-4">
			          <div class="form-group">
			            <input type="text" name="colonia" placeholder="Colonia" value="" required class="form-control">
			          </div>
			        </div>
			        <div class="col-md-4">
			          <div class="form-group">
			            <input type="text" name="codigo-postal" placeholder="Codigo Postal" value="" required class="form-control">
			          </div>
			        </div>
			      </div>

			      <div class="row">
			      	<div class="col-md-4">
				        <label for="Ciudad">Ciudad:</label>
			    		<select class="form-control" id="ciudad" name = "ciudad">
			      			<c:forEach var="dato" items="${datosciudades}">
			      				<option value="${dato.getIdCiudad()}">${dato.getNombre()}</option>
			      			</c:forEach>
			    		</select>
			        </div>
			      </div>


			      <legend> Datos del empleado: </legend>
			      <div class="row">
			        <div class="col-md-6">
			        	<label>Fecha de Contratacion:</label>
			          <div class="form-group">
			            <input type="date" name="fecha-contratacion" value="" required class="form-control">
			          </div>
			        </div>

			        <div class="col-md-6">
			        	<label>Salario:</label>
			          <div class="form-group">
			            <input type="number" name="salario" value="" required class="form-control">
			          </div>
			        </div>
			      </div>
			      
			      <div class="row">
			      	<div class="col-md-3">
			      		<label>Dias Vacaciones:</label>
			          <div class="form-group">
			            <input type="number" name="dias-vacaciones" value="" required class="form-control">
			          </div>
			      	</div>
			      	<div class="col-md-3">
			      		<label>Dias Permiso:</label>
			          <div class="form-group">
			            <input type="number" name="dias-permiso" value="" required class="form-control">
			          </div>
			      	</div>
			      	<div class="col-md-3">
			      		<label>% Comision:</label>
			          <div class="form-group">
			            <input type="number" name="porcentaje-comision" value="" required class="form-control">
			          </div>
			      	</div>
			      </div>

			      <div class="row">
			      	<div class="col-md-4">
				        <label for="Departamento">Departamento:</label>
			    		<select class="form-control" id="departamento" name = "departamento">
			      			<c:forEach var="dato" items="${datosdepartamentos}">
			      				<option value="${dato.getIdDepartamento()}">${dato.getNombre()}</option>
			      			</c:forEach>
			    		</select>
			        </div>
			        <div class="col-md-4">
				        <label for="Puesto">Puesto:</label>
			    		<select class="form-control" id="puesto" name = "puesto">
			      			<c:forEach var="dato" items="${datospuestos}">
			      				<option value="${dato.getIdPuesto()}">${dato.getNombre()}</option>
			      			</c:forEach>
			    		</select>
			        </div>
			        <div class="col-md-4">
				        <label for="Sucursal">Sucursal:</label>
			    		<select class="form-control" id="sucursal" name = "sucursal">
			      			<c:forEach var="dato" items="${datossucursales}">
			      				<option value="${dato.getIdSucursal()}">${dato.getNombre()}</option>
			      			</c:forEach>
			    		</select>
			        </div>
			      </div>

			    </div>
			    <br>
			    <button type="submit" class="btn btn-primary">Registrar</button>
			  </form>
	      </div>
			
	      <!-- Modal footer -->
	      <div class="modal-footer">
	      </div>
	
	    </div>
	  </div>
	</div>
	
	<% //Aqui tendremos la paginacion%>
	<nav aria-label="paginacion Empleados">
	  <ul class="pagination justify-content-center">
	    <c:if test="${pagina eq 1}">
	    	<li class="page-item disabled">
		      <a class="page-link" href="${pageContext.servletContext.contextPath}/Empleados?op=Listar&pagina=${pagina-1}">Previous</a>
		    </li>
	    </c:if>
	    <c:if test="${pagina > 1}">
	    	<li class="page-items">
		      <a class="page-link" href="${pageContext.servletContext.contextPath}/Empleados?op=Listar&pagina=${pagina-1}">Previous</a>
		    </li>
	    </c:if>
	    <li class="page-item"><a class="page-link">Pagina ${pagina}</a></li>
	    <li class="page-item">
	      <a class="page-link" href="${pageContext.servletContext.contextPath}/Empleados?op=Listar&pagina=${pagina+1}">Next</a>
	    </li>
	  </ul>
	</nav>
	
	
</body>
</html>