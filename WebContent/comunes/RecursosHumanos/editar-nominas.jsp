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
    <link rel="icon" type="image/png" href="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/carrito_32x.ico">

	<script>
	var nump=1;
	var numd=1;
		function ponervalores(select,input,PoD)
		{
			if(PoD == 1)
			{
				document.getElementById(select).name = select+nump;
				document.getElementById(input).name = input+nump;
			}else
			{
				document.getElementById(select).name = select+numd;
				document.getElementById(input).name = input+numd;
			}
			
		}
	</script>

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" data-target="#navbarResponsive">
		<a class="btn btn-primary"href="${pageContext.servletContext.contextPath}/General?op=RegresarRH">Atras</a>
	</nav>
	<div  class="card bg-light" style="margin-top:100px">
	<p class="bg-primary text-white">EDITAR NOMINA</p>
	
		<div class="container">
			<form action="${pageContext.servletContext.contextPath}/Nominas?op=Modificar" method="post">
			<div class="form-group">
			<input type="hidden" name="id" value="${datosnomina.getIdNomina()}">
			    <legend> Datos del empleado: </legend>
			    <div class="row">
			      <div class="col">
			        <div class="form-group">
			          <input type="texto" name="nombre" class="form-control" value="${datosnomina.getNombreEmpleado()}" readonly="">
			        </div>
			      </div>
			      <div class="col">
			        <div class="form-group">
			          <input type="texto" name="apaterno" class="form-control" value="${datosnomina.getApaterno()}" readonly="">
			        </div>
			      </div>
			      <div class="col">
			        <div class="form-group">
			          <input type="texto" name="amaterno" class="form-control" value="${datosnomina.getAmaterno()}" readonly="">
			        </div>
			      </div>
			    </div>
			    <div class="row">
			      <div class="col-md-4">
			        <div class="form-group">
			          <label>NSS : </label> 
			          <input type="texto" name="nss" class="form-control" value="${datosnomina.getNss()}" readonly="">
			        </div>
			      </div>
			      <div class="col-md-4">
			        <div class="form-group">
			          <label>Empleado: </label> 
			          <input type="number" name="idEmpleado" class="form-control" value="${datosnomina.getIdEmpleado()}" readonly="">
			        </div>
			      </div>
			      <div class="col-md-4">
			      	<label for="Estatus">Estatus</label>
			    	<br>
			    	<select id="estatus" name="estatus">
						<option value="A">Activo</option>
						<option value="I">Inactivo</option>
					</select>
				  </div>
			    </div>
			    
			    <legend> Datos Nomina: </legend>
			    <div class="row">
			    	<div class="col-md-4">
			        <label>Faltas Acumuladas</label>
			        <br>
			        <input name="faltas" type="number" value="${datosnomina.getFaltas()}" required>
			      </div>
			      <div class="col-md-4">
			        <label>Dias Trabajados</label>
			        <br>
			        <input name="diast" type="number" value="${datosnomina.getDiasTrabajados()}" required>
			      </div>
			      <div class="col-md-3">
			        <label>Forma de Pago</label>
			        <br>
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
			        <br>
			        <input name="fechapago" type="date" value="${datosnomina.getFechaPago()}" required>
			      </div>
			      <div class="col-md-4">
			        <label>Fecha de Inicio</label>
			        <br>
			        <input name="fechainicio" type="date" value="${datosnomina.getFechaInicio()}" required>
			      </div>
			      <div class="col-md-4">
			        <label>Fecha Final</label>
			        <br>
			        <input name="fechafin" type="date" value="${datosnomina.getFechaFin()}" required>
			      </div>
			    </div>
			    <br>
					    
			    <label><b>Percepciones:</b></label>
			    <c:forEach var="per" items="${percepciones}">
			          
			          <div class="col">
			          <hr style="width:80%;">
			          
		              <label>Percepcion:</label>
		              <br>
		              <select id="select-p-" name="select-p-">
		              <c:forEach var="dato" items="${datospercepciones}">
		              
	              		<c:if test="${dato.getIdPercepcion() eq per.getIdPercepcion()}">
	              			<option value="${per.getIdPercepcion()}">
	              			${dato.getNombre()}
	              			</option>
	              		</c:if>
		              	
		              </c:forEach>
		              </select>
		              
		              <label>Importe:</label>
		              <br>
		              <input id="input-p-" name="input-p-" type="number" value="${per.getImporte()}" onload="ponervalores('input-p-','select-p-',1)">
			          <hr style="width:80%;">
			          </div>
			          
			    </c:forEach>
			    <br>
					    
			    <label><b>Deducciones:</b></label>
	    		<c:forEach var="ded" items="${deducciones}">
			    
			    	  <hr style="width:80%;">
			          <div class="col">
			            
		              <label>Deduccion:</label>
		              <br>
		              <select id="select-p-" name="select-p-">
		              <c:forEach var="dato" items="${datosdeducciones}">
		              	
	              		<c:if test="${dato.getIdDeduccion() eq ded.getIdDeduccion()}">
	              			<option value="${ded.getIdDeduccion()}">
	              			${dato.getNombre()}
	              			</option>
	              		</c:if>
		              	
		              </c:forEach>
		              </select>
		              <label>Importe:</label>
		              <br>
		              <input id="input-p-" name="input-p-" type="number" value="${ded.getImporte()}" onload="ponervalores('input-d-','select-d-',2)">
			           
			          </div>
			          <hr style="width:80%;">
			    </c:forEach>
			    <br>
					    
			    <label><b>Totales:</b></label>
			    <div class="row">
			      <div class="col-md-4">
			        <label>Total Pagado</label>
			        <br>
			        <input name="totalp" type="number" value="${datosnomina.getTotalP()}" required>
			      </div>
			      <div class="col-md-4">
			        <label>Total Deducido</label>
			        <br>
			        <input name="totald" type="number" value="${datosnomina.getTotalD()}" required>
			      </div>
			      <div class="col-md-4">
			        <label>Cantidad Neta</label>
			        <br>
			        <input name="cantidadneta" type="number" value="${datosnomina.getCantidadNeta()}" required>
			      </div>
			    </div>
			    <br>
			    
			    <div style="text-align: center;">
				  <button type="submit" class="btn btn-primary">Editar</button>
				</div>
				
			  </div>
			</form>
		</div>
		
	</div>
	
</body>
</html>