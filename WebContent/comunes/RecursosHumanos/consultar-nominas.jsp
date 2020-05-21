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
	function clonar(DoP,iddondeclonar,idelementoclonar,select)
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
			selects[0].removeAttribute("readonly");
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
	
	//este metodo sirve para obtener datos necesarios del empleado para el 
	//registro de la nomina
    function get_action() { 
    	var valor = document.getElementById("buscar-nss").value
    	document.getElementById("registro-nss").value = valor;
    	if(valor.length > 9 && valor.length < 11)
    	{
    		$('#modalPedirNss').modal('hide');
			$('#modalRegistro').modal('show');
    		
    	}else
    	{
    		alert("El NSS debe ser de 10 digitos");
    	}
		
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
		<button type="button" style="width:40px;" id="agregar" data-toggle="modal" data-target="#modalPedirNss" >
			<img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/plus.png" style="max-width:100%;">
		</button>
		<a href="<c:out value="${pageContext.servletContext.contextPath}"/>/NominasExcelServlet">
			Descargar Excel
		</a>
		<div class="table-responsive table-bordered table-striped">
      <table class="table table-sm">
		<thead class="thead-dark">
			<tr>
				<th style="width: 20%">Nombre Empleado</th>
				<th style="width: 10%">Fecha Pago</th>
				<th>Liquido</th>
				<th style="width: 20%">Periodo de Pago</th>
				<th>Forma Pago</th>
				<th>Dias Trabajados</th>
				<th>Faltas</th>
				<th style="width: 10%">Estatus Nomina</th>
				<th style="width: auto;">Acciones</th>
			</tr>
		</thead>
        <tbody id="myTable" style="text-align: center">
			<c:forEach var="dato" items="${datos}">
				<c:if test="${dato.getEstatus() eq 'I'}">
					<tr>
					<td>${dato.getNombreEmpleado()} ${dato.getApaterno()} ${dato.getAmaterno()}</td>
					<td>${dato.getFechaPago()}</td>
					<td>${dato.getCantidadNeta()}</td>
					<td>${dato.getFechaInicio()} - ${dato.getFechaFin()}</td>
					<td>${dato.getFormaPago()}</td>
					<td>${dato.getDiasTrabajados()}</td>
					<td>${dato.getFaltas()}</td>
					<td>
						<div style="background-color: red;text-align: center;">
						<h8 class="texto">Inactiva</h8>
						</div>
					</td>
					</tr>
				</c:if>
				<c:if test="${dato.getEstatus() eq 'A'}">
					<tr>
					<td>${dato.getNombreEmpleado()} ${dato.getApaterno()} ${dato.getAmaterno()}</td>
	                <td>${dato.getFechaPago()}</td>
					<td>${dato.getCantidadNeta()}</td>
					<td>${dato.getFechaInicio()} - ${dato.getFechaFin()}</td>
					<td>${dato.getFormaPago()}</td>
					<td>${dato.getDiasTrabajados()}</td>
					<td>${dato.getFaltas()}</td>
					<td>
						<c:if test="${dato.getEstatusNomina() eq 'C' }">
							<div id="status-${dato.getEstatusNomina()}" style="background-color: orange;text-align: center;">
							<h8 class="texto">En Captura</h8>
							</div>
						</c:if>
						<c:if test="${dato.getEstatusNomina() eq 'P' }">
							<div id="status-${dato.getEstatusNomina()}" style="background-color: green;text-align: center;">
							<h8 class="texto">Pagada</h8>
							</div>
						</c:if>
					</td>
					<td>
					<form action="${pageContext.servletContext.contextPath}/Nominas" method="post">
						<input type="hidden" name="id" value="${dato.getIdNomina()}">
						<input type="hidden" name="idEmpleado" value="${dato.getIdEmpleado()}">
						<div id="${dato.getIdNomina()}">
							<c:if test="${dato.getEstatusNomina() eq 'P' }">
								<button type="submit" name="op" value="Imprimir">
										<img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/print.png" style="max-width:100%;">
								</button>
								<input type="submit" class="btn btn-danger" name="op" value="Eliminar" onclick="javascript:eliminar()">
							</c:if>
							<c:if test="${dato.getEstatusNomina() eq 'C' }">
								<button type="submit" name="op" value="Imprimir">
										<img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/print.png" style="max-width:100%;">
								</button>
								<input type="submit" class="btn btn-success" name="op" value="Pagar">
								<br>
								<input type="submit" class="btn btn-warning" name="op" value="Editar">
								<input type="submit" class="btn btn-danger" name="op" value="Eliminar" onclick="javascript:eliminar()">
									
							</c:if>	
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
		      <div class="col-md-8" style="text-align: center">
		        <label>Nss Empleado</label>
		        <br>
		        <input name="nss" id="registro-nss" type="text" style="width:200px;" readonly required>
		      </div>
		      <div class="col-md-4">
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
		    		<button type="button" onclick="clonar(2,'percepciones','percepcion-contenido-','select-p-')"style="width:40px;" id="agregar-percepcion">
						<img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/plus.png" style="max-width:100%;">
					</button>
		    	</div>
		    	<div class="container">
		    		<div style="border-style:solid;border-width:thin;">
		    		<span id="percepciones" name="percepciones">
         				  
         				  <!-- AQUI EMPIEZA UNA SOLA PERCEPCION -->
         				  <div id="percepcion-contenido-1">
         				  	 <hr style="width:80%;">
					          <div class="row">
						          <div class="col-sm-10">
						          	  <label>Percepcion:</label>
						              <select id="select-p-1" name="select-p-1" readonly="readonly">
						              <c:forEach var="dato" items="${datospercepciones}">
						              	<option value="${dato.getIdPercepcion()}">${dato.getNombre()}</option>
						              </c:forEach>
						              </select>
						          </div>
				              	  <div class="col-sm-2">
				              	  	<button type="button" style="visibility:hidden;" onclick="quitar(2,'percepcion-contenido-1')" class="btn-danger" style="width:40px;">X </button>
				              	  </div>
					          </div>
					          <hr style="width:80%;">
         				  </div>
				          <!-- AQUI TERMINA UNA SOLA PERCEPCION -->
				          
		    		</span>
		    		</div>
		    	</div>
		    </div>
		    <br>
		    <label>Deducciones de esta Nomina:</label>
		    <div class="row">
		    	<div class="col-md-2">
		    		<button type="button" onclick="clonar(1,'deducciones','deduccion-contenido-','select-d-')" style="width:40px;" id="agregar-deduccion">
						<img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/plus.png" style="max-width:100%;">
					</button>
		    	</div>
		    	<div class="container">
					<div style="border-style:solid;border-width:thin;">
		    		<span id="deducciones" name="deducciones">
         				  
         				  <!-- AQUI EMPIEZA UNA SOLA DEDUCCION -->
         				  <div id="deduccion-contenido-1">
         				  	 <hr style="width:80%;">
					          <div class="row">
					            <div class="col-sm-10">
					              <label>Deduccion:</label>
					              <select id="select-d-1" name="select-d-1">
					              <c:forEach var="dato" items="${datosdeducciones}">
					              	<option value="${dato.getIdDeduccion()}">${dato.getNombre()}</option>
					              </c:forEach>
					              </select>
					            </div>
					            
					            <div class="col-sm-2">
					            	<button type="button" style="visibility:hidden;" onclick="quitar(1,'deduccion-contenido-1')" class="btn-danger" style="width:40px;">X </button>
					            </div>
					          </div>
					          <hr style="width:80%;">
         				  </div>
				          <!-- AQUI TERMINA UNA SOLA PERCEPCION -->
				          
		    		</span>
		    		</div>
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

<!-- MODAL PARA OBTENER NSS -->
<div class="modal fade" id="modalPedirNss">
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
      <div class="container" style="border: dotted">
			<div class="row">
				<div class="col-md-12" style="text-align: center">
					<label><b>Buscar el NSS de los empleados</b></label>
				</div>
				
				<div class="col-md-6" style="text-align: center">
					<label>Nombre</label>
					<br>
					<input type="text" style="width:100%" id="find-nombre">
				</div>
				<div class="col-md-3" style="text-align: center">
					<label>A. Paterno</label>
					<br>
					<input type="text" style="width:100%" id="find-apaterno">
				</div>
				<div class="col-md-3" style="text-align: center">
					<label>A. Materno</label>
					<br>
					<input type="text" style="width:100%" id="find-amaterno">
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-md-12" style="text-align:center">
					<button type="button" onclick="buscar_nss_ajax()" class="btn btn-primary">Buscar</button>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-md-12" style="text-align:center">
					<label>NSS Empleado</label>
					<br>
					<span id="find_nss"></span>
				</div>
			</div>
			<br>
		</div>
      
      	<div class="row">
	      	<div class="col-md-12" style="text-align: center">
	      	<label><b>Ingresa el Nss del empleado para continuar</b></label>
	      		<br>
		        <label>Nss Empleado</label>
		        <br>
		        <input id="buscar-nss" type="text" style="width:200px;" required>
		        <br>
		        <br>
		        <button type="button" onclick="get_action()" class="btn btn-primary">Continuar</button>
		     </div>
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
