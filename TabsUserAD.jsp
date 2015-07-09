<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es" lang="es">
<HTML>
<head>
	<meta  http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
    <%@page pageEncoding="UTF-8"%>
</head>

<ul class="nav nav-tabs">
	<% String tabName = request.getParameter("tab"); %>
	<li  <% if(tabName.equals("useraddetails")){%>class="activeTab" <%}%>>
    <form method="post" action="/ServidorSIAR/Controller">
        <input type="hidden" name="action" value="userad_details">
        <input type="submit" id="tab1" class="tabs" value="Información usuario">
    </form>
    </li>

    <li <% if(tabName.equals("listapps")){%>class="activeTab" <%}%>>
    <form method="post" action="/ServidorSIAR/Controller"> 
        <input type="hidden" name="action" value="list_apps_user">
        <input type="submit" id="tab4" class="tabs tabSelected" value="Aplicaciones usuario">  
    </form>     
    </li>
    </ul>
      
