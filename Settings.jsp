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
    <%@page import="java.util.ArrayList" %>
    <%@page import="siar.notification.Event" %>
    <%@page import="siar.notification.type.EventType" %>
    <%@page import="siar.notification.location.EventLocation" %>
    <%@page import="siar.notification.category.EventCategory" %>
	<%@page import="siar.users.User" %>

</head>
<BODY>

    <!--http://devdocs.io/-->
	<div id="wrap"> 	
		<%@ include file="Header.html" %>      <div class="container">
    	<h2> Tus datos </h2>
        
          <form methord="post" action="/ServidorSIAR/Controller" class="form-horizontal" role="form">
          <input type="hidden" name="action" value="settings">
            <div class="form-group">
              <label class="control-label col-sm-2" for="uname">Nombre de usuario:</label>
              <div class="col-sm-10">
                <input type="uname" class="form-control" id="uname" name="uname" placeholder="<% out.print(ulogged.getUname()); %>">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="pwd">Contraseña nueva:</label>
              <div class="col-sm-10">          
                <input type="password" class="form-control" id="pwd" name="passwd" placeholder="Inserte su nueva contraseña">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="name">Nombre:</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" id="name" name="name" placeholder="<% out.print(ulogged.getName()); %>">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="surname">Apellidos:</label>
              <div class="col-sm-10">
                <input type="surname" class="form-control" id="surname" name="surname" placeholder="<% out.print(ulogged.getSurname()); %>">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="email">Email:</label>
              <div class="col-sm-10">
                <input type="email" class="form-control" id="email" name="email" placeholder="<% out.print(ulogged.getEmail()); %>">
              </div>
            </div>
            <div class="form-group">        
              <div class="col-sm-offset-2 col-sm-10">
                <div class="checkbox">
                  <label><input type="checkbox" name="notify"> Recibir notificaciones de incidencias en la dirección de correo electrónico indicada</label>
                </div>
              </div>
            </div>
            <div class="form-group">        
              <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">Guardar</button>
              </div>
            </div>
          </form>
        
   		 </div>   
    	 </div>             <%@ include file="Footer.html" %>     </div>
 
</BODY>
</HTML>