<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri  = "http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html>
<head>

<title>Editar Documentacion Empleado</title>

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
	
	<div class="card bg-light" style="margin-top:100px;text-align:center;">
  		<p class="bg-primary text-white">EDITAR DOCUMENTACION EMPLEADO</p>
		<form 
		enctype="multipart/form-data"
		action="${pageContext.servletContext.contextPath}/DocumentacionEmpleado?op=Modificar" 
		method="post">
			<div class="form-group">
				<div class="container">
					<div class="row" style="text-align: left;">
						<div class="col-sm-8">
							<input type="hidden" id="idDocumento" name="idDocumento" value="${datos.getIdDocumento()}">
							<img src="IMG?op=documentacion&idDocumento=${datos.getIdDocumento()}" style="max-width:100%;max-height:100%;">
						</div>
						<div class="col-sm-4">
							<div class="col">
								<label>Sube el nuevo documento:</label>
								<br>
								<input type="file" id="documento" name="documento" required>
							</div>
							<br>
							<div class="col">
								<label>Nombre del Documento:</label>
								<br>
								<input type="text" id="nombreDocumento" name="nombreDocumento" 
								value="${datos.getNombreDocumento()}" required>
							</div>
							<br>
							<div class="col">
								<label>Fecha de Entrega:</label>
								<br>
								<input type="date" id="fechaEntrega" name="fechaEntrega"
								value="${datos.getFechaEntrega()}" required>
							</div>
							<br>
							<div class="col">
								<label>ID del Empleado:</label>
								<br>
								<input type="number" id="idEmpleado" name="idEmpleado"
								value="${datos.getIdEmpleado()}" required>
							</div>
							<div class="col">
								<label for="Estatus">Estatus:</label>
					    		<select class="form-control" id="estatus" name = "estatus">
				      				<option value="A">Activo</option>
				      				<option value="I">Inactivo</option>
					    		</select>
							</div>
						</div>
					</div>
				</div>
		    	<button type="submit" class="btn btn-primary">Aceptar</button>
			</div>
		</form>
	</div>
	
</body>
</html>