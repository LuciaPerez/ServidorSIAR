<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es" lang="es">
<HTML>
<head>
	<meta  http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
    <%@page pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList" %>
    <%@page import="siar.activedirectory.UserAD" %>
    <%@page import="siar.notification.type.EventType" %>
    <%@page import="siar.notification.location.EventLocation" %>
    <%@page import="siar.notification.category.EventCategory" %>
</head>

<div id="menu">
    <p> Incidencias/Peticiones </p>  
    <ul class="fontMenu">
    	<li class="menuItems"><a href="/ServidorSIAR/Main.jsp">Menú principal</a></li>
		<li class="menuItems">Autores</li>
        <ul>
        <%
            ArrayList authors = (ArrayList)request.getSession().getAttribute("AUTHORS");
            int index=0;
            while(index<authors.size()){
                UserAD a = (UserAD)authors.get(index);
            %>
                <li value="<% out.print(Integer.toString(a.getId())); %>"><% out.print(a.getName()); %></li>
            <%
                index++;
            }
        %>
        </ul>
		<li class="menuItems">Localizaciones</li>
        <ul>
        <%
            ArrayList locations = (ArrayList)request.getSession().getAttribute("LOCATIONS");
            index=0;
            while(index<locations.size()){
                EventLocation l = (EventLocation)locations.get(index);
            %>
                <li value="<% out.print(Integer.toString(l.getId())); %>"><% out.print(l.getName()); %></li>
            <%
                index++;
            }
        %>
        </ul>
		<li class="menuItems">Estado</li>
        <ul>
        	<li>Nueva</li>
            <li>En curso</li>
            <li>Cerrada</li>	
        </ul>
		<li class="menuItems">Categorías</li>
        <ul>
        <%
            ArrayList categories = (ArrayList)request.getSession().getAttribute("CATEGORIES");
            index=0;
            while(index<categories.size()){
                EventCategory c = (EventCategory)categories.get(index);
            %>
                <li value="<% out.print(Integer.toString(c.getIdComputer())); %>"><% out.print(c.getName()); %></li>
            <%
                index++;
            }
        %>
        </ul>        
		<li class="menuItems">Tipos</li>
        <ul>
        <%
            ArrayList types = (ArrayList)request.getSession().getAttribute("TYPES");
            index=0;
            while(index<types.size()){
                EventType t = (EventType)types.get(index);
            %>
                <li value="<% out.print(Integer.toString(t.getId())); %>"><% out.print(t.getType()); %></li>
            <%
                index++;
            }
        %>
        </ul> 
    </ul>
</div>