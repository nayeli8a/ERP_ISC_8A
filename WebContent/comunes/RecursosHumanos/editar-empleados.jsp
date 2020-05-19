<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri  = "http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html>
<head>

<title>Editar Empleados</title>

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
	
  <p class="bg-primary text-white">EDITAR EMPLEADOS</p>

		<form 
		enctype="multipart/form-data"
		action="${pageContext.servletContext.contextPath}/Empleados?op=Modificar" 
		method="post">
			<div class="form-group">
	
			    <div class="container">
			      <legend> Datos Generales: </legend>
			      <div class="row">
			        <div class="col-md-4">
			          <div class="form-group">
			            <input type="text" id="edit_nombre" class="form-control" value="${dato.getNombre()}" 
			            name="edit_nombre" onkeypress="return soloLetras(event)" required>
			          </div>
			        </div>
			        <div class="col-md-4" >
			          <div class="form-group">
			            <input type="text" id="edit_apaterno" class="form-control" value="${dato.getApaterno()}" 
			            name="edit_apaterno" onkeypress="return soloLetras(event)" required>
			          </div>
			        </div>
			        <div class="col-md-4" >
			          <div class="form-group">
			            <input type="text" id="edit_amaterno" class="form-control" value="${dato.getAmaterno()}" 
			            name="edit_amaterno" onkeypress="return soloLetras(event)" required>
			          </div>
			        </div>
			      </div>
			      <div class="row">
			        <div class="col-md-6">
			        	<label>Sexo:</label>
			          <select class="form-control" id="edit_sexo" name="edit_sexo">
			            <option value="M">Masculino</option>
			            <option value="F">Femenino</option>
			          </select>
			        </div>
			        <div class="col-md-6">
			        	<label>Estado Civil:</label>
			          <select class="form-control" id="edit_estado-civil" name="edit_estado-civil">
			            <option value="Casado">Casado</option>
			            <option value="Soltero">Soltero</option>
			           
			          </select>
			        </div>
			      </div>
			      <br>
			      <div class="row">
			        <div class="col-md-6">
			        	<label>Numero de Seguro Social:</label>
			          <div class="form-group">
			            <input type="text" id="edit_nss" name="edit_nss"  value="${dato.getNss()}" required class="form-control">
			          </div>
			        </div>
			        <div class="col-md-6">
			        	<label>Fecha de Nacimiento:</label>
			          <div class="form-group">
			            <input type="date" id="edit_fecha-nacimiento" name="edit_fecha-nacimiento" value="${dato.getFechaNacimiento()}" required class="form-control">
			          </div>
			        </div>
			      </div>

			      <div class="row">
			      	<div class="col-md-12">
			      		<small>Domicilio del empleado:</small>
			      	</div>
			        <div class="col-md-4">
			          <div class="form-group">
			            <input type="text" id="edit_direccion" name="edit_direccion" value="${dato.getDireccion()}" required 
			            class="form-control">
			          </div>
			        </div>
			        <div class="col-md-4">
			          <div class="form-group">
			            <input type="text" id="edit_colonia" name="edit_colonia" value="${dato.getColonia()}" required 
			            class="form-control">
			          </div>
			        </div>
			        <div class="col-md-4">
			          <div class="form-group">
			            <input type="text" id="edit_codigo-postal" name="edit_codigo-postal" value="${dato.getCodigoPostal()}" required 
			            class="form-control" onkeypress="if ( isNaN( String.fromCharCode(event.keyCode) )) return false;">
			          </div>
			        </div>
			      </div>

			      <div class="row">
			      	<div class="col-md-4">
				        <label for="Ciudad">Ciudad:</label>
			    		<select class="form-control" id="edit_ciudad" name = "edit_ciudad">
			      			<c:forEach var="dato" items="${datosciudades}">
			      				<option value="${dato.getIdCiudad()}">${dato.getNombre()}</option>
			      			</c:forEach>
			    		</select>
			        </div>
			        <div class="col-md-4">
				        <label for="Escolaridad">Escolaridad:</label>
			    		<input type="text" id="edit_escolaridad" name="edit_escolaridad" value="${dato.getEscolaridad()}" required class="form-control" onkeypress="return soloLetras(event)">
			        </div>
			      </div>


			      <legend> Datos del empleado: </legend>
			      <div class="row">
			      	<input type="hidden" id="edit_id" name="edit_id" value="${dato.getIdEmpleado()}">
			      	<div class="col-md-8">
			      		<label>Foto:</label>
			    		<img src="IMG?op=fotoempleado&idFoto=${dato.getIdEmpleado()}" style="max-width:100%;max-height: 100%;">	
			    	</div>
			        <div class="col-md-4">
				        <label for="foto">Sube una nueva Fotografia:</label>
			    		<input type="file" name="foto"	id="foto" class="form-control" required>
			        </div>
			        </div>
			        <div class="row">
			        <div class="col-md-4">
			        	<label>Fecha de Contratacion:</label>
			          <div class="form-group">
			            <input type="date" id="edit_fecha-contratacion" name="edit_fecha-contratacion" 
			            value="${dato.getFechaContratacion()}" required class="form-control">
			          </div>
			        </div>

			        <div class="col-md-4">
			        	<label>Salario:</label>
			          <div class="form-group">
			            <input type="number" id="edit_salario" name="edit_salario" 
			            value="${dato.getSalario()}" required class="form-control" onkeypress="if ( isNaN( String.fromCharCode(event.keyCode) )) return false;">
			          </div>
			        </div>
			      </div>
			      
			      <div class="row">
			      	<div class="col-md-4">
			      		<label>Dias Vacaciones:</label>
			          <div class="form-group">
			            <input type="number" id="edit_dias-vacaciones" name="edit_dias-vacaciones" 
			            value="${dato.getDiasVacaciones()}" required class="form-control"onkeypress="if ( isNaN( String.fromCharCode(event.keyCode) )) return false;">
			          </div>
			      	</div>
			      	<div class="col-md-4">
			      		<label>Dias Permiso:</label>
			          <div class="form-group">
			            <input type="number" id="edit_dias-permiso" name="edit_dias-permiso" 
			            value="${dato.getDiasPermiso()}" required class="form-control" onkeypress="if ( isNaN( String.fromCharCode(event.keyCode) )) return false;">
			          </div>
			      	</div>
			      	<div class="col-md-4">
			      		<label>% Comision:</label>
			          <div class="form-group">
			            <input type="number" id="edit_porcentaje-comision" name="edit_porcentaje-comision" 
			            value="${dato.getPorcentajeComision()}" required class="form-control" onkeypress="if ( isNaN( String.fromCharCode(event.keyCode) )) return false;">
			          </div>
			      	</div>
			      </div>

			      <div class="row">
			      	<div class="col-md-4">
				        <label for="Departamento">Departamento:</label>
			    		<select class="form-control" id="edit_departamento" name = "edit_departamento">
			      			<c:forEach var="dato" items="${datosdepartamentos}">
			      				<option value="${dato.getIdDepartamento()}">${dato.getNombre()}</option>
			      			</c:forEach>
			    		</select>
			        </div>
			        <div class="col-md-4">
				        <label for="Puesto">Puesto:</label>
			    		<select class="form-control" id="edit_puesto" name = "edit_puesto">
			      			<c:forEach var="dato" items="${datospuestos}">
			      				<option value="${dato.getIdPuesto()}">${dato.getNombre()}</option>
			      			</c:forEach>
			    		</select>
			        </div>
			        <div class="col-md-4">
				        <label for="Sucursal">Sucursal:</label>
			    		<select class="form-control" id="edit_sucursal" name = "edit_sucursal">
			      			<c:forEach var="dato" items="${datossucursales}">
			      				<option value="${dato.getIdSucursal()}">${dato.getNombre()}</option>
			      			</c:forEach>
			    		</select>
			        </div>
			      </div>

			    </div>
			    <br>
		    	<button type="submit" class="btn btn-primary">Aceptar</button>
			</div>
		</form>
	</div>
	
</body>
</html>