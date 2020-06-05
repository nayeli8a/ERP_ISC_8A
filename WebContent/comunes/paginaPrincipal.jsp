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
		<script type="text/javascript" src="<c:out value="${pageContext.servletContext.contextPath}"/>/js/funciones.js"></script>
		
		<style type="text/css">
			a.disabled {
			  -webkit-filter: grayscale(100%); /* Safari 6.0 - 9.0 */
			  filter: grayscale(100%);
			  pointer-events: none;
			  cursor: default;
			}
		</style>
		
	</head>
	<body onload="getHoraActual()">
		<div class="contenedorPadre">
		
			<div class="cabecera">
				<div class="d-flex justify-content-center">
					<img src="${pageContext.servletContext.contextPath}/imagenes/campo3.jpg" alt="">
				</div>
				<div class="tituloCabecera">
					<h1>AGRONEGOCIOS</h1>
					<h2>Usuario: ${usuario.getNombre()}</h2>
					<label id="fechaactual"></label>
				</div>
				
				<div class="logo">
					<img src="${pageContext.servletContext.contextPath}/imagenes/carrito.png" alt="">
				</div>
				<div class="cerrarsesion">
					<form action="${pageContext.servletContext.contextPath}/Usuario?op=CS" method="post">
						<button class="btn-danger">Cerrar Sesion</button>
					</form>
				</div>
			</div>
			
			
			<div class="contenido container">
	            <c:if test="${usuario.getidTipoUsuario() == 1}">
	            	 <a href="${pageContext.servletContext.contextPath}/comunes/RecursosHumanos/paginaPrincipalRH.jsp">
						<div class="opcion">
							<img src="${pageContext.servletContext.contextPath}/imagenes/campo5.jpg" alt="">
							<div class="descripcion"><h2>Recursos Humanos</h2></div>
						</div>
	            	</a>
	            	<a href="#" class="disabled">
						<div class="opcion">
							<img src="${pageContext.servletContext.contextPath}/imagenes/campo5.jpg" alt="">
							<div class="descripcion"><h2>Ventas</h2></div>
	
						</div>
            		</a>
            		<a href="#" class="disabled">
						<div class="opcion">
							<img src="${pageContext.servletContext.contextPath}/imagenes/campo5.jpg" alt="">
							<div class="descripcion"><h2>Compras</h2></div>
	
						</div>
            		</a>
	            </c:if>
	           
				<c:if test="${usuario.getidTipoUsuario() == 2}">
					<a class="disabled" href="${pageContext.servletContext.contextPath}/comunes/RecursosHumanos/paginaPrincipalRH.jsp">
						<div class="opcion">
							<img src="${pageContext.servletContext.contextPath}/imagenes/campo5.jpg" alt="">
							<div class="descripcion"><h2>Recursos Humanos</h2></div>
						</div>
	            	</a>
	            	<a href="#" >
						<div class="opcion">
							<img src="${pageContext.servletContext.contextPath}/imagenes/campo5.jpg" alt="">
							<div class="descripcion"><h2>Ventas</h2></div>
	
						</div>
            		</a>
            		<a href="#" class="disabled">
						<div class="opcion">
							<img src="${pageContext.servletContext.contextPath}/imagenes/campo5.jpg" alt="">
							<div class="descripcion"><h2>Compras</h2></div>
	
						</div>
            		</a>
				</c:if>
            	
				<c:if test="${usuario.getidTipoUsuario() == 3}">
					<a class="disabled" href="${pageContext.servletContext.contextPath}/comunes/RecursosHumanos/paginaPrincipalRH.jsp">
						<div class="opcion">
							<img src="${pageContext.servletContext.contextPath}/imagenes/campo5.jpg" alt="">
							<div class="descripcion"><h2>Recursos Humanos</h2></div>
						</div>
	            	</a>
	            	<a href="#" class="disabled">
						<div class="opcion">
							<img src="${pageContext.servletContext.contextPath}/imagenes/campo5.jpg" alt="">
							<div class="descripcion"><h2>Ventas</h2></div>
	
						</div>
            		</a>
            		<a href="#">
						<div class="opcion">
							<img src="${pageContext.servletContext.contextPath}/imagenes/campo5.jpg" alt="">
							<div class="descripcion"><h2>Compras</h2></div>
	
						</div>
            		</a>
				</c:if>
	            
			</div>

		</div>

	</body>
	</html>
