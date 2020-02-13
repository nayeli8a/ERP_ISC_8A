<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri  = "http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html>
<head>

<title>Registrar Percepciones</title>

	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap core CSS -->
    <link href="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Nuestras hojas de estilo-->
    <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/estilo.css">
   
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" data-target="#navbarResponsive">
		<a class="btn btn-primary" href="<c:out value="${pageContext.servletContext.contextPath}"/>/comunes/Inicio/Inicio.jsp">Atras</a>
	</nav>
	
	
	<div class="card bg-light" style="margin-top:100px">
	  <p class="bg-primary text-white">REGISTRO DE PERCEPCIONES</p>
		<form action="${pageContext.servletContext.contextPath}/Registrar?op=Percepciones" method="post">
			<div class="form-group">
				<label>Nombre: </label>
				<input type="text" class="form-control"  name="nom_percepciones">
				<br>
				<label>Descripcion: </label>
				<input type="text" class="form-control"  name="descripcion">
				<br>
				<label>Dias a pagar: </label>
				<input type="integer" class="form-control" name="diasPagar">
				<label for="Estatus">Estatus</label>
		    		<select class="form-control" name = "estatus">
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