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
	<div class="container"> 	
		<h2 class="font my-title"> Insertar una categoría nueva </h2>
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
        ArrayList categories = (ArrayList)request.getSession().getAttribute("CATEGORIES");
        String selectedCat = (String) request.getParameter("selected");
        String state = (String) request.getParameter("state");
        String oldFullPathCat = "--Sin padre--";
        int selIndexCat=0;
        %>
        <form method="post" role="form" action="/ServidorSIAR/Controller"> 
        <input type="hidden" name="action" value="register_category">
        <div class="form-group">
            <label> Insertar Categoría: </label>
            <input type="text" name="category" class="form-control" />
        </div>
        <div class="form-group">
            <label> Nodo padre: </label>

            <select name="father" class="form-control">
            <%
            while(selIndexCat < categories.size()){
                EventCategory ec = (EventCategory)categories.get(selIndexCat);
                if(ec.getState()==1){
                    if(ec.getFullPath().contains(oldFullPathCat)){
                    %>
                      <option value="<% out.print(ec.getFullPath()); %>" <% if(ec.getFullPath().equals(selectedCat)){%>selected<%}%>><% out.print(ec.getFullPath()); %> </option>
                    <%
                    }else{
                        oldFullPathCat=ec.getFullPath();
                    %>
                      </optgroup>
                      <optgroup label="<% out.print(oldFullPathCat); %>">
                      <option value="<% out.print(ec.getFullPath()); %>" <% if(ec.getFullPath().equals(selectedCat)){%>selected<%}%>><% out.print(ec.getFullPath()); %> </option>
                      
                    <%		
                    }
                }
                
                selIndexCat++;
            }
            %>
             <optgroup label="Sin padre">	
                <option value=""> --Sin padre--</option>
             </optgroup>
            </select> 
        </div>
        <button type="submit" id="closeReload" class="btn btn-default pull-right">Guardar</button>
        </form> 

    </div>
</BODY>
</HTML>