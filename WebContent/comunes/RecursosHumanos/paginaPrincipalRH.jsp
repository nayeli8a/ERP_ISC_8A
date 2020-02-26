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
				<div class="opcion">

					<img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/campo5.jpg" alt="">
					<div class="descripcion"><h2>Estados</h2></div>
					<a href="${pageContext.servletContext.contextPath}/Estado?op=Listar"><button type="button" name="button" class="derecha btn btn-secondary">Consultar</button></a>

				</div>

				<div class="opcion">
					<img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/campo5.jpg" alt="">
					<div class="descripcion"><h2>Ciudades</h2></div>
					<a href="${pageContext.servletContext.contextPath}/Ciudades?op=Listar"><button type="button" name="button" class="derecha btn btn-secondary">Consultar</button></a>

				</div>

				<div class="opcion">
					<img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/campo5.jpg" alt="">
					<div class="descripcion"><h2>Deducciones</h2></div>
					<a href="${pageContext.servletContext.contextPath}/Deducciones?op=Listar"><button type="button" name="button" class="derecha btn btn-secondary">Consultar</button></a>

				</div>

				<div class="opcion">
					<img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/campo5.jpg" alt="">
					<div class="descripcion"><h2>Percepciones</h2></div>
					<a href="${pageContext.servletContext.contextPath}/Percepciones?op=Listar"><button type="button" name="button" class="derecha btn btn-secondary">Consultar</button></a>

				</div>
				
				<div class="opcion">
					<img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/campo5.jpg" alt="">
					<div class="descripcion"><h2>Departamentos</h2></div>
					<a href="${pageContext.servletContext.contextPath}/Departamentos?op=Listar"><button type="button" name="button" class="derecha btn btn-secondary">Consultar</button></a>

				</div>
			</div>

		</div>

	</body>
	</html>
