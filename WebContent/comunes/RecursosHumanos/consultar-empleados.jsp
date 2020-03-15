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
	      <% //Aqui va todo el cuerpo del modal, el cual contiene todo los datos necesarios para el cliente%>
	      <form action="${pageContext.servletContext.contextPath}/Registrar?op=Estado" method="post">
			<div class="form-group">
				<label>Nombre: </label>
				<input type="text" onkeypress="return soloLetras(event)" class="form-control" style="text-transform:uppercase;" id="nom_estado" name="nom_estado" required>
				<br>
				<label>Siglas: </label>
				<input type="text" onkeypress="return soloLetras(event)" class="form-control" style="text-transform:uppercase;" id="siglas" name="siglas" required>
				<br>
				<label for="Estatus">Estatus</label>
		    		<select class="form-control" id="estatus" name = "estatus">
		      			<option value="A">Activo</option>
		      			<option value="I">Inactivo</option>
		    		</select>
		    	<br>
		    	<button type="submit" class="btn btn-primary">Registrar</button>
			</div>
		</form>
	      	 
	      	
	      </div>
			
	      <!-- Modal footer -->
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
	      </div>
	
	    </div>
	  </div>
	</div>
	
	<% //Aqui tendremos la paginacion%>
	<nav aria-label="paginacion estados">
	  <ul class="pagination justify-content-center">
	    <c:if test="${pagina eq 1}">
	    	<li class="page-item disabled">
		      <a class="page-link" href="${pageContext.servletContext.contextPath}/Estado?op=Listar&pagina=${pagina-1}">Previous</a>
		    </li>
	    </c:if>
	    <c:if test="${pagina > 1}">
	    	<li class="page-items">
		      <a class="page-link" href="${pageContext.servletContext.contextPath}/Estado?op=Listar&pagina=${pagina-1}">Previous</a>
		    </li>
	    </c:if>
	    <li class="page-item"><a class="page-link">Pagina ${pagina}</a></li>
	    <li class="page-item">
	      <a class="page-link" href="${pageContext.servletContext.contextPath}/Estado?op=Listar&pagina=${pagina+1}">Next</a>
	    </li>
	  </ul>
	</nav>
	
	
</body>
</html>