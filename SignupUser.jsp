<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es" lang="es">
<HTML>
<head>
	<meta  http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/mystyle.css" type="text/css" media="screen">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/jquery-1.11.2.min.js" ></script>
	<script type="text/javascript" src="js/scripts.js" ></script>
    <%@page pageEncoding="UTF-8"%>
	<%@page import="siar.users.User" %>
</head>
<BODY>
    <div class="container popup"> 	
    	<h2 class="font my-title"> Insertar un nuevo usuario </h2>
		<%
        //Unha vez introducido un dato, envíase un parámetro para cerrar a ventana e recargar o listado:
        String param = request.getParameter("close");
        if(param!=null){ 
        %>
			<script> 
             opener.location.reload();
             window.close();
             //pruebas(); 
            </script>
        <%
        }
		User ulogged = (User)request.getSession().getAttribute("LOGGED"); 
        %>
    	<form method="post" class="form-horizontal" action="/ServidorSIAR/Controller"> 
        <input type="hidden" name="action" value="register_user">
        <input type="hidden" name="state" value="1">
            <div class="form-group">
              <label class="control-label col-sm-2" for="uname">Nombre de usuario:</label>
              <div class="col-sm-10">
                <input type="uname" class="form-control" id="uname" name="uname" placeholder="Insertar nombre de usuario">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="pwd">Contraseña:</label>
              <div class="col-sm-10">          
                <input type="password" class="form-control" id="pwd" name="passwd" placeholder="Insertar contraseña">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="name">Nombre:</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="name" name="name" placeholder="Insertar nombre">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="surname">Apellidos:</label>
              <div class="col-sm-10">
                <input type="surname" class="form-control" id="surname" name="surname" placeholder="Insertar apellidos">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="email">Email:</label>
              <div class="col-sm-10">
                <input type="email" class="form-control" id="email" name="email" placeholder="Insertar dirección de correo electrónico (ejemplo@sair.com)">
              </div>
            </div>
            <div class="form-group">        
              <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default pull-right">Crear</button>
              </div>
            </div>
    	</form>
    </div>

</BODY>
</HTML>