<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri  = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

<title>Consultar Ausencias Justificadas</title>

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
	<c:if test="${not empty Errores }">
		<script>
		window.addEventListener("load",function(){
			alert("${Errores}");
			})
		</script>
	</c:if>
	<c:if test="${not empty Mensajes }">
		<script>
		window.addEventListener("load",function(){
			alert("${Mensajes}");
			})
		</script>
  </c:if>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" data-target="#navbarResponsive">
    <a class="btn btn-primary"href="${pageContext.servletContext.contextPath}/General?op=RegresarRH">Atras</a>
  </nav>


  <div class="container" style="margin-top:100px">
	 <h2>Buscador</h2>
	  <p>Escribe la información a buscar</p>
	  <input class="form-control" id="myInput" type="text" placeholder="Buscador...">
	  		  <script>javascript:buscar();</script>
		<h2 align="center">Ausencias Justificadas</h2>
		<hr class="bg-info">
		<button type="button" class="btn btn-success" id="agregar" data-toggle="modal" data-target="#modalRegistro" >Agregar</button>
		<div class="table-responsive table-bordered table-striped">
			<table class="table table-sm">
				<thead class="thead-dark">

          <tr>
						<th>ID</th>
            <th>Fecha Solicitud</th>
						<th>Fecha Inicio</th>
						<th>Fecha Fin</th>
						<th>Tipo</th>
						<th>ID empleadoS</th>
            <th>ID empleadoA</th>
						<th>NSS empleado</th>
						<th>Estatus</th>
					</tr>
				</thead>
        <tbody id="myTable">
					<c:forEach var="dato" items="${datos}">
						<c:if test="${dato.getEstatus() eq 'I'}">
							<tr>
							<td>${dato.getIdAusencia()}</td>
              <td>${dato.getFechaSolicitud()}</td>
							<td>${dato.getFechaInicio()}</td>
							<td>${dato.getFechaFin()}</td>
							<td>${dato.getTipo()}</td>
							<td>${dato.getIdEmpleadoS()}</td>
							<td>${dato.getIdEmpleadoA()}</td>
							<td>${dato.getNss()}</td>
							<td>${dato.getEstatus()}</td>
							</tr>
						</c:if>
            <c:if test="${dato.getEstatus() eq 'A'}">
							<tr>
                <td>${dato.getIdAusencia()}</td>
                <td>${dato.getFechaSolicitud()}</td>
  							<td>${dato.getFechaInicio()}</td>
  							<td>${dato.getFechaFin()}</td>
  							<td>${dato.getTipo()}</td>
  							<td>${dato.getIdEmpleadoS()}</td>
  							<td>${dato.getIdEmpleadoA()}</td>
  							<td>${dato.getNss()}</td>
  							<td>${dato.getEstatus()}</td>
							<td>
                <form action="AusenciasJustificadas" method="post">
									<input type="hidden" name="id" value="${dato.getIdAusencia()}">
									<div id="${dato.getIdAusencia()}">
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
          <h4 class="modal-title">Registro de Ausencias Justificadas</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>

        <!-- Modal body -->
	      <div class="modal-body" id="modal_div">
	      <form action="${pageContext.servletContext.contextPath}/Registrar?op=AusenciasJustificadas" method="post">
			<div class="form-group">
			 <div class="row">
        <div class="col-sm">
          <label>NSS Empleado: </label>
          <input type="text" name="nssempleado" class="form-control" required="">

          <label>Tipo: </label>
          <input type="text" name="Tipo" onkeypress="return soloLetras(event)" class="form-control" required="">

          <label>idEmpleadoS: </label>
          <input type="number" name="idEmpleadoS" onkeypress="" class="form-control" required="">

          <label>getIdEmpleadoA: </label>
          <input type="number" name="idEmpleadoA" onkeypress="" class="form-control" required="">

        </div>
        <div class="col-sm">
          <label>Fecha Solicitud: </label>
          <input type="date" name="fechaInicio" class="form-control" required="">

          <label>Fecha inicio: </label>
          <input type="date" name="fechaInicio" class="form-control" required="">

          <label>Fecha fin: </label>
          <input type="date" name="fechaFin" class="form-control" required="">
          <br>
        </div>
      </div>
			</div>
		 <button type="submit" class="btn btn-primary">Registrar</button>

		</form>

	      </div>


        <!-- Modal footer -->
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
	      </div>

	    </div>
	  </div>
	</div>

  <% //Aqui tendremos la paginacion%>
<nav aria-label="paginacion AusenciasJustificadas">
  <ul class="pagination justify-content-center">
    <c:if test="${pagina eq 1}">
      <li class="page-item disabled">
        <a class="page-link" href="${pageContext.servletContext.contextPath}/AusenciasJustificadas?op=Listar&pagina=${pagina-1}">Previous</a>
      </li>
    </c:if>
    <c:if test="${pagina > 1}">
      <li class="page-items">
        <a class="page-link" href="${pageContext.servletContext.contextPath}/AusenciasJustificadas?op=Listar&pagina=${pagina-1}">Previous</a>
      </li>
    </c:if>
    <li class="page-item"><a class="page-link">Pagina ${pagina}</a></li>
    <li class="page-item">
      <a class="page-link" href="${pageContext.servletContext.contextPath}/AusenciasJustificadas?op=Listar&pagina=${pagina+1}">Next</a>
    </li>
  </ul>
</nav>
</body>
</html>
