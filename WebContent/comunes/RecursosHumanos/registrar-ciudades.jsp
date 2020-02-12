<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri  = "http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html>
<head>

<title>Registrar ciudades</title>

	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap core CSS -->
    <link href="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Nuestras hojas de estilo-->
    <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/estilo.css">
   
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" data-target="#navbarResponsive">
		<button class="btn btn-primary" style="">Atras</button>
	</nav>
	<div  class="card bg-light" style="margin-top:100px">
	
  <p class="bg-primary text-white">REGISTRO DE CIUDADES</p>

		<form action="/Registrar?op=Estado" method="post">
			<div class="form-group">
				<label>Nombre: </label>
			<input type="text" class="form-control" id="usr">
				<br>
				<label for="Estatus">Estado</label>
		    		<select class="form-control" id="estatus" name = "estatus">
		      			<option value="A">Estados</option>
		      		
		    		</select>
				<br>
				<label for="Estatus">Estatus</label>
		    		<select class="form-control" id="estatus" name = "estatus">
		      			<option value="A">Activo</option>
		      			<option value="I">Inactivo</option>
		    		</select>
		    	<br>
		    	<a class="btn btn-primary" type="submit">Registrar</a>
			</div>
		</form>
	</div>
	
</body>
</html>