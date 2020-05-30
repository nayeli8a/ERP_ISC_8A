<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri  = "http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html>
<head>

<title>Editar Nominas</title>

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

	<script>
	var nump=1;
	var numd=1;
	
		function percepciones(idmonto, iddias)
	    {
	       var salario = document.getElementById("salario-empleado").value;
	       var dias = document.getElementById(iddias).value;
	       var percepcion = salario*dias;
	       var Respercepcion= document.getElementById(idmonto);
	       Respercepcion.setAttribute("value",percepcion);
	       totalp();
	
	    }
		
		function deducciones(idmonto, idporcentaje)
	    {
	       var totalP = document.getElementById("total-percepciones").value;
	       var porcentaje = document.getElementById(idporcentaje).value;
	       porcentaje=porcentaje/100;
	       var resultado = porcentaje*totalP;
	       document.getElementById(idmonto).value= resultado;
	       totald();
	    }
	
		var resp=0;
	    function totalpercepciones(valor) {
			resp += valor;
		    document.getElementById("total-percepciones").value = resp;
	    }
		
		function totalp()
	    {
	    	var respuesta=0;
	    	for (var i = 1; i < nump+1;i++ )
	    	{
	    		respuesta += parseInt(document.getElementById("montop-"+i).value);
	    	}
	    	document.getElementById("total-percepciones").value = respuesta;
	    }
		
		function totald()
	    {
	    	var respuesta=0;
	    	for (var i = 1; i < numd+1;i++ )
	    	{
	    		respuesta += parseInt(document.getElementById("montod-"+i).value);
	    	}
	    	document.getElementById("total-deducciones").value = respuesta;
	    	totalsalario();
	    }
		
		function ponervalores(DoP)
		{
			if(DoP == 1)
			{
				//aqui modificamos a las deducciones
				document.getElementById('deducciones-').id = "deducciones-"+numd;
				var selectd = document.getElementById('select-d-');
				selectd.setAttribute("name","select-d-"+""+numd);
				selectd.setAttribute("onchange","pasarporcentaje(this.options[this.selectedIndex].getAttribute('porcentaje'),"+numd+")");
				selectd.setAttribute("id","select-d-"+""+numd);
				
				document.getElementById('last-d-').name = "last-d-"+""+numd;
				document.getElementById('last-d-').id = "last-d-"+""+numd;
				
				//datos para el calculo de las deducciones
				document.getElementById("d-").id = "d-"+numd;
				document.getElementById("montod-").name="montod-"+numd;
				document.getElementById("montod-").id = "montod-"+numd;
				var btnch = document.getElementById("checard-");
				btnch.setAttribute("onclick","deducciones('montod-"+numd+"','d-"+numd+"')");
				btnch.setAttribute("id","checard-"+numd);
				
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
				document.getElementById("percepciones-").id = "percepciones-"+nump;
				var selectp = document.getElementById("select-p-");
				selectp.setAttribute("name","select-p-"+""+nump);
				selectp.setAttribute("onchange","pasardias(this.options[this.selectedIndex].getAttribute('dias'),"+nump+");")
				selectp.setAttribute("id","select-p-"+""+nump);
				
				document.getElementById("last-p-").name = "last-p-"+""+nump;
				document.getElementById("last-p-").id = "last-p-"+""+nump;
				
				//datos para el calculo de las percepciones
				document.getElementById("p-").id = "p-"+nump;
				document.getElementById("montop-").name="montop-"+nump;
				document.getElementById("montop-").id = "montop-"+nump;
				var btnch = document.getElementById("checarp-");
				btnch.setAttribute("onclick","percepciones('montop-"+nump+"','p-"+nump+"')");
				btnch.setAttribute("id","checarp-"+nump);
				
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
		
		function pasardias(dias,num)
		{
			var select = document.getElementById('select-p-'+num);
			document.getElementById('p-'+num).value=dias;
		}
		
		function pasarporcentaje(porcentaje,num)
		{
			var select = document.getElementById('select-d-'+num);
			document.getElementById('d-'+num).value=porcentaje;
		}
		
		function cargarinicial()
		{
			for(var i=1;i<nump;i++)
			{
				var select = document.getElementById("select-p-"+i);
		        var dias = $('option:selected', select).attr("dias");
		      	document.getElementById("p-"+i).value = dias;
			}
			
	      	for(var j=1;j<numd;j++)
	      	{
	      		var select = document.getElementById("select-d-"+j);
		        var porc = $('option:selected', select).attr("porcentaje");
		      	document.getElementById("d-"+j).value = porc;
	      	}
	      	
		}
		
		//si DoP es 1 es una deducion
		function clonar(DoP,idelemento,select)
		{
			if(DoP==1)
			{
				//alert(idelemento+(numd-1));
				var elemento = document.getElementById(idelemento+(numd-1));
				var clon = elemento.cloneNode(true);
				clon.setAttribute("id",idelemento+numd);
				//ponemos el clon en la pagina html
				document.getElementById("deduccionesSpan").appendChild(clon);
				
				var selects = document.getElementById("deduccionesSpan").getElementsByTagName('select');
				selects[0].setAttribute("id",select+numd);
				selects[0].setAttribute("name",select+numd);
				selects[0].setAttribute("onchange","pasarporcentaje(this.options[this.selectedIndex].getAttribute('porcentaje'),"+numd+")");
				selects[0].removeAttribute("readonly");
				var btns = document.getElementById("deduccionesSpan").getElementsByTagName('button');
				btns[0].setAttribute("onclick","quitar("+DoP+",'"+idelemento+numd+"');");
				btns[0].setAttribute("style","visibility:visible;");
				btns[0].setAttribute("id","bdeducciones-"+numd);
				btns[1].setAttribute("onclick","deducciones('montod-"+numd+"','d-"+numd+"')");
				btns[1].setAttribute("id","checard-"+numd);
				var inputs = document.getElementById("deduccionesSpan").getElementsByTagName('input');
				inputs[0].setAttribute("id","d-"+numd);//input dias deduccion
				inputs[0].setAttribute("name","d-"+numd);
				inputs[1].setAttribute("id","montod-"+numd);
				inputs[1].setAttribute("name","montod-"+numd);
				numd++;
			}else
			{
				//alert(idelemento+(nump-1));
				var elemento = document.getElementById(idelemento+(nump-1));
				var clon = elemento.cloneNode(true);
				clon.setAttribute("id",idelemento+nump);
				//ponemos el clon en la pagina html
				document.getElementById("percepcionesSpan").appendChild(clon);
				
				var selects = document.getElementById("percepcionesSpan").getElementsByTagName('select');
				selects[0].setAttribute("id",select+nump);
				selects[0].setAttribute("name",select+nump);
				selects[0].setAttribute("onchange","pasardias(this.options[this.selectedIndex].getAttribute('dias'),"+nump+")");
				selects[0].removeAttribute("readonly");
				var btns = document.getElementById("percepcionesSpan").getElementsByTagName('button');
				btns[0].setAttribute("onclick","quitar("+DoP+",'"+idelemento+nump+"');");
				btns[0].setAttribute("style","visibility:visible;");
				btns[0].setAttribute("id","bpercepciones-"+nump);
				btns[1].setAttribute("onclick","percepciones('montop-"+nump+"','p-"+nump+"')");
				btns[1].setAttribute("id","checarp-"+nump);
				var inputs = document.getElementById("percepcionesSpan").getElementsByTagName('input');
				inputs[0].setAttribute("id","p-"+nump);//input dias percepcion
				inputs[0].setAttribute("name","p-"+nump);
				inputs[1].setAttribute("id","montop-"+nump);
				inputs[1].setAttribute("name","montop-"+nump);
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
		
		 function obtenerDiasTrabajados(valor)
		    {
		       var fechaInicio = document.getElementById("fechainicio").value;
		       var fechaFin = document.getElementById("fechafin").value;
		       var faltas = document.getElementById("faltas").value;
		       if (faltas>=0 & faltas<=15) {
		    	   var aux= (Date.parse(fechaFin)- Date.parse(fechaInicio))
		    	   aux=(aux/24);//dias
		    	   aux=(aux/60);//minutos
		    	   aux=(aux/60);//segundos
		    	   aux=(aux/1000);//milisegundos
		    	   var dias=(aux+1)-faltas; //dias (INT)
		    	   if(dias<0){
		    		   
			       	   document.getElementById("diast").value = 0;  
		    	   }
		    	   else{
		    		   
			       	   document.getElementById("diast").value = dias;   
		    	   }
		    	     	
		    	   } else {
		           	 document.getElementById("faltas").value = 0;
		     			alert("Las faltas deben estar en un rango de 0 a 15 días ");


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
			    
			    <div class="row">
			    	<div class="col-md-4" style="text-align: center">
			        	<label>Salario diario</label>
			        	<br>
						<input type="text" id="salario-empleado" value="${salario}" readonly >
			      	</div>
			    </div>
			
			    
			    <legend> Datos Nomina: </legend>
			    <div class="row">
			    	<div class="col-md-4">
			        <label>Faltas Acumuladas</label>
			        <br>
			        <input name="faltas" id="faltas" type="number" value="${datosnomina.getFaltas()}" onchange="obtenerDiasTrabajados(this.value);"  required>
			      </div>
			      <div class="col-md-4">
			        <label>Dias Trabajados</label>
			        <br>
			        <input name="diast" id="diast" type="number" value="${datosnomina.getDiasTrabajados()}" required>
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
			        <input name="fechainicio" id="fechainicio" type="date" onchange="obtenerDiasTrabajados(this.value);"  value="${datosnomina.getFechaInicio()}" required>
			      </div>
			      <div class="col-md-4">
			        <label>Fecha Final</label>
			        <br>
			        <input name="fechafin" id="fechafin" type="date" onchange="obtenerDiasTrabajados(this.value);"  value="${datosnomina.getFechaFin()}" required>
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
			              <select id="select-p-" name="select-p-" 
			              onchange="pasardias(this.options[this.selectedIndex].getAttribute('dias'),1)" >
			              <c:forEach var="dato" items="${datospercepciones}">
			              
		              		<c:if test="${dato.getIdPercepcion() eq per.getIdPercepcion()}">
		              			<option selected dias="${dato.getDiasPagar()}" value="${dato.getIdPercepcion()}">
		              			${dato.getNombre()}
		              			</option>
		              		</c:if>
		              		<c:if test="${dato.getIdPercepcion() != per.getIdPercepcion()}">
		              			<option dias="${dato.getDiasPagar()}" value="${dato.getIdPercepcion()}">
		              			${dato.getNombre()}
		              			</option>
		              		</c:if>
			              </c:forEach>
			              </select>
			              
			              <div class="col-sm-4">
					      	<label>Dias de percepcion:</label>
					      	<br>
					      	<input id="p-" type="text" value="" style="width: 100%" readonly >
					      </div>
					      
					      <div class="col-sm-4">
					      	<label>Monto de percepcion:</label>
					      	<br>
					      	<input name="montop-" style="width: 100%" id="montop-" type="number" placeholder="Click en checar" onchange="totalpercepciones(this.value)" >
					      </div>
			              <br>
			              <div class="row" style="text-align:center;">
			              	<div class="col-sm-4">
			              		<button id="bpercepciones-" type="button" style="visibility:hidden;" onclick="quitar(2,'percepciones-')" class="btn-danger" style="width:40px;">X </button>
				            </div>
				            
				            <div class="col-sm-4">
				            	<button type="button" id="checarp-" class="btn btn-outline-success" onclick="percepciones('montop-1', 'p-1')" >Checar</button>
					        </div>
						  </div>
			              
			              <!-- Este input servira para guardar el valor anterior de la percepcion -->
			              <input type="hidden" id="last-p-" name="last-p-" value="${per.getIdPercepcion()}">
				          
				          <hr style="width:80%;">
				          <script type="text/javascript">
				        	ponervalores(2);
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
		              <select id="select-d-" name="select-d-"
		               onchange="pasarporcentaje(this.options[this.selectedIndex].getAttribute('porcentaje'),1)" >
		              <c:forEach var="dato" items="${datosdeducciones}">
		              	
	              		<c:if test="${dato.getIdDeduccion() eq ded.getIdDeduccion()}">
	              			<option selected porcentaje="${dato.getPorcentaje()}" value="${dato.getIdDeduccion()}">
	              			${dato.getNombre()}
	              			</option>
	              		</c:if>
	              		<c:if test="${dato.getIdDeduccion() != ded.getIdDeduccion()}">
	              			<option porcentaje="${dato.getPorcentaje()}" value="${dato.getIdDeduccion()}">
	              			${dato.getNombre()}
	              			</option>
	              		</c:if>
		              </c:forEach>
		              </select>
		              
		              <div class="col-sm-4">
			          	<label>% de deducción: </label>
			            <br>
			            <input id="d-" type="text" style="width: 100%" value="" readonly >
			          </div>
			            
		              <div class="col-sm-4">
			          	<label>Monto de deducción:</label>
			            <br>
				      	<input name="montod-" style="width: 100%" id="montod-" type="number" placeholder="Click en checar"  readonly>
			          </div>
		              
		              <br>
			          <div class="row" style="width: 100%">
			            
			            <div class="col-sm-4">
			              <button id="bdeducciones-" type="button" style="visibility:hidden;" onclick="quitar(1,'deducciones-')" class="btn-danger" style="width:40px;">X </button>
			            </div>
			            
			            <div class="col-sm-4">
			              <button id="checard-" type="button"  class="btn btn-outline-success" onclick="deducciones('montod-', 'd-')">Checar</button>
			            </div>
			          </div>
		              
		              <!-- Este input servira para guardar el valor anterior de la deduccion -->
		              <input type="hidden" id="last-d-" name="last-d-" value="${ded.getIdDeduccion()}">
		              
			          <hr style="width:80%;">
			          	<script type="text/javascript">
			          		ponervalores(1);
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
			        <input style="text-align: center;" 
			        name="total-percepciones" id="total-percepciones" 
			        type="text"  value="${datosnomina.getTotalP()}" readonly required>
			      </div>
			      <div class="col-md-4">
			        <label>Total Deducciones</label>
			        <br>
			        <input style="text-align: center;" 
			        name="total-deducciones" id="total-deducciones" 
			        type="text"  value="${datosnomina.getTotalD()}" readonly required>
			      </div>
			      <div class="col-md-4">
			        <label>Salario Quincenal:</label>
			        <br>
			        <input style="text-align: center;" 
			        name="total-salario" id="total-salario" 
			        type="text"  value="${datosnomina.getCantidadNeta()}" readonly required>
			      </div>
			    </div>
			    <br>
			    <script type="text/javascript">cargarinicial()</script>
			    <div style="text-align: center;">
				  <button type="button" onclick="editar_nomina()" class="btn btn-primary">Editar</button>
				</div>
				
			  </div>
			</form>
		</div>
		
	</div>
	
</body>
</html>