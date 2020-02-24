<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri  = "http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html>
<head>

<title>Registrar Deducciones</title>

	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap core CSS -->
    <link href="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Nuestras hojas de estilo-->
    <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/estilo.css">
   
</head>
<body >
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" data-target="#navbarResponsive">
		<a class="btn btn-primary"href="${pageContext.servletContext.contextPath}/General?op=RegresarRH">Atras</a>
	</nav>
	
	
	<div class="card bg-light" style="margin-top:100px">
	  <p class="bg-primary text-white">REGISTRO DE DEDUCCIONES</p>
		<form action="${pageContext.servletContext.contextPath}/Registrar?op=Deducciones" method="post">
			<div class="form-group">
				<label>Nombre: </label>
				<input type="text" class="form-control" id="nom_deducciones" name="nom_deducciones">
				<br>
				<label>Descripcion: </label>
				<input type="text" class="form-control" id="descripcion" name="descripcion" >
				<br>
				<label>Porcentaje: </label>
				<input type="number" class="form-control" id="porcentaje" name="porcentaje" min="1.0" max="100.0" onkeypress="if ( isNaN( String.fromCharCode(event.keyCode) )) return false;">

				<label for="Estatus">Estatus</label>
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