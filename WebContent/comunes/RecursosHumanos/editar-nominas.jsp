<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri  = "http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html>
<head>

<title>Editar Nominas</title>

	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap core CSS and JS-->
	<link href="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script type="text/javascript" src="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/jquery/jquery.js"></script>
	<script type="text/javascript" src="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/bootstrap/js/bootstrap.min.js"></script>
	
    <!-- Nuestras hojas de estilo-->
    <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/estilo.css">
    <script type="text/javascript" src="<c:out value="${pageContext.servletContext.contextPath}"/>/js/funciones.js"></script>
    
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" data-target="#navbarResponsive">
		<a class="btn btn-primary"href="${pageContext.servletContext.contextPath}/General?op=RegresarRH">Atras</a>
	</nav>
	<div  class="card bg-light" style="margin-top:100px">
	
  <p class="bg-primary text-white">EDITAR NOMINA</p>

		<form action="${pageContext.servletContext.contextPath}/Nominas?op=Modificar" method="post">
		<div class="form-group">
		<input type="hidden" name="id" value="${datosnomina.getIdNomina()}">
		    <legend> Datos del empleado: </legend>
		    <div class="row">
		      <div class="col-md-2">
		        <div class="form-group">
		          <input type="texto" name="nombre" class="form-control" value="${datosnomina.getNombreEmpleado()}" readonly="">
		        </div>
		      </div>
		      <div class="col-md-2">
		        <div class="form-group">
		          <input type="texto" name="apaterno" class="form-control" value="${datosnomina.getApaterno()}" readonly="">
		        </div>
		      </div>
		      <div class="col-md-2">
		        <div class="form-group">
		          <input type="texto" name="amaterno" class="form-control" value="${datosnomina.getAmaterno()}" readonly="">
		        </div>
		      </div>
		    </div>
		    <div class="row">
		    	<div class="col-md-4">
		        <label>Faltas Acumuladas</label>
		        <input name="faltas" type="number" required>
		      </div>
		      <div class="col-md-4">
		        <label>Dias Trabajados</label>
		        <input name="diast" type="number" required>
		      </div>
		    </div>
		    <div class="row">
		      <div class="col-md-2">
		        <div class="form-group">
		          <label>NSS : </label> <input type="texto" name="nss" class="form-control" value="${datosnomina.getNss()}" readonly="">
		        </div>
		      </div>
		      <div class="col-md-2">
		        <div class="form-group">
		          <label>Empleado: </label> <input type="number" name="idEmpleado" class="form-control" value="${datosnomina.getIdEmpleado()}" readonly="">
		        </div>
		      </div>
		    </div>
		    <div class="row">
			    	  <div class="col-md-3">
				        <label>Forma de Pago</label>
				        <select id="idformapago" name="idformapago" required>
				        <c:forEach var="dato" items="${datospagos}">
				        	<option value="${dato.getIdFormaPago()}">${dato.getNombre()}</option>
				        </c:forEach>
				        </select>
				      </div>
				    </div>
				    <br>
				    <label><b>Fechas:</b></label>
				    <div class="row">
				      <div class="col-md-4">
				        <label>Fecha de Pago</label>
				        <input name="fechapago" type="date" required>
				      </div>
				      <div class="col-md-4">
				        <label>Fecha de Inicio</label>
				        <input name="fechainicio" type="date" required>
				      </div>
				      <div class="col-md-4">
				        <label>Fecha Final</label>
				        <input name="fechafin" type="date" required>
				      </div>
				    </div>
				    <br>
				    <label><b>Totales:</b></label>
				    <div class="row">
				      <div class="col-md-4">
				        <label>Total Pagado</label>
				        <input name="totalp" type="number" required>
				      </div>
				      <div class="col-md-4">
				        <label>Total Deducido</label>
				        <input name="totald" type="number" required>
				      </div>
				      <div class="col-md-4">
				        <label>Cantidad Neta</label>
				        <input name="cantidadneta" type="number" required>
				      </div>
				    </div>
				    <div class="row">>
				    	<label for="Estatus">Estatus</label>
				    	<select class="form-control" id="estatus" name="estatus">
							<option value="A">Activo</option>
							<option value="I">Inactivo</option>
						</select>
				    </div>
				    <br>
		    <button type="submit" class="btn btn-primary">Aceptar</button>
		  </div>
		</form>
	</div>
	
</body>
</html>