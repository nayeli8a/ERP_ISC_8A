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
</head>
<body >
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" data-target="#navbarResponsive">
		<a class="btn btn-primary"href="${pageContext.servletContext.contextPath}/General?op=RegresarRH">Atras</a>
	</nav>
	<div  class="card bg-light" style="margin-top:80px">
  <p class="bg-primary text-white">EDITAR AUSENCIAS JUSTIFICADAS</p>

  <form action="${pageContext.servletContext.contextPath}/AusenciasJustificadas?op=Modificar" method="post">
    <div class="form-group">

      <label >ID Ausencia: </label>
      <input type="text" readonly name="idAusencia" readonly required value="${datosAusenciasJustificadas.getIdAusencia()}">
      <br>
            <legend> Datos del empleado: </legend>
          <div class="row">
            <div class="col-md-6">
              <div class="form-group">
                <label>Id empleado : </label>
         <input type="number"  name="idEmpleado" class="form-control"value="${datosAusenciasJustificadas.getIdEmpleado()}" required  >
              </div>
            </div>
            <div class="col-md-6" >
              <div class="form-group">
                <label>NSS : </label>
         <input type="number"  name="nssempleado" class="form-control" value="${datosAusenciasJustificadas.getIdEmpleado()}" required  >
              </div>
            </div>
          </div>

       <legend> Ausencia Justificada: </legend>
          <div class="row">
            <div class="col-md-4">
              <div class="form-group">
                <label>Fecha Solicitud: </label>
       <input type="date" name="fechaInicio" value="${datosAusenciasJustificadas.getFechaSolicitud()}" required class="form-control" required>
      </div>
            </div>
            <div class="col-md-4">
              <div class="form-group">
                <label>Fecha Inicio: </label>
       <input type="date" name="fechaInicio" value="${datosAusenciasJustificadas.getFechaInicio()}" required class="form-control" required>
      </div>
            </div>
            <div class="col-md-4" >
              <div class="form-group">
                <label>Fecha Fin: </label>
        <input type="date" name="fechaFin" value="${datosAusenciasJustificadas.getFechaFin()}" required class="form-control" required>
      </div>
            </div>
            <div class="col-md-4" >
              <div class="form-group">
               <label>Tipo : </label>
      <input type="text"  onkeypress="return soloLetras(event)" class="form-control" id="tipo" name="tipo" style="text-transform:uppercase;"  value="${datosAusenciasJustificadas.getTipo()}"required >
    </div>
            </div>



            <div class="row">
              <div class="col-md-4">
                <div class="form-group">

            <label for="Estatus">IdEmpleadoS</label>
                <input class="form-control" type="number" name="IdEmpleadoS" value="IdEmpleadoS">

              </div>

            </div>

            <div class="row">
              <div class="col-md-4">
                <div class="form-group">

            <label for="Estatus">IdEmpleadoA</label>
                <input class="form-control" type="number" name="IdEmpleadoA" value="IdEmpleadoA">
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
          </select></div>
            </div>
          </div>





        <br>
        <button type="submit" class="btn btn-primary">Aceptar</button>
    </div>
  </form>
</div>

</body>
</html>
