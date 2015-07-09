<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html>
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
    <%@page import="siar.activedirectory.UserAD" %>
    <%@page import="siar.notification.Event" %>   
    <%@page import="siar.notification.type.EventType" %>
    <%@page import="siar.notification.location.EventLocation" %>
    <%@page import="siar.notification.category.EventCategory" %>
    <%@page import="siar.notification.Answer" %>    
    <%@page import="siar.users.User" %>   
</head>
<BODY>
	<div id="wrap"> 	
    	<h2 class="font my-title">Configuración de filtro de búsqueda</h2>
        <form method="post" action="/ServidorSIAR/Controller"> 
        <input type="hidden" name="action" value="search_notifications">
        <input type="hidden" name="pageNumber" value="0">
            
            <div class="form-group">
              <label class="control-label col-sm-2"> Tipos: </label>
              <div class="col-sm-10">
                <select name="type" class="form-control" id="type">
                    <option value=""></option>
                    <%
                    //Unha vez realizada a búsqueda, envíase un parámetro para cerrar a ventana e recargar o listado:
                    String param = request.getParameter("close");
                    if(param!=null){ 
                    %>
                    <script> 
                         //opener.location.reload();
                         opener.location = "ListFilteredNotifications.jsp";
                         window.close();
                         //pruebas(); 
                    </script>
                    <%
                    }
                    ArrayList types = (ArrayList)request.getSession().getAttribute("TYPES");
                    int i=0;
                    while(i<types.size()){
                        EventType et = (EventType)types.get(i);
                        if(et.getState()==1){
                    %>
                      <option value="<% out.print(et.getId()); %>"><% out.print(et.getType()); %></option>
                    <%
                        }
                        i++;
                    }
                    %>
                </select>
                </div>
            </div>
            <div class="form-group">
            <label class="control-label col-sm-2"> Localizaciones: </label>
            <div class="col-sm-10">
            <%
			ArrayList locations = (ArrayList)request.getSession().getAttribute("LOCATIONS");
			String selected = (String) request.getSession().getAttribute("filter_location");
			String state = (String) request.getParameter("state");
			String oldFullPath = "--Sin padre--";
			int selIndex=0;
			%>
            
            <select name="location" class="form-control">
            <option value=""></option>
            <%
            while(selIndex<locations.size()){
                EventLocation el = (EventLocation)locations.get(selIndex);
                if(el.getState()==1){
                    if(el.getFullPath().contains(oldFullPath)){
                    %>
                      <option value="<% out.print(el.getFullPath()); %>" <% if(selected!=null && el.getFullPath().equals(selected)){%>selected<%}%>><% out.print(el.getFullPath()); %> </option>
                    <%
                    }else{
                        oldFullPath=el.getFullPath();
                    %>
                      </optgroup>
                      <optgroup label="<% out.print(oldFullPath); %>">
                      <option value="<% out.print(el.getFullPath()); %>" <% if(selected!=null && el.getFullPath().equals(selected)){%>selected<%}%>><% out.print(el.getFullPath()); %> </option>
                      
                    <%		
                    }
                }
                
                selIndex++;
            }
            %>
             <optgroup label="Sin padre">	
                <option value=""> --Sin padre--</option>
             </optgroup>
            </select> 
            </div>
            </div>
            <%
			%>
            <div class="form-group">
            <label class="control-label col-sm-2"> Categorías: </label>
            <div class="col-sm-10">
            <select name="category" class="searchData select form-control">
            	<option value=""></option>
                <%
                ArrayList categories = (ArrayList)request.getSession().getAttribute("CATEGORIES");
                i=0;
                while(i<categories.size()){
                    EventCategory ec = (EventCategory)categories.get(i);
                    if(ec.getState()==1){
                %>
                  <option value="<% out.print(ec.getFullPath()); %>"><% out.print(ec.getFullPath()); %></option>
                <%
                    }
                    i++;
                }
                %>
            </select>
            </div>
            </div>
            <div class="form-group">
            <label class="control-label col-sm-2"> Usuario Active Directory: </label>
            <div class="col-sm-10">
            <select name="userAD" class="searchData select form-control" >
                <option value=""></option>
				<%
                ArrayList authors = (ArrayList)request.getSession().getAttribute("AUTHORS");
                i=0;
                while(i<authors.size()){
                    UserAD a = (UserAD)authors.get(i);
                %>
                    <option value="<% out.print(Integer.toString(a.getId())); %>"><% out.print(a.getName()); %></option>
                <%
                    i++;
                }
                %>
            </select>
            </div>
            </div>
            <div class="form-group">
            <label class="control-label col-sm-2"> Estado: </label>
            <div class="col-sm-10">
            <select name="state" class="searchData select form-control">
            	<option value=""></option>
				<option value="nueva">Nueva</option>
				<option value="en curso">En curso</option>
				<option value="cerrada">Cerrada</option>
            </select>
            </div>
            </div>
            <div class="form-group">
            <label class="control-label col-sm-2"> Título,descripción o respuestas contengan la palabra: </label>
            <div class="col-sm-10">
            <input type="text" class="searchData form-control" name="title" />
            </div>
            </div>
            <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="pull-right search btn btn-default btn-sm">
            	<span class="glyphicon glyphicon-search"></span> Buscar 
            </button>
            </div>
            </div>
            <!--<div class="divSubmit"><input class="searchName" type="submit" id="closeReload" value="Buscar"></div>-->
        </form>    
    </div>
    </div>
</BODY>
</HTML>