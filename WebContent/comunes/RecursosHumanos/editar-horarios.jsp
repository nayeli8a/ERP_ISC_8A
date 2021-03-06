<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>

<title>Editar Horarios</title>

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
	<div class="card bg-light" style="margin-top: 100px">

		<p class="bg-primary text-white">EDICION DE HORARIOS</p>

		<form
			action="${pageContext.servletContext.contextPath}/Horarios?op=Modificar"
			method="post">
			<div class="form-group">

				<legend> Datos del empleado: </legend>
				<div class="row">
					<div class="col-md-2">

						<div class="form-group">
							<label>Nombre : </label> <input type="texto" name="nombre"
								class="form-control" value="${datoshorarios.getNombreEmpleado()}" readonly>
						</div>
					</div>
					<div class="col-md-2">

						<div class="form-group">
							<label>NSS : </label> <input type="texto" name="nss"
								class="form-control" value="${datoshorarios.getNss()}" readonly>
						</div>
					</div>

					<div class="col-md-2">
						<div class="form-group">
							<label>Empleado: </label> <input type="number" name="idEmpleado"
								class="form-control" value="${datoshorarios.getIdEmpleado()}"
								readonly>
						</div>
					</div>
				</div>


				<legend> Horario: </legend>

				<label for="" class="letra" float: left>ID: </label> <input
					type="text" name="idhorario" readonly required
					placeholder="idhorario" value="${datoshorarios.getIdHorario()}">
				<br>
				<div class="row">


					<div class="col-md-2">
						<div class="form-group">
							<label>Hora Inicio:</label> <input type="time" name="horaInicio"
								class="form-control" required
								value="${datoshorarios.getHoraInicio()}">
						</div>
					</div>

					<div class="col-md-2">
						<div class="form-group">

							<label>Hora fin:</label> <input type="time" name="horaFin"
								class="form-control" required
								value="${datoshorarios.getHoraFin()}">
						</div>
					</div>


					<label>Días: </label> <br>
					<c:if test="${fn:contains(datoshorarios.getDias(),'LU')}">
						<input type="checkbox" name="lunes" value="LU" checked />Lunes
				</c:if>
					<c:if test="${!fn:contains(datoshorarios.getDias(),'LU')}">
						<input type="checkbox" name="lunes" value="LU" />Lunes
				</c:if>

					<c:if test="${fn:contains(datoshorarios.getDias(),'MA')}">
						<input type="checkbox" name="martes" value="MA" checked />Martes
				</c:if>
					<c:if test="${!fn:contains(datoshorarios.getDias(),'MA')}">
						<input type="checkbox" name="martes" value="MA" />Martes
				</c:if>

					<c:if test="${fn:contains(datoshorarios.getDias(),'MI')}">
						<input type="checkbox" name="miercoles" value="MI" checked />Miercoles
				</c:if>
					<c:if test="${!fn:contains(datoshorarios.getDias(),'MI')}">
						<input type="checkbox" name="miercoles" value="MI" />Miercoles
				</c:if>

					<c:if test="${fn:contains(datoshorarios.getDias(),'JU')}">
						<input type="checkbox" name="jueves" value="JU" checked />Jueves
				</c:if>
					<c:if test="${!fn:contains(datoshorarios.getDias(),'JU')}">
						<input type="checkbox" name="jueves" value="JU" />Jueves
				</c:if>

					<c:if test="${fn:contains(datoshorarios.getDias(),'VI')}">
						<input type="checkbox" name="viernes" value="VI" checked />Viernes
				</c:if>
					<c:if test="${!fn:contains(datoshorarios.getDias(),'VI')}">
						<input type="checkbox" name="viernes" value="VI" />Viernes
				</c:if>

					<c:if test="${fn:contains(datoshorarios.getDias(),'SA')}">
						<input type="checkbox" name="sabado" value="SA" checked />Sabado
				</c:if>
					<c:if test="${!fn:contains(datoshorarios.getDias(),'SA')}">
						<input type="checkbox" name="sabado" value="SA" />Sabado
				</c:if>

					<c:if test="${fn:contains(datoshorarios.getDias(),'DO')}">
						<input type="checkbox" name="domingo" value="DO" checked />Domingo
				</c:if>
					<c:if test="${!fn:contains(datoshorarios.getDias(),'DO')}">
						<input type="checkbox" name="domingo" value="DO" />Domingo
				</c:if>
					<br>


					<div class="col-md-2">
						<div class="form-group">
							<label for="Estatus">Estatus:</label> <select
								class="form-control" id="estatus" name="estatus">
								<option value="A">Activo</option>
								<option value="I">Inactivo</option>
							</select>
						</div>
					</div>
				</div>
			</div>

			<button type="submit" class="btn btn-primary">Aceptar</button>

		</form>
	</div>

</body>
</html>
