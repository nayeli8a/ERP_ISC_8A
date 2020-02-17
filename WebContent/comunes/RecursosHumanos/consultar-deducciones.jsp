<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri  = "http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html>
<head>

<title>Consultar Deducciones</title>

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
		<a class="btn btn-primary"href="${pageContext.servletContext.contextPath}/comunes/RecursosHumanos/paginaPrincipalRH.jsp">Atras</a>
	</nav>
	
	
	<div class="container" style="margin-top:100px">
		<h2 align="center">Deducciones</h2>
		<form action="Deducciones?op=Listar" method="post" >
			<input type="submit" name="op" value="Actualizar" class="btn btn-info">
		</form>
		<hr class="bg-info">
		<div class="table-responsive table-bordered table-striped">
			<table class="table table-sm">
				<thead class="thead-dark">

					<tr>
						<th>ID</th>
						<th>Nombre</th>
						<th>Descripcion</th>
						<th>Porcentaje</th>
						<th>Estatus</th>
					</tr>
				</thead>
				<tbody id="myTable">
					<c:forEach var="dato" items="${datos}">
						<c:if test="${dato.getEstatus() eq 'I'}">
							<tr>
							<td>${dato.getIdDeduccion()}</td>
							<td>${dato.getNombre()}</td>
							<td>${dato.getDescripcion()}</td>
							<td>${dato.getPorcentaje()}</td>
							<td>${dato.getEstatus()}</td>
							</tr>
						</c:if>
						<c:if test="${dato.getEstatus() eq 'A'}">
							<tr>
							<td>${dato.getIdDeduccion()}</td>
							<td>${dato.getNombre()}</td>
							<td>${dato.getDescripcion()}</td>
							<td>${dato.getPorcentaje()}</td>
							<td>${dato.getEstatus()}</td>
							<td>
								<form action="Deducciones" method="post">
									<input type="hidden" name="id" value="${dato.getIdDeduccion()}">
									<div id="${dato.getIdDeduccion()}">
										<input type="submit" class="btn btn-warning" name="op" value="Editar"> 
										<input type="submit" class="btn btn-danger" name="op" value="Eliminar" onclick="javascript:eliminar()">									</div>
								</form>
							</td>
							</tr>
						</c:if>
						
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
</body>
</html>