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
	    <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/estilo.css">
	    
	</head>
	<body>
		
		<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
			<a class="navbar-brand" href="#">LOGOTIPO</a>
			<div class="dropdown">
				<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				    Recursos Humanos
				  </button>
			  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
			    <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/comunes/RecursosHumanos/registrar-estados.jsp">Registrar Estados</a>
			    <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/Estado?op=Listar">Consultar Estados</a>
			    <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/Estado?op=ListarPCiudades">Registrar Ciudades</a>
			    <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/Ciudades?op=Listar">Consultar Ciudades</a>
				<a class="dropdown-item" href="${pageContext.servletContext.contextPath}/comunes/RecursosHumanos/registrar-deducciones.jsp">Registrar Deducciones</a>
			    <a class="dropdown-item" href="${pageContext.servletContext.contextPath}/Deducciones?op=Listar">Consultar Deducciones</a>			 
			  </div>
			  
			  
			  
			  
			</div> 
		
                    
			
			
			
			<div class="dropdown">
					<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    Ventas
					  </button>
				  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
				    <a class="dropdown-item" href="#">Estados</a>
				    <a class="dropdown-item" href="#">Ciudades</a>
				  </div>
			</div> 
			<div class="dropdown">
					<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    Compras
					  </button>
				  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
				    <a class="dropdown-item" href="#">Estados</a>
				    <a class="dropdown-item" href="#">Ciudades</a>
				  </div>
			</div> 
			
			
			
			
		</nav>
		
		 
	</body>
</html>