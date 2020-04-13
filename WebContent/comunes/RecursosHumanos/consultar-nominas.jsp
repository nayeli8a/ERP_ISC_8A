<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri  = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

<title>Consultar Nominas</title>


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
	
	<style> .largerCheckbox 
    { 
            width: 20px; 
            height: 20px; 
      			
    } 
    .checkbox-inline
    {	
      		width: 100px; 
          height: 40px;
      		text-align:center;
    }
  </style>
	
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
	  <p>Escribe la informacion a buscar</p>
	  <input class="form-control" id="myInput" type="text" placeholder="Buscador...">
	  		  <script>javascript:buscar();</script>
		<h2 align="center">Nominas</h2>
		<hr class="bg-info">
		<button type="button" class="btn btn-success" id="agregar" data-toggle="modal" data-target="#modalRegistro" >Agregar</button>
		<div class="table-responsive table-bordered table-striped">
      <table class="table table-sm">
		<thead class="thead-dark">
			<tr>
				<th>Fecha Pago</th>
				<th>Total P</th>
				<th>Total D</th>
				<th>Cantidad Neta</th>
				<th>Dias Trabajados</th>
				<th>Faltas</th>
				<th>Fecha Inicio</th>
				<th>Fecha Fin</th>
				<th>Nombre Empleado</th>
				<th>Forma Pago</th>
			</tr>
		</thead>
        <tbody id="myTable">
			<c:forEach var="dato" items="${datos}">
				<c:if test="${dato.getEstatus() eq 'I'}">
					<tr>
					<td>${dato.getFechaPago()}</td>
					<td>${dato.getTotalP()}</td>
					<td>${dato.getTotalD()}</td>
					<td>${dato.getCantidadNeta()}</td>
					<td>${dato.getDiasTrabajados()}</td>
					<td>${dato.getFaltas()}</td>
					<td>${dato.getFechaInicio()}</td>
					<td>${dato.getFechaFin()}</td>
					<td>${dato.getNombreEmpleado()}</td>
					<td>${dato.getFormaPago()}</td>
					</tr>
				</c:if>
				<c:if test="${dato.getEstatus() eq 'A'}">
					<tr>
	                <td>${dato.getValor()}</td>
					<td>
						<form action="Nombre_Tabla" method="post">
							<input type="hidden" name="id" value="${dato.getIdNomina()}">
							<div id="${dato.getIdNomina()}">
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
        <h4 class="modal-title">Registro de Nominas</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body" id="modal_div">
      <% //Aqui va todo el cuerpo del modal%>
      <form action="${pageContext.servletContext.contextPath}/Registrar?op=Nomina" method="post">
      	<div class="container" style="border-style:solid;">
		    <label><b>Datos Empleado:</b></label>
		    <div class="row">
		      <div class="col-md-4">
		        <label>Nss Empleado</label>
		        <input name="nssEmpleado" type="number" required>
		      </div>
		      <div class="col-md-4">
		        <label>Faltas Acumuladas</label>
		        <input name="faltas" type="number" required>
		      </div>
		      <div class="col-md-4">
		        <label>Dias Trabajados</label>
		        <input name="diasTrabajados" type="number" required>
		      </div>
		    </div>
		    <br>
		    <div class="row">
	    	  <div class="col-md-3">
		        <label>Forma de Pago</label>
		        <select id="formaPago" name="formaPago" required>
		          <option value="${dato.getIdFormaPago()}">${dato.getNombre()}</option>
		        </select>
		      </div>
		    </div>
		    <br>
		    <label><b>Fechas:</b></label>
		    <div class="row">
		      <div class="col-md-4">
		        <label>Fecha de Pago</label>
		        <input name="fechaPago" type="date" required>
		      </div>
		      <div class="col-md-4">
		        <label>Fecha de Inicio</label>
		        <input name="fechaInicio" type="date" required>
		      </div>
		      <div class="col-md-4">
		        <label>Fecha Final</label>
		        <input name="fechaFin" type="date" required>
		      </div>
		    </div>
		    <br>
		    <label><b>Totales:</b></label>
		    <div class="row">
		      <div class="col-md-4">
		        <label>Total Pagado</label>
		        <input name="totalP" type="number" required>
		      </div>
		      <div class="col-md-4">
		        <label>Total Deducido</label>
		        <input name="totalD" type="number" required>
		      </div>
		      <div class="col-md-4">
		        <label>Cantidad Neta</label>
		        <input name="cantidadNeta" type="number" required>
		      </div>
		    </div>
		    <br>
		    <div align="center">
		      <button type="submit" class="btn btn-primary">Registrar</button>
		    </div>
		    <br>
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

<% //Aqui tendremos la paginacion%>
	<nav aria-label="paginacion Nominas">
	  <ul class="pagination justify-content-center">
	    <c:if test="${pagina eq 1}">
	    	<li class="page-item disabled">
		      <a class="page-link" href="${pageContext.servletContext.contextPath}/Nominas?op=Listar&pagina=${pagina-1}">Previous</a>
		    </li>
	    </c:if>
	    <c:if test="${pagina > 1}">
	    	<li class="page-items">
		      <a class="page-link" href="${pageContext.servletContext.contextPath}/Nominas?op=Listar&pagina=${pagina-1}">Previous</a>
		    </li>
	    </c:if>
	    <li class="page-item"><a class="page-link">Pagina ${pagina}</a></li>
	    <li class="page-item">
	      <a class="page-link" href="${pageContext.servletContext.contextPath}/Nominas?op=Listar&pagina=${pagina+1}">Next</a>
	    </li>
	  </ul>
	</nav>


</body>
</html>
