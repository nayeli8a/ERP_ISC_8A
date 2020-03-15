<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri  = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

<title>Consultar Horarios</title>

	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
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


  <div class="container" style="margin-top:100px">
	 <h2>Buscador</h2>
	  <p>Escribe la información a buscar</p>
	  <input class="form-control" id="myInput" type="text" placeholder="Buscador...">
	  		  <script>javascript:buscar();</script>
		<h2 align="center">Horarios</h2>
		<hr class="bg-info">
		<button type="button" class="btn btn-success" id="agregar" data-toggle="modal" data-target="#modalRegistro" >Agregar</button>
		<div class="table-responsive table-bordered table-striped">
      <table class="table table-sm">
				<thead class="thead-dark">

					<tr>
						<th>ID Horario</th>
						<th>Hora Inicio</th>
						<th>Hora Fin</th>
						<th>Días</th>
            <th>id Empleado</th>
            <th>Estatus</th>
					</tr>
				</thead>
        <tbody id="myTable">
					<c:forEach var="dato" items="${datoshorarios}">
						<c:if test="${dato.getEstatus() eq 'I'}">
							<tr>
							<td>${dato.getIdHorario()}</td>
							<td>${dato.getHoraInicio()}</td>
							<td>${dato.getHoraFin()}</td>
							<td>${dato.getDias()}</td>
              <td>${dato.getIdEmpleado()}</td>
							<td>${dato.getEstatus()}</td>
							</tr>
						</c:if>
						<c:if test="${dato.getEstatus() eq 'A'}">
							<tr>
                <td>${dato.getIdHorario()}</td>
  							<td>${dato.getHoraInicio()}</td>
  							<td>${dato.getHoraFin()}</td>
  							<td>${dato.getDias()}</td>
                <td>${dato.getIdEmpleado()}</td>
  							<td>${dato.getEstatus()}</td>
							<td>
								<form action="Horarios" method="post">
									<input type="hidden" name="id" value="${dato.getIdHorario()}">
									<div id="${dato.getIdHorario()}">
										<input type="submit" class="btn btn-warning" name="op" value="Editar">
										<input type="submit" class="btn btn-danger" name="op" value="Eliminar" onclick="javascript:eliminar()">
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
        <h4 class="modal-title">Registro de Horarios</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body" id="modal_div">
      <% //Aqui va todo el cuerpo del modal%>
      <form action="${pageContext.servletContext.contextPath}/Registrar?op=Horarios" method="post">
        <div class="form-group">
          <label>Hora de inicio: </label>
          <input type="time"  class="form-control" min = "07:00" max = "10:00" required>
          <br>
          <label>Hora fin: </label>
          <input type="time" class="form-control" min = "15:00" max = "18:00" required>
          <br>
          <label>Días: </label>
          <br>
            <input type="checkbox" name="lunes" value="LU" />Lunes
            <input type="checkbox" name="martes" value="MA" />Martes
            <input type="checkbox" name="miercoles" value="MI" />Miercoles
            <input type="checkbox" name="jueves" value="JU" />Jueves
            <input type="checkbox" name="viernes" value="VI" />Viernes
            <input type="checkbox" name="sabado" value="SA" />Sabado
            <input type="checkbox" name="domingo" value="DO" />Domingo
          <br>
          <label>ID Empleado: </label>
          <input type="number" class="form-control" required>
    	    <br>
          <label for="Estatus">Estatus</label>
          <select class="form-control" id="estatus" name = "estatus">
              <option value="A">Activo</option>
              <option value="I">Inactivo</option>
          </select>
          <br>
          <button type="submit" class="btn btn-primary">Registrar</button>
        </div>
      </form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
      </div>

    </div>
  </div>
</div>
</body>
</html>