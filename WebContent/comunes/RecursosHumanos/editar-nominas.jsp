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
	
		function ponervalores(iddiv,select,last,DoP)
		{
			if(DoP == 1)
			{
				//aqui modificamos a las deducciones
				document.getElementById(iddiv).id = iddiv+numd;
				document.getElementById(select).name = select+""+numd;
				document.getElementById(last).name = last+""+numd;
				document.getElementById(select).id = select+""+numd;
				document.getElementById(last).id = last+""+numd;
				document.getElementById("bdeducciones-").id = "bdeducciones-"+numd;
				var btn = document.getElementById("bdeducciones-"+numd);
				btn.setAttribute("onclick","quitar("+DoP+",'deducciones-"+numd+"');");
				
				if(numd > 1)
				{
					var btn = document.getElementById("bdeducciones-"+numd);
					btn.setAttribute("style","visibility:visible;");
				}
				
				numd = numd+1;
			}else
			{
				//aqui modificamos a las percepciones
				document.getElementById(iddiv).id = iddiv+nump;
				document.getElementById(select).name = select+""+nump;
				document.getElementById(last).name = last+""+nump;
				document.getElementById(select).id = select+""+nump;
				document.getElementById(last).id = last+""+nump;
				document.getElementById("bpercepciones-").id = "bpercepciones-"+nump;
				var btn = document.getElementById("bpercepciones-"+nump);
				btn.setAttribute("onclick","quitar("+DoP+",'percepciones-"+nump+"');");
				
				if(nump > 1)
				{
					var btn = document.getElementById("bpercepciones-"+nump);
					btn.setAttribute("style","visibility:visible;");
				}
				
				nump = nump+1;
			}
			
		}
		
		//funcion para tomar las variables globales de cuantas percepciones 
		//y deducciones hay y activar el form editar
		function editar_nomina()
		{
			//tomamos el action del form y le contatenamos dos parametros mas
			var form = document.getElementById("editar-nomina");	
	    	form.setAttribute("action",form.getAttribute("action")+"&deducciones="+(numd-1));
	    	form.setAttribute("action",form.getAttribute("action")+"&percepciones="+(nump-1));
			form.submit();
		}
		
		//si DoP es 1 es una deducion
		function clonar(DoP,idelemento,select)
		{
			if(DoP==1)
			{
				alert(idelemento+(numd-1));
				var elemento = document.getElementById(idelemento+(numd-1));
				var clon = elemento.cloneNode(true);
				clon.setAttribute("id",idelemento+numd);
				//ponemos el clon en la pagina html
				document.getElementById("deduccionesSpan").appendChild(clon);
				
				var selects = document.getElementById("deduccionesSpan").getElementsByTagName('select');
				selects[0].setAttribute("id",select+numd);
				selects[0].setAttribute("name",select+numd);
				selects[0].removeAttribute("readonly");
				var btns = document.getElementById("deduccionesSpan").getElementsByTagName('button');
				btns[0].setAttribute("onclick","quitar("+DoP+",'"+idelemento+numd+"');");
				btns[0].setAttribute("style","visibility:visible;");
				btns[0].setAttribute("id","bdeducciones-"+numd);
				numd++;
			}else
			{
				alert(idelemento+(nump-1));
				var elemento = document.getElementById(idelemento+(nump-1));
				var clon = elemento.cloneNode(true);
				clon.setAttribute("id",idelemento+nump);
				//ponemos el clon en la pagina html
				document.getElementById("percepcionesSpan").appendChild(clon);
				
				var selects = document.getElementById("percepcionesSpan").getElementsByTagName('select');
				selects[0].setAttribute("id",select+nump);
				selects[0].setAttribute("name",select+nump);
				selects[0].removeAttribute("readonly");
				var btns = document.getElementById("percepcionesSpan").getElementsByTagName('button');
				btns[0].setAttribute("onclick","quitar("+DoP+",'"+idelemento+nump+"');");
				btns[0].setAttribute("style","visibility:visible;");
				btns[0].setAttribute("id","bpercepciones-"+nump);
				nump++;
			}
			
		}
		
		//si DoP es 1 es una deducion
		function quitar(DoP,idelemento)
		{
			alert("idElemento: "+idelemento);
			if(DoP==1)
			{
				if(numd>1)
				{
					var elem = document.getElementById(idelemento);
					numd = numd-1;
					alert("nump: "+nump+" numd:"+numd);
				    return elem.parentNode.removeChild(elem);
				}
			}else
			{
				if(nump>1)
				{
					var elem = document.getElementById(idelemento);
					nump = nump-1;
					alert("nump: "+nump+" numd:"+numd);
				    return elem.parentNode.removeChild(elem);
				}		
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
			<form id="editar-nomina" action="${pageContext.servletContext.contextPath}/Nominas?op=Modificar" method="post">
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
			      <div class="col-md-2">
			      	<label for="Estatus">Estatus</label>
			    	<br>
			    	<select id="estatus" name="estatus">
						<option value="A">Activo</option>
						<option value="I">Inactivo</option>
					</select>
				  </div>
				  <div class="col-md-2">
			      	<label for="EstatusNomina">Estatus Nomina</label>
			    	<br>
			    	<select id="estatusNomina" name="estatusNomina">
						<option value="C">En Captura</option>
						<option value="P">Pagada</option>
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
			    
			    <!-- Aqui empieza la parte de Percepciones -->
				<button type="button" onclick="clonar(2,'percepciones-','select-p-')"style="width:40px;" id="agregar-percepcion">
					<img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/plus.png" style="max-width:100%;">
				</button>
				<br>    
			    <label><b>Percepciones:</b></label>
			    <c:forEach var="per" items="${percepciones}">
			          
			          <div id="percepciones-" class="col">
				          <hr style="width:80%;">
				          
			              <label>Percepcion:</label>
			              <br>
			              <select id="select-p-" name="select-p-">
			              <c:forEach var="dato" items="${datospercepciones}">
			              
		              		<c:if test="${dato.getIdPercepcion() eq per.getIdPercepcion()}">
		              			<option selected value="${dato.getIdPercepcion()}">
		              			${dato.getNombre()}
		              			</option>
		              		</c:if>
		              		<c:if test="${dato.getIdPercepcion() != per.getIdPercepcion()}">
		              			<option value="${dato.getIdPercepcion()}">
		              			${dato.getNombre()}
		              			</option>
		              		</c:if>
			              </c:forEach>
			              </select>
			              
			              <!-- Este input servira para guardar el valor anterior de la percepcion -->
			              <input type="hidden" id="last-p-" name="last-p-" value="${per.getIdPercepcion()}">
				          <div class="col-sm-2">
			              	  	<button id="bpercepciones-" type="button" style="visibility:hidden;" onclick="quitar(2,'percepciones-');" class="btn-danger" style="width:40px;">X </button>
			              </div>
				          <hr style="width:80%;">
				          <script type="text/javascript">
				        	ponervalores('percepciones-','select-p-','last-p-',2);
				          </script>
			          </div>
			    </c:forEach>
			    <br>
				<span id="percepcionesSpan">
				
				</span>
				
				<!-- Aqui empieza la parte de Deducciones --> 
				<button type="button" onclick="clonar(1,'deducciones-','select-d-')"style="width:40px;" id="agregar-deduccion">
					<img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/plus.png" style="max-width:100%;">
				</button>
				<br>  
			    <label><b>Deducciones:</b></label>
	    		<c:forEach var="ded" items="${deducciones}">
			    
			    	  <hr style="width:80%;">
			          <div id="deducciones-" class="col">
			            
		              <label>Deduccion:</label>
		              <br>
		              <select id="select-d-" name="select-d-">
		              <c:forEach var="dato" items="${datosdeducciones}">
		              	
	              		<c:if test="${dato.getIdDeduccion() eq ded.getIdDeduccion()}">
	              			<option selected value="${dato.getIdDeduccion()}">
	              			${dato.getNombre()}
	              			</option>
	              		</c:if>
	              		<c:if test="${dato.getIdDeduccion() != ded.getIdDeduccion()}">
	              			<option value="${dato.getIdDeduccion()}">
	              			${dato.getNombre()}
	              			</option>
	              		</c:if>
		              </c:forEach>
		              </select>
		              
		              <!-- Este input servira para guardar el valor anterior de la deduccion -->
		              <input type="hidden" id="last-d-" name="last-d-" value="${ded.getIdDeduccion()}">
		              <div class="col-sm-2">
			           	  	<button id="bdeducciones-" type="button" style="visibility:hidden;" onclick="quitar(1,'deducciones-');" class="btn-danger" style="width:40px;">X </button>
			          </div>
			          <hr style="width:80%;">
			          	<script type="text/javascript">
			          		ponervalores('deducciones-','select-d-','last-d-',1);
			          	</script>
			          </div>
			    </c:forEach>
			    <br>
				<span id="deduccionesSpan">
				
				</span>
					
					    
			    <label><b>Totales:</b></label>
			    <div class="row">
			      <div class="col-md-4">
			        <label>Total Percepciones</label>
			        <br>
			        <input readonly="" name="totalp" type="number" value="${datosnomina.getTotalP()}" 
			        class="form-control" required>
			      </div>
			      <div class="col-md-4">
			        <label>Total Deducciones</label>
			        <br>
			        <input readonly="" name="totald" type="number" value="${datosnomina.getTotalD()}" 
			        class="form-control" required>
			      </div>
			      <div class="col-md-4">
			        <label>Liquido</label>
			        <br>
			        <input readonly="" name="cantidadneta" type="number" value="${datosnomina.getCantidadNeta()}" 
			        class="form-control" required>
			      </div>
			    </div>
			    <br>
			    
			    <div style="text-align: center;">
				  <button type="button" onclick="editar_nomina()" class="btn btn-primary">Editar</button>
				</div>
				
			  </div>
			</form>
		</div>
		
	</div>
	
</body>
</html>