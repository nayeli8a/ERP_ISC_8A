<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<title>Consultar Ausencias Justificadas</title>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap core CSS and JS-->
<link
	href="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript"
	src="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/jquery/jquery.js"></script>
<script type="text/javascript"
	src="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Nuestras hojas de estilo-->
<link rel="stylesheet" type="text/css"
	href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/estilo.css">
<script type="text/javascript"
	src="<c:out value="${pageContext.servletContext.contextPath}"/>/js/funciones.js"></script>
<link rel="icon" type="image/png"
	href="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/carrito_32x.ico">

<script type="text/javascript">
function modificarAusencia(AoR,idAusencia) { 
	var aux = AoR;
	$.ajax({
		type:'POST',
		data:{op:'AJAX',AOR:AoR,Ausencia:idAusencia},
		url:'AusenciasJustificadas',
		success: 
			function(res){
				if(aux == 1)
				{
				  var x = document.getElementById(res);
				  x.setAttribute("style","background-color:green;");
				  x.querySelector(".texto").innerHTML = "Aceptada";
				}else
				{
				  var x = document.getElementById(res);
				  x.setAttribute("style","background-color:red;");
				  x.querySelector(".texto").innerHTML = "Rechazada";
				}
			  
			}
	});
}
</script>

</head>

<body>
	<c:if test="${not empty Errores }">
		<script>
			window.addEventListener("load", function() {
				alert("${Errores}");
			})
		</script>
	</c:if>
	<c:if test="${not empty Mensajes }">
		<script>
			window.addEventListener("load", function() {
				alert("${Mensajes}");
			})
		</script>
	</c:if>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
		data-target="#navbarResponsive">
		<a class="btn btn-primary"
			href="${pageContext.servletContext.contextPath}/General?op=RegresarRH">Atras</a>
	</nav>


	<div class="container" style="margin-top: 100px">
		<h2>Buscador</h2>
		<p>Escribe la información a buscar</p>
		<input class="form-control" id="myInput" type="text"
			placeholder="Buscador...">
		<script>
			javascript: buscar();
		</script>
		<h2 align="center">Ausencias Justificadas</h2>
		<hr class="bg-info">
		<button type="button" class="btn btn-success" id="agregar"
			data-toggle="modal" data-target="#modalRegistro">Agregar</button>
		<div class="table-responsive table-bordered table-striped">
			<table class="table table-sm">
				<thead class="thead-dark">

					<tr>
						<th>Nombre del Interesado</th>
						<th>Fecha Solicitud</th>
						<th>Fecha Inicio</th>
						<th>Fecha Fin</th>
						<th>Dias de descanso</th>
						<th>Nombre del Autorizador</th>
						<th>Estatus ausencia </th>
						<th>Opciones</th>
						<th></th>
					</tr>
				</thead>
				<tbody id="myTable">
					<c:forEach var="dato" items="${datos}">
						<c:if test="${dato.getEstatus() eq 'I'}">
						
							<tr>
								<td>${dato.getNombreAusente()}</td>
								<td>${dato.getFechaSolicitud()}</td>
								<td>${dato.getFechaInicio()}</td>
								<td>${dato.getFechaFin()}</td>
								<td>${dato.getDiasDescanso()}</td>
								<td>${dato.getNombreJefe()}</td>
							
							</tr>
						</c:if>
						<c:if test="${dato.getEstatusAusencia() eq 'R'}">
						
							<tr>
								<td>${dato.getNombreAusente()}</td>
								<td>${dato.getFechaSolicitud()}</td>
								<td>${dato.getFechaInicio()}</td>
								<td>${dato.getFechaFin()}</td>
								<td>${dato.getDiasDescanso()}</td>
								<td>${dato.getNombreJefe()}</td>
								<td>
									<div id="status-${dato.getIdAusencia()}" style="background-color: red;">
									<h4 class="texto">Rechazada</h4>
									</div>
								</td>
								
								<td>
									<form action="AusenciasJustificadas" method="post">
										<input type="hidden" name="id" value="${dato.getIdAusencia()}">
										<div id="${dato.getIdAusencia()}">
											<input type="submit" 
												class="btn btn-danger" name="op" value="Eliminar"
												onclick="javascript:eliminar()">
										</div>
									</form>
								</td>
								<td>
									<button type="button" onclick="modificarAusencia(1,${dato.getIdAusencia()})">Aceptar</button>
									<button type="button" onclick="modificarAusencia(2,${dato.getIdAusencia()})">Rechazar</button>
								</td>
							
							</tr>
						</c:if>
						<c:if test="${dato.getEstatusAusencia() eq 'A'}">
						
							<tr>
								<td>${dato.getNombreAusente()}</td>
								<td>${dato.getFechaSolicitud()}</td>
								<td>${dato.getFechaInicio()}</td>
								<td>${dato.getFechaFin()}</td>
								<td>${dato.getDiasDescanso()}</td>
								<td>${dato.getNombreJefe()}</td>
								<td>
									<div id="status-${dato.getIdAusencia()}" style="background-color: green;">
									<h4 class="texto">Aceptada</h4>
									</div>
								</td>
								
								<td>
									<form action="AusenciasJustificadas" method="post">
										<input type="hidden" name="id" value="${dato.getIdAusencia()}">
										<div id="${dato.getIdAusencia()}">
											<input type="submit" 
												class="btn btn-danger" name="op" value="Eliminar"
												onclick="javascript:eliminar()">
										</div>
									</form>
								</td>
								<td></td>
							
							</tr>
						</c:if>
							<c:if test="${dato.getEstatusAusencia() eq 'P'}">
						
							<tr>
								<td>${dato.getNombreAusente()}</td>
								<td>${dato.getFechaSolicitud()}</td>
								<td>${dato.getFechaInicio()}</td>
								<td>${dato.getFechaFin()}</td>
								<td>${dato.getDiasDescanso()}</td>
								<td>${dato.getNombreJefe()}</td>
								<td>
									<div id="status-${dato.getIdAusencia()}" style="background-color: orange;">
									<h4 class="texto">Pendiente</h4>
									</div>
								</td>
								
								<td>
									<form action="AusenciasJustificadas" method="post">
										<input type="hidden" name="id" value="${dato.getIdAusencia()}">
										<div id="${dato.getIdAusencia()}">
											<input type="submit" class="btn btn-warning" name="op"
												value="Editar"> <input type="submit"
												class="btn btn-danger" name="op" value="Eliminar"
												onclick="javascript:eliminar()">
										</div>
									</form>
								</td>
								<td>
									<button type="button" onclick="modificarAusencia(1,${dato.getIdAusencia()})">Aceptar</button>
									<button type="button" onclick="modificarAusencia(2,${dato.getIdAusencia()})">Rechazar</button>
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
					<h4 class="modal-title">Registro de Ausencias Justificadas</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body" id="modal_div" > 
					<%//Aqui va todo el cuerpo del modal%>
					<div class="container" style="border: dotted">
						<div class="row">
							<div class="col-md-12" style="text-align: center">
								<label><b>Buscar el NSS de los empleados</b></label>
							</div>
							
							<div class="col-md-6" style="text-align: center">
								<label>Nombre</label>
								<br>
								<input type="text" style="width:100%" id="find-nombre">
							</div>
							<div class="col-md-3" style="text-align: center">
								<label>A. Paterno</label>
								<br>
								<input type="text" style="width:100%" id="find-apaterno">
							</div>
							<div class="col-md-3" style="text-align: center">
								<label>A. Materno</label>
								<br>
								<input type="text" style="width:100%" id="find-amaterno">
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-md-12" style="text-align:center">
								<button type="button" onclick="buscar_nss_ajax()" class="btn btn-primary">Buscar</button>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-md-12" style="text-align:center">
								<label>NSS Empleado</label>
								<br>
								<span id="find_nss"></span>
							</div>
						</div>
						<br>
					</div>
					
					<form
						action="${pageContext.servletContext.contextPath}/Registrar?op=AusenciasJustificadas"
						 onsubmit="return validarFechasAusencias();"  method="post">
						<div class="container">
							<legend> Dato del Ausente: </legend>
							<div class="row">
								<div class="col-md-4" id="nssAusente">
									<div class="form-group">
										<input type="text" class="form-control"
											placeholder="NSS del Ausente" name="nssAusente" required >
									</div>
								</div>
							</div>

							<legend> Datos de la Ausencia: </legend>
							<div class="row">
								<div class="col-md-6">
									<label>Fecha de Solicitud</label>
									<div class="form-group">
										<input type="date" name="fechaSolicitud" id ="fechaSolicitud" value="" readonly
											class="form-control">
									</div>
								</div>

								<div class="col-md-6">
									<label>Fecha Inicio</label>
									<div class="form-group">
										<input type="date" name="fechaInicio" id ="fechaInicio" value="" onchange="restar(this.value);" required
											class="form-control">
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-4">
									<label>Fecha Fin</label>
									<div class="form-group">
										<input type="date" name="fechaFin" id="fechaFin" value=""  onchange="restar(this.value);" required
											class="form-control">
									</div>
								</div>
								<div class="col-md-4">
									<label>Tipo:</label> 
									<select
										class="form-control" id="tipo" name="tipo">
										<option value="V">Vacaciones</option>
										<option value="P">Permiso</option>
									</select>
								</div>
									<div class="col-md-4" >
									<label>Dias descanso:</label>
									<div class="form-group" >
										<input type="text" class="form-control" name="dias" id="dias" value="" readonly>
									</div>
								</div>
							</div>
							<legend> Dato del Jefe: </legend>
							<div class="row">
								<div class="col-md-4" id="nombreS">
									<div class="form-group">
										<input type="text" class="form-control"
											placeholder="NSS del Supervisor" name="nssJefe" required>
									</div>
								</div>
							
							</div>

						</div>
						<br>
						<button type="submit" class="btn btn-primary">Registrar</button>
					</form>
				</div>


				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
				</div>

			</div>
		</div>
	</div>

	<%
		//Aqui tendremos la paginacion
	%>
	<nav aria-label="paginacion AusenciasJustificadas">
		<ul class="pagination justify-content-center">
			<c:if test="${pagina eq 1}">
				<li class="page-item disabled"><a class="page-link"
					href="${pageContext.servletContext.contextPath}/AusenciasJustificadas?op=Listar&pagina=${pagina-1}">Previous</a>
				</li>
			</c:if>
			<c:if test="${pagina > 1}">
				<li class="page-items"><a class="page-link"
					href="${pageContext.servletContext.contextPath}/AusenciasJustificadas?op=Listar&pagina=${pagina-1}">Previous</a>
				</li>
			</c:if>
			<li class="page-item"><a class="page-link">Pagina ${pagina}</a></li>
			<li class="page-item"><a class="page-link"
				href="${pageContext.servletContext.contextPath}/AusenciasJustificadas?op=Listar&pagina=${pagina+1}">Next</a>
			</li>
		</ul>
	</nav>
</body>
</html>
