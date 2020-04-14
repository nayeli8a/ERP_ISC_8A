<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<title>Editar Incapacidades</title>

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
</head>
<body>
	<c:if test="${not empty Errores }">
		<script>
		window.addEventListener("load",function(){
			alert("${Errores}");
			})
		</script>
	</c:if>
	<c:if test="${not empty Mensajes }">
		<script>
		window.addEventListener("load",function(){
			alert("${Mensajes}");
			})
		</script>
	</c:if>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
		data-target="#navbarResponsive">
		<a class="btn btn-primary"
			href="${pageContext.servletContext.contextPath}/General?op=RegresarRH">Atras</a>
	</nav>
	<div class="card bg-light" style="margin-top: 80px">
		<p class="bg-primary text-white">EDITAR INCAPACIDADES</p>

		<form action="${pageContext.servletContext.contextPath}/Incapacidades?op=Modificar"
			onsubmit="return validarFechas();" method="post">
			
			<div class="form-group">

				<legend> Datos del empleado: </legend>
				<div class="row">

					<div class="col-md-2">
						<div class="form-group">
							<input type="texto" name="nombre" class="form-control"
								value="${datosIncapacidades.getNombre()}" readonly>
						</div>
					</div>
					<div class="col-md-2">
						<div class="form-group">
							<input type="texto" name="apaterno" class="form-control"
								value="${datosIncapacidades.getApaterno()}" readonly>
						</div>
					</div>
					<div class="col-md-2">
						<div class="form-group">
							<input type="texto" name="amaterno" class="form-control"
								value="${datosIncapacidades.getAmaterno()}" readonly>
						</div>
					</div>

				</div>
				<div class="row">

					<div class="col-md-2">

						<div class="form-group">
							<label>NSS : </label> <input type="texto" name="Nss"
								class="form-control" value="${datosIncapacidades.getNss()}"
								readonly>
						</div>
					</div>
					<div class="col-md-2">
						<div class="form-group">
							<label>Empleado: </label> <input type="number" name="idEmpleado"
								class="form-control"
								value="${datosIncapacidades.getIdEmpleado()}" readonly>
						</div>
					</div>
				</div>

				<legend> Incapacidad: </legend>
				<div class="col-md-2">
					<div class="form-group">
						<label>ID Incapacidad </label> <input type="number"
							name="idIncapacidad" id="idIncapacidad "
							value="${datosIncapacidades.getIdIncapacidad()}"
							class="form-control" readonly>
					</div>
				</div>

				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label>Fecha Inicio: </label> <input type="date"
								name="fechaInicio" id="fechaInicio "
								value="${datosIncapacidades.getFechaInicio()}"
								class="form-control" required>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label>Fecha Fin: </label> <input type="date" name="fechaFin"
								id="fechaFin" value="${datosIncapacidades.getFechaFin()}"
								class="form-control" required>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label>Enfermedad : </label> <input type="text"
								class="form-control" id="enfermedad" name="enfermedad"
								value="${datosIncapacidades.getEnfermedad()}" required>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">

							<label for="Estatus">Estatus</label> <select class="form-control"
								id="estatus" name="estatus">
								<option value="A">Activo</option>
								<option value="I">Inactivo</option>
							</select>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label>Evidencia: </label> <input type="file"
								class="form-control-file border">
						</div>
					</div>

				</div>


				<br>
				<button type="submit" class="btn btn-primary">Aceptar</button>
			</div>
		</form>
	</div>

</body>
</html>