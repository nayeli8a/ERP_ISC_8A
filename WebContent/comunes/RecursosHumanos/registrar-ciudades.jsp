<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri  = "http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html>
<head>

<title>Registrar ciudades</title>

	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap core CSS and JS-->
	<link href="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script type="text/javascript" src="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/jquery/jquery.js"></script>
	<script type="text/javascript" src="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/bootstrap/js/bootstrap.min.js"></script>
	
    <!-- Nuestras hojas de estilo-->
    <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/estilo.css">
   
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" data-target="#navbarResponsive">
		<a class="btn btn-primary" href="<c:out value="${pageContext.servletContext.contextPath}"/>/comunes/Inicio/Inicio.jsp">Atras</a>
	</nav>
	<div  class="card bg-light" style="margin-top:100px">
	
  <p class="bg-primary text-white">REGISTRO DE CIUDADES</p>

		<form action="${pageContext.servletContext.contextPath}/Registrar?op=Ciudad" method="post">
			<div class="form-group">
				<label for="Estatus">Estado:</label>
		    		<select class="form-control" id="nom_estado" name = "nom_estado">
		      			<c:forEach var="dato" items="${datos}">
		      				<option value="${dato.getNombre()}">${dato.getNombre()}</option>
		      			</c:forEach>
		    		</select>
		    	<br>
		    	
				<label>Nombre Ciudad:</label>
				<input type="text" class="form-control" id="nom_ciudad" name="nom_ciudad">
				<br>
				<label for="Estatus">Estatus:</label>
		    		<select class="form-control" id="estatus" name = "estatus">
	      				<option value="A">Activo</option>
	      				<option value="I">Inactivo</option>
		    		</select>
		    	<br>
		    	<button type="submit" class="btn btn-primary">Registrar</button>
			</div>
		</form>
	</div>
	
</body>
</html>