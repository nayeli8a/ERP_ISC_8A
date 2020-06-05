<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri  = "http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html>
<head>

		
<title>Editar Percepciones</title>

	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap core CSS and JS-->
	<link href="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script type="text/javascript" src="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/jquery/jquery.js"></script>
	<script type="text/javascript" src="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/bootstrap/js/bootstrap.min.js"></script>
	
    <!-- Nuestras hojas de estilo-->
    <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/estilo.css">
    <script type="text/javascript" src="<c:out value="${pageContext.servletContext.contextPath}"/>/js/funciones.js"></script>
	<link rel="icon" type="image/png" href="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/carrito_32x.ico">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" data-target="#navbarResponsive">
		<a class="btn btn-primary"href="${pageContext.servletContext.contextPath}/General?op=RegresarRH">Atras</a>
	</nav>
	<div  class="card bg-light" style="margin-top:100px">
	
  <p class="bg-primary text-white">EDITAR PERCEPCIONES</p>


		<form action="${pageContext.servletContext.contextPath}/Percepciones?op=Modificar" method="post">
			<div class="form-group">
				<label for="" class="letra" float: left>ID: </label>
				<input type="text" readonly name="idpercepcion" readonly required placeholder="idpercepcion" value="${datospercepciones.getIdPercepcion()}">
				<br>
				<label>Nombre :</label>
				<input type="text" class="form-control" id="nom_percepciones" name="nom_percepciones" required value="${datospercepciones.getNombre()}">
				<br>
				
				<label>Descripcion :</label>
				<input type="text" class="form-control" id="descripcion" name="descripcion" required value="${datospercepciones.getDescripcion()}">
				<br>
				
				<label>Dias a pagar :</label>
				<input type="number" class="form-control" id="diasPagar" name="diasPagar" min="1" required min="1" max="30"  onkeypress="if ( isNaN( String.fromCharCode(event.keyCode) )) return false;"value="${datospercepciones.getDiasPagar()}">
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