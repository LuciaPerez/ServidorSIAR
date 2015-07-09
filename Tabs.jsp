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
	<li  <% if(tabName.equals("pcdetails")){%>class="activeTab" <%}%>>
    <form method="post" action="/ServidorSIAR/Controller">
        <input type="hidden" name="action" value="computer_details">
        <input type="hidden" name="idPc" value="<%out.print((String)request.getSession().getAttribute("IDPC"));%>">
        <input type="submit" id="tab1" class="tabs" value="Detalles PC">
    </form>
    </li>
    <li <% if(tabName.equals("listsoftware")){%>class="activeTab" <%}%>>
    <form method="post" action="/ServidorSIAR/Controller">
        <input type="hidden" name="action" value="list_software">
        <input type="hidden" name="pageNumber" value="0">
        <input type="hidden" name="idPc" value="<%out.print((String)request.getSession().getAttribute("IDPC"));%>">
        <input type="submit" id="tab2" class="tabs" value="Software instalado">
    </form>
    </li>

    <li <% if(tabName.equals("listinstalledprinters")){%>class="activeTab" <%}%>>
    <form method="post" action="/ServidorSIAR/Controller"> 
        <input type="hidden" name="action" value="list_installedprinters">
        <input type="hidden" name="idPc" value="<%out.print((String)request.getSession().getAttribute("IDPC"));%>">
        <input type="submit" id="tab4" class="tabs tabSelected" value="Impresoras instaladas">  
    </form>     
    </li>
    </ul>
      
