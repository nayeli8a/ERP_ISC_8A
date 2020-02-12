<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri  = "http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html>
<head>

<title>Consultar Estados</title>

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
		<button class="btn btn-primary" style="">Atras</button>
	</nav>
	
	
	<div class="container" style="margin-top:100px">
		<h2 align="center">Estados</h2>
		<form action="Estado?op=Listar" method="post" >
			<input type="submit" name="op" value="Actualizar" class="btn btn-info">
		</form>
		<hr class="bg-info">
		<div class="table-responsive table-bordered table-striped">
			<table class="table table-sm">
				<thead class="thead-dark">

					<tr>
						<th>ID</th>
						<th>Nombre</th>
						<th>Siglas</th>
						<th>Estatus</th>
					</tr>
				</thead>
				<tbody id="myTable">
					<c:forEach var="dato" items="${datos}">
						<tr>
							<td>${dato.getIdEstado()}</td>
							<td>${dato.getNombre()}</td>
							<td>${dato.getSiglas()}</td>
							<td>${dato.getEstatus()}</td>
							<td>
								<form action="Estado" method="post">
									<input type="hidden" name="id" value="${dato.getIdEstado()}">
									<div id="${dato.getIdEstado()}">
										<input type="submit" class="btn btn-warning" name="op" value="Editar"> 
										<input type="submit" class="btn btn-danger" name="op" value="Eliminar" onclick="javascript:eliminar()">									</div>
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
</body>
</html>