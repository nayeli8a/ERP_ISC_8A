<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri  = "http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<%
String url="";
if(session.getAttribute("usuario") != null)
	{
		//existe una sesion anterior
		url=modelo.datos.Constantes.PAGINAPRINCIPAL;
		response.sendRedirect(pageContext.getServletContext().getContextPath()+url);
	}
%>
<!DOCTYPE html>
<html>

<head>
    <title>Login</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- Bootstrap core CSS and JS-->
	<link href="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script type="text/javascript" src="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/jquery/jquery.js"></script>
	<script type="text/javascript" src="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/bootstrap/js/bootstrap.min.js"></script>
		
    <!-- Nuestras hojas de estilo-->
    <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/estilo.css">
    <script type="text/javascript" src="<c:out value="${pageContext.servletContext.contextPath}"/>/js/funciones.js"></script>

    <!--Una referencia a unos icono online-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
        integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
	<link rel="icon" type="image/png" href="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/carrito_32x.ico">
</head>

<body style="background-color:">

<nav class">
<center> 
<div class="d-flex justify-content-center">
	<img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/campo3.jpg" alt="logo" height="180" width="980">
</div>

</nav>
<div class="alert alert-warning" style="background:#509a1f;">
 <a href="#" class="alert-link d-flex justify-content-center" style="color: red;">B I E N V E N I D O</a>
</div>

    <div class="container" style="margin-top:50px">
        <div class="d-flex justify-content-center h-100">
            <div class="user_card">
                <div class="d-flex justify-content-center">
                    <div class="brand_logo_container">
                        <img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/carrito.png" class="brand_logo" alt="Logo" height="200px" width="200px">
                    </div>
                </div>
                <div class="d-flex justify-content-center form_container">
                	<form action="${pageContext.servletContext.contextPath}/Usuario?op=L" method="post">
                    <div class="form-group">
                      <input type="text" name="Usuario" required class="form-control form-control-user" placeholder="Ingresa tu Usuario...">
                    </div>
                    <div class="form-group">
                      <input type="password" name="Password" required class="form-control form-control-user" placeholder="Ingresa tu Contraseña...">
                    </div>
                    <div class="text-center">
                    	<button type="submit" class="btn btn-primary">Ingresar</button>
                    </div>
                  </form>
                </div>
            </div>
        </div>
    </div>


</body>

</html>
