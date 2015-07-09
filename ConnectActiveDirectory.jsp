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
    <div id="wrap"> 	
		<%
        //Unha vez introducido un dato, envíase un parámetro para cerrar a ventana e recargar o listado:
        String param = request.getParameter("close");
        if(param!=null){ 
        %>
			<script> 
             opener.location.reload();
             window.close();
            </script>
        <%
        }
        %>
		<h1 class="font my-title"> Insertar datos de conexión al Active Directory </h1>
   		<form method="post" action="/ServidorSIAR/Controller"> 
        <input type="hidden" name="action" value="search_activedirectory">
        <input type="hidden" name="state" value="1">
            <div class="form-group">
              <label class="control-label col-sm-2" for="">Servidor:</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" name="server" placeholder="Insertar servidor">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="">Usuario:</label>
              <div class="col-sm-10">          
                <input type="text" class="form-control"name="user" placeholder="Insertar usuario">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="">Dominio:</label>
              <div class="col-sm-10">
                <input type="text" class="form-control"  name="domain" placeholder="Insertar dominio">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="">Contraseña:</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" name="pwd" placeholder="Insertar contraseña">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="">Distinguished Name:</label>
              <div class="col-sm-10">
                <input type="text" class="form-control"  name="distinguishedName" placeholder="Ejemplo: ou=Perez Rumbao,dc=perez-rumbao,dc=es">
              </div>
            </div>
            <div class="form-group">        
              <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="pull-right btn btn-primary btn-sm">
                  <span class="glyphicon glyphicon-refresh"></span> Actualizar info
                </button>
              </div>
            </div>
    	</form>
    </div>

</BODY>
</HTML>