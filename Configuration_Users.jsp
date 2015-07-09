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
	<%@page import="siar.users.User" %>
</head>
<BODY>
	<div id="wrap"> 	
	<%@ include file="Header.html" %>      
    <div class="container">
    	<% String is_admin = (String) request.getSession().getAttribute("ADMIN");
		if(is_admin.equals("true")){ %>
        	<h2 class="font my-title"> Edición de Usuarios 
            <a href="Configuration.jsp"><span class="glyphicon glyphicon-circle-arrow-left pull-right" title="Atrás"></span></a>
            </h2>
            <button type="button" class="createUser pull-right btn btn-default btn-sm">
            	<span class="glyphicon glyphicon-plus"></span> Añadir 
            </button> 
            
            <form method="post" action="/ServidorSIAR/Controller"> 
            <input type="hidden" name="action" value="update_users">
           	<table class="font replayNotification  table table-condensed my-tb-center">
            <thead>
            	<tr>
                	<th class="checkboxcolumn"> Activar/Desactivar </th>
                	<th class="tableHeader"> Nombre de usuario  </th>
                    <th> Apellidos </th>
                    <th> Nombre </th>
                    <th> Correo electrónico </th>
                </tr>
            </thead>    
			<%
            ArrayList users = (ArrayList)request.getSession().getAttribute("USERS");
            int i=0;
            while(i<users.size()){
                User u = (User)users.get(i);
            %>
            <tbody>
            	<input type="hidden" name="ids" value="<% out.print(u.getId()); %>">
            	<tr>
            	<td <% if(u.getState()==0){ %> class="danger" title="Usuario dado de baja" <%}%>><input type="checkbox" name="<% out.print(u.getId()); %>"  value="<% out.print(u.getState()); %>"></td>
                <td <% if(u.getState()==0){ %> class="danger" title="Usuario dado de baja" <%}%>><input type="text" class="font form-group my-input" name="data" id="<% out.print(u.getId()); %>"  value="<% out.print(u.getUname()); %>" />
					<% //if(et.getState()==0){ %></td>
                <td <% if(u.getState()==0){ %> class="danger" title="Usuario dado de baja" <%}%>><input type="text" class="font form-group my-input" name="surname" id="<% out.print(u.getId()); %>"  value="<% out.print(u.getSurname()); %>" /> </td>
                <td <% if(u.getState()==0){ %> class="danger" title="Usuario dado de baja" <%}%>><input type="text" class="font form-group my-input" name="name" id="<% out.print(u.getId()); %>"  value="<% out.print(u.getName()); %>" /> </td>
                <td <% if(u.getState()==0){ %> class="danger" title="Usuario dado de baja" <%}%>><input type="text" class="font form-group my-input" name="email" id="<% out.print(u.getId()); %>"  value="<% out.print(u.getEmail()); %>" /> </td>
                </tr>
            <%
                i++;
            }
            %>
     			</tr>
                <tr>
                	<td colspan="5" id="submitTd">
                    <button type="submit" id="saveButton" class="btn btn-default btn-sm">
                     Actualizar cambios
                    </button>
                    </td>
                </tr>
            </tbody>    
            </table>
            </form>
		<% }else{ %>
        	<p> El usuario que ha iniciado sesión no tiene permiso para acceder a esta sección de configuración 
            <a href="/ServidorSIAR/Main.jsp">
              <span class="glyphicon glyphicon-circle-arrow-left"></span>
            </a>
            </p>
        <% } %>
     </div>             <%@ include file="Footer.html" %>     </div>
    </div>
</BODY>
</HTML>