<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri  = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

<title>Historial Puestos</title>

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


	<div class="container" style="margin-top:100px">
	  <h2>Buscador</h2>
	  <p>Escribe la información a buscar</p>
	  <input class="form-control" id="myInput" type="text" placeholder="Buscador...">
	  		  <script>javascript:buscar();</script>
		<h2 align="center">Historial Puestos </h2>
		<hr class="bg-info">

		<div class="table-responsive table-bordered table-striped">
			<table class="table table-sm" style="text-align:center;width:fixed;table-layout:fixed;border-collapse:collapse">
				<thead class="thead-dark">

					<tr>
						<th>Historial Empleados</th>
					</tr>
				</thead>
				<tbody id="myTable">
				<c:forEach var="emp" items="${datos}">
					<tr>
						<td style="overflow-x:scroll;overflox-y:scroll;white-space: nowrap;" >
							<c:forEach var="puesto" items="${datos.getPuestos()}">
								<div class="card" style="width: 18rem;display: inline-block;">
								  <div class="card-body" style="white-space: normal;">
								    <h5 class="card-title">Vendedor</h5>
								    <p class="card-text">
								    	<b>Empleado:</b>
								    	<label>${emp.getNombre()}</label>
								    	<br>
								    	<b>Fecha Inicio:</b>
								    	<label>${puesto.getFechaInicio()}</label>
								    	<br>
								    	<b>Fecha Fin:</b>
								    	<label>${puesto.getFechaFin()}</label>
								    </p>
								  </div>
								</div>
							</c:forEach>
						</td>
						
					</tr>
				</c:forEach>
					
					
				</tbody>
			</table>
		</div>
	</div>



		<% /*Aqui tendremos la paginacion */%>
	<nav aria-label="paginacion ciudades">
	  <ul class="pagination justify-content-center">
	    <c:if test="${pagina eq 1}">
	    	<li class="page-item disabled">
		      <a class="page-link" href="${pageContext.servletContext.contextPath}/HistorialPuestos?op=Listar&pagina=${pagina-1}">Previous</a>
		    </li>
	    </c:if>
	    <c:if test="${pagina > 1}">
	    	<li class="page-items">
		      <a class="page-link" href="${pageContext.servletContext.contextPath}/HistorialPuestos?op=Listar&pagina=${pagina-1}">Previous</a>
		    </li>
	    </c:if>
	    <li class="page-item"><a class="page-link">Pagina ${pagina}</a></li>
	    <li class="page-item">
	      <a class="page-link" href="${pageContext.servletContext.contextPath}/HistorialPuestos?op=Listar&pagina=${pagina+1}">Next</a>
	    </li>
	  </ul>
	</nav>

</body>
</html>
