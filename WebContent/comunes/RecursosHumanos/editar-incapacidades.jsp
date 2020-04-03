<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri  = "http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html>
<head>

<title>Editar estados</title>

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
<body >
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" data-target="#navbarResponsive">
		<a class="btn btn-primary"href="${pageContext.servletContext.contextPath}/General?op=RegresarRH">Atras</a>
	</nav>
	<div  class="card bg-light" style="margin-top:100px">
	
  <p class="bg-primary text-white">EDITAR INCAPACIDADES</p>

		<form action="${pageContext.servletContext.contextPath}/Incapacidades?op=Modificar" method="post">
			<div class="form-group">
				<label for="" class="letra" float: left>ID: </label>
				<input type="text" readonly name="idincapacidad" readonly required placeholder="idincapacidad" value="${datosIncapacidades.getIdIncapacidad()}">
					<label>Fecha Inicio: </label>
				 <input type="date" name="fechaInicio" value="${datosIncapacidades.getFechaInicio()}" required class="form-control" required>
				
				<br>
				<label>Fecha Fin: </label>
	    		<input type="date" name="fechaFin" value="${datosIncapacidades.getFechaFin()}" required class="form-control" required>
				
				<br>
				<label>Enfermedad : </label>
				<input type="text"  onkeypress="return soloLetras(event)" class="form-control" id="enfermedad" name="enfermedad" style="text-transform:uppercase;"  value="${datosIncapacidades.getEnfermedad()}"required >
				
				<br>
				<label>Evidencia: </label>


				<br>
				<br>
				<label>Id empleado : </label>
			   <input type="number" class="form-control"  name="idEmpleado" value="${datosIncapacidades.getIdEmpleado()}" required  >
			

				<br>
				<label for="Estatus">Estatus</label>
		    		<select class="form-control" id="estatus" name = "estatus">
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