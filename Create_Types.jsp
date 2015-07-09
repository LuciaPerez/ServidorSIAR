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
    	<h2 class="font my-title"> Insertar un tipo nuevo </h2>
        <form method="post" role="form" action="/ServidorSIAR/Controller"> 
        <input type="hidden" name="action" value="register_type">
        
        <div class="form-group">
            <label> Insertar Tipo: </label> 
            <input type="text" class="form-control" name="type" />
        </div>
        <div class="form-group">
            <label> Tipos existentes: </label>
            <select name="type" class="select form-control">
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
                // Menú desplegable para ver os tipos que hai actualmente introducidos 
                ArrayList types = (ArrayList)request.getSession().getAttribute("TYPES");
                int i=0;
                while(i<types.size()){
                    EventType et = (EventType)types.get(i);
                    if(et.getState()==1){
                %>
                  <option value="<% out.print(et.getId()); %>" disabled="disabled"><% out.print(et.getType()); %></option>
                <%
                    }
                    i++;
                }
                %>
            </select>
            </div>
            <button type="submit" id="closeReload" class="btn btn-default pull-right">Guardar</button>
          
        </form>
    </div>
</BODY>
</HTML>