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
    <%@page import="siar.notification.type.EventType" %>
    <%@page import="siar.notification.location.EventLocation" %>
    <%@page import="siar.notification.category.EventCategory" %>
	<%@page import="siar.users.User" %>
</head>
<BODY>
	<div id="wrap"> 	
	<%@ include file="Header.html" %>      
    <div class="container">        
    <% 
		String is_admin = (String)request.getSession().getAttribute("ADMIN"); 
		boolean is_running = (Boolean)request.getServletContext().getAttribute("RUNNING_TIMER");
	%>    
    <div class="row">
      <div class="col-sm-4">
        <div id="dataEvents">		
            <h2 id="tableTitle" class="font my-title">Datos de incidencias</h2>
            <h3 class="my-conf"> <a href="Configuration_Types.jsp">Editar tipos</a> </h3>
            <h3 class="my-conf"> <a href="Configuration_Locations.jsp">Editar localizaciones</a> </h3>
            <h3 class="my-conf"> <a href="Configuration_Categories.jsp">Editar categorías</a> </h3>
        </div>
      </div>
      <div class="col-sm-4">
        <div id="apps">
            <h2 id="tableTitle" class="font my-title"> Aplicaciones de usuario </h2>
            <h3 class="my-conf"> <a href="Configuration_Apps.jsp">Editar aplicaciones</a> </h3>            
        </div> 
      </div>
      <div class="col-sm-4" id="adminCol">
        <% if(is_admin.equals("true")){ %>
            <div id="adminActions">
                <h2 id="tableTitle" class="font my-title"> Opciones de Administrador </h2>
                <h3 class="my-conf"> <a href="/ServidorSIAR/Configuration_Users.jsp">Editar usuarios de la herramienta</a> </h3>
                
                <h2 id="adminTitle" class="font my-title"> Incidencias automáticas </h2>
                <% if(!is_running){ %>
                <form method="post" action="/ServidorSIAR/ControllerNotificationsAutomatically"> 
                    <input type="hidden" name="action" value="start">
                    <p> Intervalo en segundos para realizar la comprobación: <input type="number" class="form-control" name="period" placeholder="Inserte un número" /> </p>
                    <button type="submit" id="saveButton" class="btn btn-success btn-sm">
                     Iniciar la comprobación
                    </button>
                </form>
                <% }else{ %>
                <form method="post" action="/ServidorSIAR/ControllerNotificationsAutomatically"> 
                    <input type="hidden" name="action" value="stop">
                    <button type="submit" id="saveButton" class="btn btn-warning btn-sm">
                     Detener la comprobación
                    </button>
                </form>  
                <% } %>
            </div>
        <% } %> 
      </div>
    </div>
     </div>             
	 <%@ include file="Footer.html" %>     </div>
    </div>
</BODY>
</HTML>