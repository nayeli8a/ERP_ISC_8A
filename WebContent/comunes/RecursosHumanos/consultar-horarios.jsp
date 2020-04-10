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
			<c:forEach var="dato" items="${datos}">
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
      <div class="container">
    <form action="${pageContext.servletContext.contextPath}/Registrar?op=Horarios" method="post">
      
      <div class="row">
        <div class="col-sm">
          <label>NSS Empleado: </label>
          <input type="text" name="nssempleado" class="form-control" required="">
          
        </div>
        <div class="col-sm">
          <label>Hora de inicio: </label>
          <input type="time" name="horaInicio" class="form-control" required="">
          
          <label>Hora fin: </label>
          <input type="time" name="horaFin" class="form-control" required="">
          
        </div>
      </div>
     <br>
     
      <div class="row" style="border-style:double; text-align:center;">
      	<label>Días: </label>
     	<br>
        <label class="checkbox-inline">
          <input type="checkbox" value="LU" name="lunes" class="largerCheckbox">Lunes </label>
        <label class="checkbox-inline">
          <input type="checkbox" value="MA" name="martes" class="largerCheckbox">Martes</label>
        <label class="checkbox-inline">
          <input type="checkbox" value="MI" name="miercoles" class="largerCheckbox">Miercoles</label>
        <label class="checkbox-inline">
          <input type="checkbox" value="JU" name="jueves" class="largerCheckbox">Jueves</label>
        <label class="checkbox-inline">
          <input type="checkbox" value="VI" name="viernes" class="largerCheckbox">Viernes</label>
        <label class="checkbox-inline">
          <input type="checkbox" value="SA" name="sabado" class="largerCheckbox">Sabado</label>
        <label class="checkbox-inline">
          <input type="checkbox" value="DO" name="domingo" class="largerCheckbox">Domingo</label>
        <br> Selecciona los días que el empleado debe laborar 
        </div>
        <br>
        <br>
        <div style="text-align:center;">
        	<button type="submit" class="btn btn-primary">Registrar Horario</button>
        </div>
    </form>
   </div>
   </div>
   <!-- Modal footer -->
	      <div class="modal-footer">
	      	<button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
	      </div>
	
	    </div>
	  </div>
</div>

<% //Aqui tendremos la paginacion%>
	<nav aria-label="paginacion horarios">
	  <ul class="pagination justify-content-center">
	    <c:if test="${pagina eq 1}">
	    	<li class="page-item disabled">
		      <a class="page-link" href="${pageContext.servletContext.contextPath}/Horarios?op=Listar&pagina=${pagina-1}">Previous</a>
		    </li>
	    </c:if>
	    <c:if test="${pagina > 1}">
	    	<li class="page-items">
		      <a class="page-link" href="${pageContext.servletContext.contextPath}/Horarios?op=Listar&pagina=${pagina-1}">Previous</a>
		    </li>
	    </c:if>
	    <li class="page-item"><a class="page-link">Pagina ${pagina}</a></li>
	    <li class="page-item">
	      <a class="page-link" href="${pageContext.servletContext.contextPath}/Horarios?op=Listar&pagina=${pagina+1}">Next</a>
	    </li>
	  </ul>
	</nav>


</body>
</html>
