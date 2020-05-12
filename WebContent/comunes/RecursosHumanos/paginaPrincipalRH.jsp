<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri  = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<title>Principal</title>

		<meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	    <!-- Bootstrap core CSS and JS-->
	    <link href="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	    <script type="text/javascript" src="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/jquery/jquery.js"></script>
		<script type="text/javascript" src="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/bootstrap/js/bootstrap.min.js"></script>

	    <!-- Nuestras hojas de estilo-->
	    <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/estilos.css">
		<script type="text/javascript" src="<c:out value="${pageContext.servletContext.contextPath}"/>/js/funciones.js"></script>
		<link rel="icon" type="image/png" href="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/carrito_32x.ico">
	</head>
	<body onload="getHoraActual()">
		<div class="contenedorPadre">


			<div class="cabecera">
				<img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/campo3.jpg" alt="">
				<div class="tituloCabecera">
					<h1>AGRONEGOCIOS</h1>
					<h2>Usuario: ${usuario.getNombre()}</h2>
					<label id="fechaactual"></label>
				</div>


				<div class="logo">
					<img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/carrito.png" alt="">
				</div>
				<div class="cerrarsesion">
					<form action="${pageContext.servletContext.contextPath}/General?op=RegresarInicio" method="post">
						<button class="btn-danger">Ir a Inicio</button>
					</form>
				</div>
			</div>

			<div class="contenido container">
			
				<div class= "fondocirculo">
				
				
					<div class = fondocirculoblanco>
					
					<img class = "logoblanco" src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/carrito.png" alt="">
					
					</div>
					
					
					<div class = "fondomenucirculoTOPr">
					
					<div class = "textoTOP">
						<a href="${pageContext.servletContext.contextPath}/Empleados?op=Listar&pagina=1">EMPLEADOS</a>
					</div>
					
					<div class = "textoRIGHT">
						<a href="${pageContext.servletContext.contextPath}/Horarios?op=Listar&pagina=1">HORARIOS</a>
					</div>
					
					<div class = "textoLEFT">
						<a href="${pageContext.servletContext.contextPath}/AusenciasJustificadas?op=Listar&pagina=1">AUSENCIAS <br> JUSTIFICADAS</a>
					</div>
					
					<div class = "textoBOTTOM">
						<a href="${pageContext.servletContext.contextPath}/DocumentacionEmpleado?op=Listar&pagina=1">DOCUMENTACIÓN <br> EMPLEADO</a>
					</div>
					
					
					<div class="fondoplanta">
					
					<img class = "planta1" src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/planta1.png" alt="">
					
					</div>
					
					
					</div>
					
					<div class = "fondomenucirculoTOPl">
					
					<div class = "textoTOP">
						<a href="${pageContext.servletContext.contextPath}/FormasPago?op=Listar&pagina=1">FORMAS <br> PAGO</a>
					</div>
					
					<div class = "textoRIGHT">
						<a href="${pageContext.servletContext.contextPath}/Nominas?op=Listar&pagina=1">NÓMINAS</a>
					</div>
					
					<div class = "textoLEFT">
						<a href="${pageContext.servletContext.contextPath}/NominasPercepciones?op=Listar&pagina=1">NÓMINAS <br> PERCEPCIONES</a>
					</div>
					
					<div class = "textoBOTTOM">
						<a href="${pageContext.servletContext.contextPath}/NominasDeducciones?op=Listar&pagina=1">NÓMINAS <br> Deducciones</a>
					</div>
					
					<div class="fondoplanta">
					
					<img class = "planta1" src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/planta2.png" alt="">
					
					</div>
					
					</div>
					
					<div class = "fondomenucirculoBOTTOMr"><div class = "textoTOP">
					
					<a href="${pageContext.servletContext.contextPath}/Incapacidades?op=Listar&pagina=1">INCAPACIDADES</a>
					</div>
					
					<div class = "textoRIGHT">
						<a href="${pageContext.servletContext.contextPath}/Percepciones?op=Listar&pagina=1">PERCEPCIONES</a>
					</div>
					
					<div class = "textoLEFT">
						<a href="${pageContext.servletContext.contextPath}/Deducciones?op=Listar&pagina=1">DEDUCCIONES</a>
					</div>
					
					<div class = "textoBOTTOM">
						<a href="${pageContext.servletContext.contextPath}/Departamentos?op=Listar&pagina=1">DEPARTAMENTOS</a>
					</div>
					
					
					
					<div class="fondoplanta">
					
					<img class = "planta1" src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/planta3.png" alt="">
					
					</div>
					
					</div>
					
					<div class = "fondomenucirculoBOTTOMl">
					
					<div class = "textoTOP">
					
					
						<a href="${pageContext.servletContext.contextPath}/Estado?op=Listar&pagina=1">ESTADOS</a>

					
					</div>
					
					<div class = "textoRIGHT">
						<a href="${pageContext.servletContext.contextPath}/Ciudades?op=Listar&pagina=1">CIUDADES</a>
					</div>
					
					<div class = "textoLEFT">
						<a href="${pageContext.servletContext.contextPath}/Puestos?op=Listar&pagina=1">PUESTOS</a>
					</div>
					
					<div class = "textoBOTTOM">
						<a href="${pageContext.servletContext.contextPath}/HistorialPuestos?op=Listar&pagina=1">Historial <br> PUESTOS</a>
					</div>
					
					<div class="fondoplanta">
					
					<img class = "planta1" src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/planta4.png" alt="">
					
					</div>
					
					
					</div>
					
					
					
					
					
					</div>
					
					
					
					
				
				
				</div>
			
				

			</div>

		</div>

	</body>
	</html>
