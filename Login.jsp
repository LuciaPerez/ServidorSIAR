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
</head>
<BODY>
	<div id="wrap"> 
    <%@ include file="HeaderLogin.html" %> 
    <div class="container">
        
        <form method="post" class="form-horizontal" action="/ServidorSIAR/Controller"> <!--?operacion=adadfasd&-->
        <input type="hidden" name="action" value="login">

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
              <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">Entrar</button>
              </div>
            </div>
        </form>
    </div>
    <%@ include file="Footer.html" %>
    </div>

     
</BODY>
</HTML>