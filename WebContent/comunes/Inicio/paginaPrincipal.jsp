<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri  = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<title>GerenteRH</title>

		<meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	    <!-- Bootstrap core CSS and JS-->
	    <link href="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	    <script type="text/javascript" src="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/jquery/jquery.js"></script>
		<script type="text/javascript" src="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/bootstrap/js/bootstrap.min.js"></script>

	    <!-- Nuestras hojas de estilo-->
	    <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/estilos.css">

	</head>
	<body>
		<div class="contenedorPadre">


			<div class="cabecera">




						<img src="../../imagenes/campo3.jpg" alt="">
						<div class="tituloCabecera"><h1>AGRONEGOCIOS</h1></div>


						<div class="logo">
							<img src="../../imagenes/carrito.png" alt="">
						</div>



			</div>

			<div class="contenido container">
							<center>

            <a href="${pageContext.servletContext.contextPath}/comunes/RecursosHumanos/paginaPrincipalRH.jsp">
						<div class="opcion">
							<img src="../../imagenes/campo5.jpg" alt="">
							<div class="descripcion"><h2>Recursos Humanos</h2></div>
						</div>
            </a>

            <a href="#">
						<div class="opcion">
							<img src="../../imagenes/campo5.jpg" alt="">
							<div class="descripcion"><h2>Ventas</h2></div>

						</div>
            </a>

            <a href="#">
						<div class="opcion">
							<img src="../../imagenes/campo5.jpg" alt="">
							<div class="descripcion"><h2>Compras</h2></div>
						</div>
            </a>


					</center>
			</div>

		</div>

	</body>
	</html>
