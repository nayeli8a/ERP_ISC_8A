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
   
</head>
<body onkeypress="return soloLetras(event)" >
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" data-target="#navbarResponsive">
		<a class="btn btn-primary"href="${pageContext.servletContext.contextPath}/General?op=RegresarRH">Atras</a>
	</nav>
	<div  class="card bg-light" style="margin-top:100px">
	
  <p class="bg-primary text-white">EDITAR DE ESTADOS</p>

		<form action="${pageContext.servletContext.contextPath}/Estado?op=Modificar" method="post">
			<div class="form-group">
				<label for="" class="letra" float: left>ID: </label>
				<input type="text" readonly name="idestado" readonly required placeholder="idestado" value="${datosestado.getIdEstado()}">
				<br>
				<label>Nombre Estado:</label>
				<input type="text" onkeypress="return soloLetras(event)" class="form-control" style="text-transform:uppercase;" id="nom_estado" name="nom_estado" required value="${datosestado.getNombre()}">
				<br>
				
				<label>Siglas:</label>
				<input type="text"  onkeypress="return soloLetras(event)" class="form-control" style="text-transform:uppercase;" id="siglas" name="siglas" required value="${datosestado.getSiglas()}">
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