<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri  = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

<title>Editar Ausencias Justificadas</title>

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
<body >
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" data-target="#navbarResponsive">
		<a class="btn btn-primary"href="${pageContext.servletContext.contextPath}/General?op=RegresarRH">Atras</a>
	</nav>
	
	<div  class="card bg-light" style="margin-top:80px">
  	<p class="bg-primary text-white">EDITAR AUSENCIAS JUSTIFICADAS</p>

  <form action="${pageContext.servletContext.contextPath}/AusenciasJustificadas?op=Modificar" method="post">
      
      <label >ID Ausencia: </label>
      <input type="text" readonly name="idAusencia" readonly required value="${datos.getIdAusencia()}">
      <br>
           
       <legend> Ausencia Justificada: </legend>
          <div class="row">
            <div class="col-md-4">
	            <div class="form-group">
	                <label>Fecha Solicitud: </label>
	       			<input type="date" name="fechaInicio" value="${datos.getFechaSolicitud()}" required>
	      		</div>
            </div>
            <div class="col-md-4">
              <div class="form-group">
                <label>Fecha Inicio: </label>
		       	<input type="date" name="fechaInicio" value="${datos.getFechaInicio()}" required>
		      </div>
            </div>
            <div class="col-md-4" >
              <div class="form-group">
                <label>Fecha Fin: </label>
		        <input type="date" name="fechaFin" value="${datos.getFechaFin()}" required>
		      </div>
            </div>
            <div class="col-md-4" >
              <div class="form-group">
               	<label>Motivo : </label>
			    <input type="text" id="tipo" name="tipo"  value="${datos.getTipo()}" required >
			  </div>
            </div>
		</div>


        <div class="row">
        	<div class="col-md-4">
                <div class="form-group">
					<label for="Estatus">NSS Empleado Sustituto</label>
                	<input class="form-control" type="text" name="NSSEmpleadoS" value="${datos.getNSSS()}">
              	</div>
            </div>
		</div>
		
        <div class="row">
	         <div class="col-md-4">
	           <div class="form-group">
	       	<label for="Estatus">NSS Empleado Ausente</label>
	           <input class="form-control" type="text" name="NSSEmpleadoA" value="${datos.getNSSA()}">
	         </div>
	       </div>
	     </div>

         <div class="row">
         	<div class="col-md-4">
            	<div class="form-group">
	         		<label for="Estatus">Estatus</label>
			         <select class="form-control" id="estatus" name = "estatus">
			             <option value="A">Activo</option>
			             <option value="I">Inactivo</option>
			         </select>
          		</div>
            </div>
         </div>
         
        <br>
        <button type="submit" class="btn btn-primary">Aceptar</button>
  		</form>
	</div>
</body>
</html>
