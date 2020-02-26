<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri  = "http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html>
<head>

<title>Editar deducciones</title>

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
		<a class="btn btn-primary"href="${pageContext.servletContext.contextPath}/General?op=RegresarRH">Atras</a>
	</nav>
	<div  class="card bg-light" style="margin-top:100px">
	
  <p class="bg-primary text-white">EDITAR DE DEDUCCIONES</p>


		<form action="${pageContext.servletContext.contextPath}/Deducciones?op=Modificar" method="post">
			<div class="form-group">
				<label for="" class="letra" float: left>ID: </label>
				<input type="text" readonly name="idDeduccion" readonly required placeholder="idDeduccion" value="${datosdeducciones.getIdDeduccion()}">
				<br>
				<label>Nombre :</label>
				<input type="text" class="form-control" id="nom_deducciones" name="nom_deducciones" required value="${datosdeducciones.getNombre()}">
				<br>
				
				<label>Descripcion :</label>
				<input type="text" class="form-control" id="descripcion" name="descripcion"  required value="${datosdeducciones.getDescripcion()}">
				<br>
				
				<label>Porcentaje :</label>
				<input type="number" class="form-control" id="porcentaje" name="porcentaje" min="1.0" max="100.0" required onkeypress="if ( isNaN( String.fromCharCode(event.keyCode) )) return false;" value="${datosdeducciones.getPorcentaje()}">
				<br>
				
				
				<label for="Estatus">Estatus:</label>
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