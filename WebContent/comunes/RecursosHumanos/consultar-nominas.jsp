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
	
	<link rel="icon" type="image/png" href="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/carrito_32x.ico">
	
    <style>
    	 .modal-body { max-height: calc(100vh - 200px); overflow-y: auto; } 
	</style>
	
	<script type="text/javascript">
	//FUNCIONES PARA CLONAR Y ELIMINAR ELEMENTOS DEL HTML
	var numd = 1;//para numerar las deducciones
	var nump = 1;//para numerar las percepciones
	var elementosd=1;//contador de deducciones para evitar que se eliminen todos los nodos 
	var elementosp=1;//contador de percepciones
	
	//si DoP es 1 es una deducion
	function clonar(DoP,iddondeclonar,idelementoclonar,select,input)
	{
		if(DoP==1)
		{
			var elemento = document.getElementById(idelementoclonar+numd);
			var clon = elemento.cloneNode(true);
			numd=numd+1;
			clon.setAttribute("id",idelementoclonar+numd);
			clon.setAttribute("name",idelementoclonar+numd);
			//ponemos el clon en la pagina html
			document.getElementById(iddondeclonar).appendChild(clon);
			
			var selects = document.getElementById(idelementoclonar+numd).getElementsByTagName('select');
			selects[0].setAttribute("id",select+numd);
			selects[0].setAttribute("name",select+numd);
			var inputs = document.getElementById(idelementoclonar+numd).getElementsByTagName('input');
			inputs[0].setAttribute("id",input+numd);
			inputs[0].setAttribute("name",input+numd);
			var btns = document.getElementById(idelementoclonar+numd).getElementsByTagName('button');
			btns[0].setAttribute("onclick","quitar("+DoP+",'"+idelementoclonar+numd+"');");
			btns[0].setAttribute("style","visibility:visible;");
			elementosd++;
		}else
		{
			var elemento = document.getElementById(idelementoclonar+nump);
			var clon = elemento.cloneNode(true);
			nump=nump+1;
			clon.setAttribute("id",idelementoclonar+nump);
			clon.setAttribute("name",idelementoclonar+nump);
			//ponemos el clon en la pagina html
			document.getElementById(iddondeclonar).appendChild(clon);
			
			var selects = document.getElementById(idelementoclonar+nump).getElementsByTagName('select');
			selects[0].setAttribute("id",select+nump);
			selects[0].setAttribute("name",select+nump);
			var inputs = document.getElementById(idelementoclonar+nump).getElementsByTagName('input');
			inputs[0].setAttribute("id",input+nump);
			inputs[0].setAttribute("name",input+nump);
			var btns = document.getElementById(idelementoclonar+nump).getElementsByTagName('button');
			btns[0].setAttribute("onclick","quitar("+DoP+",'"+idelementoclonar+nump+"');");	
			btns[0].setAttribute("style","visibility:visible;");
			elementosp++;
		}
		
	}
	
	//si DoP es 1 es una deducion
	function quitar(DoP,idelemento)
	{
		if(DoP==1)
		{
			if(elementosd>1)
			{
				var elem = document.getElementById(idelemento);
				elementosd--;
				numd--;
			    return elem.parentNode.removeChild(elem);
			}
		}else
		{
			if(elementosp>1)
			{
				var elem = document.getElementById(idelemento);
				elementosp--;
				nump--;
			    return elem.parentNode.removeChild(elem);
			}		
		}
	}
	
	//funcion para tomar las variables globales de cuantas percepciones 
	//y deducciones hay y activar el form agregar
	function agregar_nomina()
	{
		//tomamos el action del form y le contatenamos dos parametros mas
		var form = document.getElementById("registrar-nomina");	
    	form.setAttribute("action",form.getAttribute("action")+"&deducciones="+elementosd);
    	form.setAttribute("action",form.getAttribute("action")+"&percepciones="+elementosp);
		document.getElementById("registrar-nomina").submit();
	}
	</script>
	
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
		<button type="button" style="width:40px;" id="agregar" data-toggle="modal" data-target="#modalRegistro" >
			<img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/plus.png" style="max-width:100%;">
		</button>
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
				<th>Forma Pago</th>
				<th>Nombre Empleado</th>
				<th>Acciones</th>
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
					<td>${dato.getFormaPago()}</td>
					<td>${dato.getNombreEmpleado()} ${dato.getApaterno()} ${dato.getAmaterno()}</td>
					
					</tr>
				</c:if>
				<c:if test="${dato.getEstatus() eq 'A'}">
					<tr>
	                <td>${dato.getFechaPago()}</td>
					<td>${dato.getTotalP()}</td>
					<td>${dato.getTotalD()}</td>
					<td>${dato.getCantidadNeta()}</td>
					<td>${dato.getDiasTrabajados()}</td>
					<td>${dato.getFaltas()}</td>
					<td>${dato.getFechaInicio()}</td>
					<td>${dato.getFechaFin()}</td>
					<td>${dato.getFormaPago()}</td>
					<td>${dato.getNombreEmpleado()} ${dato.getApaterno()} ${dato.getAmaterno()}</td>
					<td>
						<form action="${pageContext.servletContext.contextPath}/Nominas" method="post">
							<input type="hidden" name="id" value="${dato.getIdNomina()}">
							<input type="hidden" name="idEmpleado" value="${dato.getIdEmpleado()}">
							<div id="${dato.getIdNomina()}">
								<button type="submit" name="op" value="Imprimir">
									<img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/print.png" style="max-width:100%;">
								</button>
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
      <form id="registrar-nomina" action="${pageContext.servletContext.contextPath}/Registrar?op=Nomina" method="post">
      	<div class="container" style="border-style:solid;">
		    <label><b>Datos Empleado:</b></label>
		    <div class="row">
		      <div class="col-md-4">
		        <label>Nss Empleado</label>
		        <br>
		        <input name="nss" type="text" style="width:100px;" required>
		      </div>
		      <div class="col-md-4">
		        <label>Faltas Acumuladas</label>
		        <br>
		        <input name="faltas" type="number" style="width:100px;" required>
		      </div>
		      <div class="col-md-4">
		        <label>Dias Trabajados</label>
		        <br>
		        <input name="diast" type="number" style="width:100px;" required>
		      </div>
		    </div>
		    <br>
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
		        <br>
		        <input name="fechapago" type="date" required>
		      </div>
		      <div class="col-md-4">
		        <label>Fecha de Inicio</label>
		        <br>
		        <input name="fechainicio" type="date" required>
		      </div>
		      <div class="col-md-4">
		        <label>Fecha Final</label>
		        <br>
		        <input name="fechafin" type="date" required>
		      </div>
		    </div>
		    <br>
		    <label>Percepciones de esta Nomina:</label>
		    <div class="row">
		    	<div class="col-md-2">
		    		<button type="button" onclick="clonar(2,'percepciones','percepcion-contenido-','select-p-','input-p-')"style="width:40px;" id="agregar-percepcion">
						<img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/plus.png" style="max-width:100%;">
					</button>
		    	</div>
		    	<div class="col-md-10">
		    		<div style="border-style:solid;border-width:thin;">
		    		<span id="percepciones" name="percepciones">
         				  
         				  <!-- AQUI EMPIEZA UNA SOLA PERCEPCION -->
         				  <div id="percepcion-contenido-1">
         				  	 <hr style="width:80%;">
					          <div class="col">
					            
				              <label>Percepcion:</label>
				              <select id="select-p-1" name="select-p-1">
				              <c:forEach var="dato" items="${datospercepciones}">
				              	<option value="${dato.getIdPercepcion()}">${dato.getNombre()}</option>
				              </c:forEach>
				              </select>
				              <br>
				              <label>Importe:</label>
				              <input id="input-p-1" name="input-p-1" type="number">
				              <button type="button" style="visibility:hidden;" onclick="quitar(2,'percepcion-contenido-1')" class="btn-danger" style="width:40px;">X </button>
					            
					          </div>
					          <hr style="width:80%;">
         				  </div>
				          <!-- AQUI TERMINA UNA SOLA PERCEPCION -->
				          
		    		</span>
		    		</div>
		    	</div>
		    </div>
		    <br>
		    <label>Deducciones:</label>
		    <div class="row">
		    	<div class="col-md-2">
		    		<button type="button" onclick="clonar(1,'deducciones','deduccion-contenido-','select-d-','input-d-')" style="width:40px;" id="agregar-deduccion">
						<img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/plus.png" style="max-width:100%;">
					</button>
		    	</div>
		    	<div class="col-md-10">
					<div style="border-style:solid;border-width:thin;">
		    		<span id="deducciones" name="deducciones">
         				  
         				  <!-- AQUI EMPIEZA UNA SOLA DEDUCCION -->
         				  <div id="deduccion-contenido-1">
         				  	 <hr style="width:80%;">
					          <div class="col">
					            
				              <label>Deduccion:</label>
				              <select id="select-d-1" name="select-d-1">
				              <c:forEach var="dato" items="${datosdeducciones}">
				              	<option value="${dato.getIdDeduccion()}">${dato.getNombre()}</option>
				              </c:forEach>
				              </select>
				              <label>Importe:</label>
				              <input id="input-d-1" name="input-d-1" type="number">
				              <button type="button" style="visibility:hidden;" onclick="quitar(1,'deduccion-contenido-1')" class="btn-danger" style="width:40px;">X </button>
					            
					          </div>
					          <hr style="width:80%;">
         				  </div>
				          <!-- AQUI TERMINA UNA SOLA PERCEPCION -->
				          
		    		</span>
		    		</div>
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
		    <br>
		    <div align="center">
		      <button type="button" onclick="agregar_nomina()" class="btn btn-primary">Registrar</button>
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
