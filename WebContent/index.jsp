<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri  = "http://java.sun.com/jsp/jstl/core" prefix="c" %> 


<!DOCTYPE html>
<html>

<head>
    <title>Login</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap core CSS -->
    <link href="<c:out value="${pageContext.servletContext.contextPath}"/>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/shop-homepage.css" rel="stylesheet">
    <!-- Nuestras hojas de estilo-->
    <link rel="stylesheet" type="text/css" href="<c:out value="${pageContext.servletContext.contextPath}"/>/css/estilo.css">
    <!--Una referencia a unos icono online-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
        integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
</head>

<body style="background-color:">

<nav class">
<center> <img src="<c:out value="${pageContext.servletContext.contextPath}"/>/imagenes/logo.png" alt="logo" height="180" width="980">

</nav>
<div class="alert alert-warning">

 <center> <strong></strong> <a href="#" class="alert-link">B I E N V E N I D O</a> </center>
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
