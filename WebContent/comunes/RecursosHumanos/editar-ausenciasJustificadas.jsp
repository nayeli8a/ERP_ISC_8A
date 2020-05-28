<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<title>Editar Ausencias Justificadas</title>

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
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
		data-target="#navbarResponsive">
		<a class="btn btn-primary"
			href="${pageContext.servletContext.contextPath}/General?op=RegresarRH">Atras</a>
	</nav>

	<div class="card bg-light" style="margin-top: 80px">
		<p class="bg-primary text-white"> EDITAR AUSENCIAS JUSTIFICADAS</p>

		<form action="${pageContext.servletContext.contextPath}/AusenciasJustificadas?op=Modificar"
			onsubmit="return validarFechasAusenciasEditar();" method="post">
			<div class="container">
				<legend> Datos del solicitante: </legend>
				<div class="row">
					<div class="col-md-5">
					<label>Nombre</label>
						<div class="form-group">
							<input type="text" class="form-control"
								 name="nombreAusente"  value="${datosAusencia.getNombreAusente()}" readonly>
						</div>
					</div>
					<div class="col-md-4">
					<label>NSS</label>
						<div class="form-group">
							<input type="text" class="form-control"
								 name="nssAusente"  value="${datosAusencia.getNssAusente()}" readonly>
						</div>
					</div>
					
				</div>

				<legend> Datos de la Ausencia: </legend>
				<div class="row">
					<div class="col-md-4">
						<label>Fecha de Solicitud</label>
						<div class="form-group">
							<input type="date" class="form-control" 
								name="fecha-Solicitud" id="fecha-Solicitud"
								value="${datosAusencia.getFechaSolicitud()}" >
						</div>
					</div>

					<div class="col-md-4">
						<label>Fecha Inicio</label>
						<div class="form-group">
							<input type="date" name="fechaInicio" id="fechaInicio" value="${datosAusencia.getFechaInicio()}" 
								onchange="restar(this.value);" required class="form-control">
						</div>
					</div>
					<div class="col-md-4">
						<label>Fecha Fin</label>
						<div class="form-group">
							<input type="date" name="fechaFin" id="fechaFin" value="${datosAusencia.getFechaFin()}" 
								onchange="restar(this.value);" required class="form-control">
						</div>
					</div>
					
				</div>

				<div class="row">
					
					<div class="col-md-4">
						<label>Tipo:</label> 
						<select class="form-control" id="tipo" name="tipo" required>
						<option value="${datosAusencia.getTipo()}" selected> 
							${datosAusencia.getTipo()}
						</option>
							<option value="V">Vacaciones</option>
							<option value="P">Permiso</option>
						</select>
					</div>
					
					
					
					<div class="col-md-4">
						<label>Dias descanso:</label>
						<div class="form-group">
							<input type="text" class="form-control" name="dias" id="dias"
								value="${datosAusencia.getDiasDescanso()}"  readonly>
						</div>
					</div>
					
					
				
					
					
					<div class="col-md-4">
						<label>Estatus de la Ausencia</label>
						<div class="form-group">
							<input type="text" class="form-control" name="estatusAusencia" id="estatusAusencia"
								<c:if test="${datosAusencia.getEstatusAusencia() eq 'P' }">
								value="${datosAusencia.getEstatusAusencia()}" readonly>
								</c:if>
								
						</div>
					</div>
				</div>
				
				<legend> Autorizador: </legend>
				<div class="row">
					<div class="col-md-4">
					<label>Nombre</label>
						<div class="form-group">
							<input type="text" class="form-control"
								 name="nombreAusente"  value="${datosAusencia.getNombreAusente()}" readonly>
						</div>
					</div>
					<div class="col-md-4">
					<label>NSS</label>
						<div class="form-group">
							<input type="text" class="form-control"
								 name="nombreAusente"  value="${datosAusencia.getNssAusente()}" readonly>
						</div>
						<div class="form-group">
							<input type="hidden" class="form-control"
								 name="idAusencia"  value="${datosAusencia.getIdAusencia()}" readonly>
						</div>
					</div>

			</div>



			<button type="submit" class="btn btn-primary">Aceptar</button>
		</form>
	</div>
</body>
</html>
