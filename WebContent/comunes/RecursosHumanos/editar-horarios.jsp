<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri  = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

<title>Editar Horarios</title>

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
<body onkeypress="return soloLetras(event)" >
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" data-target="#navbarResponsive">
		<a class="btn btn-primary"href="${pageContext.servletContext.contextPath}/General?op=RegresarRH">Atras</a>
	</nav>
	<div  class="card bg-light" style="margin-top:100px">

  <p class="bg-primary text-white">EDITAR DE Horarios</p>

		<form action="${pageContext.servletContext.contextPath}/Horario?op=Modificar" method="post">
			<div class="form-group">
				<label for="" class="letra" float: left>ID: </label>
				<input type="text" readonly name="idhorario" readonly required placeholder="idhorario" value="${datoshorarios.getIdHorario()}">
				<br>
				<label>Hora Inicio:</label>
				<input type="time" class="form-control"  required value="${datoshorarios.getHoraInicio()}">
				<br>
				
				<label>Hora fin:</label>
				<input type="time"  class="form-control"   required value="${datoshorarios.getHoraFin()}">
				<br>

				<label>Días: </label>
			      <br>
			      <label>LUNES</label>
			      <input type="radio" class="form-control" >
			      
			      <label>MARTES</label>
			      <input type="radio" class="form-control">
			      
			      <label>MIÉRCOLES</label>
			      <input type="radio" class="form-control">
			      
			      <label>JUEVES</label>
			      <input type="radio" class="form-control">
			      
			      <label>VIERNES</label>
			      <input type="radio" class="form-control">
			      <br>
			      <label>ID Empleado: </label>
			      <input type="number" class="form-control" required value="${datoshorarios.getIdEmpleado()}">
				  <br>

				<label for="Estatus">Estatus:</label>
		    		<select class="form-control" id="estatus" name ="estatus">
	      				<option value="A">Activo</option>
	      				<option value="I">Inactivo</option>
		    		</select>
		    	<br>
		    	<button type="submit" class="btn btn-primary">Aceptar</button>
			</div>
		</form>
	</div>

</body>
</html>
