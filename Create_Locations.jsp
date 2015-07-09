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
</head>
<BODY>
	<div class="container popup">
    	<h2 class="font my-title"> Insertar una nueva localización </h2>
        <form method="post" role="form" action="/ServidorSIAR/Controller"> <!--http://michelletorres.mx/listas-desplegables-en-los-formularios-html/#.VP7QvvmG-4Y-->
        <input type="hidden" name="action" value="register_location">
        <div class="form-group">
            <label>Insertar Localización:</label>
            <input type="text" class="form-control" name="location" />
        </div>
        <div class="form-group">
            <label> Nodo padre: </label>
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
            %>
            
            <select name="father" class="select form-control">
            <%
            // Menú desplegable para ver as localizacións que hai actualmente introducidos 
            ArrayList locations = (ArrayList)request.getSession().getAttribute("LOCATIONS");
            String oldFullPath = "--Sin padre--";
            int i=0;
            while(i<locations.size()){
                EventLocation el = (EventLocation)locations.get(i);
                if(el.getState()==1){
                    if(el.getFullPath().contains(oldFullPath)){
                    %>
                      <option value="<% out.print(el.getFullPath()); %>"><% out.print(el.getFullPath()); %> </option>
                    <%
                    }else{
                        oldFullPath=el.getFullPath();
                    %>
                      </optgroup>
                      <optgroup label="<% out.print(oldFullPath); %>">
                      <option value="<% out.print(el.getFullPath()); %>"><% out.print(el.getFullPath()); %> </option>
                      
                    <%		
                    }
                }
                
                i++;
            }
            %>
             <optgroup label="--Sin padre">	
                <option value=""> --Sin padre-- </option>
             </optgroup>
        </select> 
		</div>
        <div class="form-group">
            <label>Red a la que pertenece:</label>
            <input type="text" name="network" class="form-control"/>
        </div>
        <div class="form-group">
            <label> Máscara de red: </label>
            <input type="text" name="mask" class="form-control"/>
        </div>
        <div class="form-group">
            <label> Patrón del nombre de los dispositivos: </label>
            <input type="text" name="devName" class="form-control"/>
        </div>
        <button type="submit" id="closeReload" class="btn btn-default pull-right">Guardar</button>
        </form>
    </div>
</BODY>
</HTML>