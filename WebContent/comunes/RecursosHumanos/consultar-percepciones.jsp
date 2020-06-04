<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri  = "http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html>
<head>

<title>Consultar Percepciones</title>

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
		<h2 align="center">Percepciones</h2>
		<hr class="bg-info">
		<button type="button" class="btn btn-success" id="agregar" data-toggle="modal" data-target="#modalRegistro" >Agregar</button>
		
		<div class="table-responsive table-bordered table-striped">
			<table class="table table-sm">
				<thead class="thead-dark">
					<tr>
						<th>ID</th>
						<th>Nombre</th>
						<th>Descripcion</th>
						<th>Dias a pagar</th>
						<th>Estatus</th>
					</tr>
				</thead>
				<tbody id="myTable">
					<c:forEach var="dato" items="${datos}">
						<c:if test="${dato.getEstatus() eq 'I'}">
							<tr>
							<td>${dato.getIdPercepcion()}</td>
							<td>${dato.getNombre()}</td>
							<td>${dato.getDescripcion()}</td>
							<td>${dato.getDiasPagar()}</td>
							<td>${dato.getEstatus()}</td>
							</tr>
						</c:if>
						<c:if test="${dato.getEstatus() eq 'A'}">
							<tr>
							<td>${dato.getIdPercepcion()}</td>
							<td>${dato.getNombre()}</td>
							<td>${dato.getDescripcion()}</td>
							<td>${dato.getDiasPagar()}</td>
							<td>${dato.getEstatus()}</td>
							<td>
								<form id="formulario" action="Percepciones" method="post">
									<input type="hidden" name="id" value="${dato.getIdPercepcion()}">
									<div id="${dato.getIdPercepcion()}">
										<input type="submit" class="btn btn-warning" name="op" value="Editar"> 
										<input type="submit" class="btn btn-danger" name="op" value="Eliminar" onclick="return eliminar()">
									</div>
								</form>
							</td>
							</tr>
						</c:if>
						
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<!-- MODAL PARA REGISTRO -->
	<div class="modal fade" id="modalRegistro">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">Registro de Percepciones</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body" id="modal_div">
	  <form action="${pageContext.servletContext.contextPath}/Registrar?op=Percepciones" method="post">
			<div class="form-group">
				<label>Nombre: </label>
				<input type="text" onkeypress="return soloLetras(event)" class="form-control"  name="nom_percepciones" required>
				<br>
				<label>Descripcion: </label>
				<input type="text" class="form-control"  name="descripcion" required>
				<br>
				<label>Dias a pagar: </label>
				<input type="number" class="form-control" name="diasPagar"  required min="1" max="30"  onkeypress="if ( isNaN( String.fromCharCode(event.keyCode) )) return false;">
				<label for="Estatus">Estatus</label>
		    		<select class="form-control" name = "estatus">
		      			<option value="A">Activo</option>
		      			<option value="I">Inactivo</option>
		    		</select>
		    	<br>
		    	<button type="submit" class="btn btn-primary">Registrar</button>
			</div>
		</form>
	      	<% //Aqui va todo el cuerpo del modal, el cual contiene todo los datos necesarios para el cliente%> 
	      	
	      </div>
			
	      <!-- Modal footer -->
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
	      </div>
	
	    </div>
	  </div>
	</div>
		<% //Aqui tendremos la paginacion%>
	<nav aria-label="paginacion percepciones">
	  <ul class="pagination justify-content-center">
	    <c:if test="${pagina eq 1}">
	    	<li class="page-item disabled">
		      <a class="page-link" href="${pageContext.servletContext.contextPath}/Percepciones?op=Listar&pagina=${pagina-1}">Previous</a>
		    </li>
	    </c:if>
	    <c:if test="${pagina > 1}">
	    	<li class="page-items">
		      <a class="page-link" href="${pageContext.servletContext.contextPath}/Percepciones?op=Listar&pagina=${pagina-1}">Previous</a>
		    </li>
	    </c:if>
	    <li class="page-item"><a class="page-link">Pagina ${pagina}</a></li>
	    <li class="page-item">
	      <a class="page-link" href="${pageContext.servletContext.contextPath}/Percepciones?op=Listar&pagina=${pagina+1}">Next</a>
	    </li>
	  </ul>
	</nav>
</body>
</html>