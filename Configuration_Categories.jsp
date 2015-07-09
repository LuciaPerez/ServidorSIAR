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
	<div id="wrap"> 	
	<%@ include file="Header.html" %>      
    <div class="container">
        <h1 class="font my-title"> Edición de Categorías 
        <a href="Configuration.jsp"><span class="pull-right glyphicon glyphicon-circle-arrow-left" title="Atrás"></span> </a>
        </h1>
        <button type="button" title="Añadir categoría" class="createCategory pull-right btn btn-default btn-sm">
            <span class="glyphicon glyphicon-plus"></span> Añadir 
        </button> 

        <form method="post" action="/ServidorSIAR/Controller"> 
        <input type="hidden" name="action" value="update_categories">
        <table class="font replayNotification table table-condensed my-tb-center">
            <tr>
                <td class="checkboxcolumn"> Activar/Desactivar </td>
                <td class="tableHeader"> Modificar dato </td>
                <td class="tableHeader"> Ruta completa </td>
            </tr>
            
        <%
        ArrayList categories = (ArrayList)request.getSession().getAttribute("CATEGORIES");
        int i=0;
        while(i<categories.size()){
            EventCategory ec = (EventCategory)categories.get(i);
        %>
            <input type="hidden" name="ids" value="<% out.print(ec.getId()); %>">
            <tr>
            <td <% if(ec.getState()==0){ %> class="danger" title="Elemento deshabilitado" <%}%>>
                <input type="checkbox" name="<% out.print(ec.getId()); %>"  value="<% out.print(ec.getState()); %>">
            </td>
            <td <% if(ec.getState()==0){ %> class="danger" title="Elemento deshabilitado" <%}%>>
                <input type="text" class="font form-group my-input" name="data" id="<% out.print(ec.getId()); %>"  value="<% out.print(ec.getName()); %>" />
            </td>
            <td <% if(ec.getState()==0){ %> class="danger" title="Elemento deshabilitado" <%}%>>
                <input type="text" name="fullPath"  id="<% out.print(ec.getState()); %>" class="form-group my-input"  value="<% out.print(ec.getFullPath()); %>" readOnly="true"/>
            </td>
            </tr>
        <%
            i++;
        }
        %>
            </tr>
            <tr>
                <td colspan="3" id="submitTd">
                <button type="submit" id="saveButton" class="btn btn-primary btn-sm">
                 Actualizar cambios
                </button>
                </td>
            </tr>
        </table>
        </form>

     </div>             
	 <%@ include file="Footer.html" %>     
     </div>
    </div>
</BODY>
</HTML>