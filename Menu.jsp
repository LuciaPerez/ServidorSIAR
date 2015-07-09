<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es" lang="es">
<HTML>
<head>
	<meta  http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/mystyle.css" type="text/css" media="screen">
    <%@page pageEncoding="UTF-8"%>
</head>

<div id="menu" class="col-sm-2">
	<% String pageName = request.getParameter("page"); %>
    <ul class="nav nav-pills nav-stacked">
    	<li <% if(pageName.equals("news")){%>class="activeMenu" <%}%>>              
        <form method="post" action="/ServidorSIAR/Controller"> <!--?operacion=adadfasd&-->
            <input type="hidden" name="action" value="go_to_inventory">
            <input type="hidden" name="pageNumber" value="0">
            <input type="submit" class="button menuButton font" value="Escaneo de red">
        </form>
        </li>
        <li id="pcs" <% if(pageName.equals("pcs")){%>class="activeMenu" <%}%>>             
        <form method="post" action="/ServidorSIAR/Controller"> <!--?operacion=adadfasd&-->
            <input type="hidden" name="action" value="list_computers">
            <input type="hidden" name="pageNumber" value="0">
            <input type="submit" class="button menuButton font" value="PCs">
        </form>
        </li>
        <li <% if(pageName.equals("printers")){%>class="activeMenu" <%}%>>             
        <form method="post" action="/ServidorSIAR/Controller"> <!--?operacion=adadfasd&-->
            <input type="hidden" name="action" value="list_printers">
            <input type="hidden" name="pageNumber" value="0">
            <input type="submit" class="button menuButton font" value="Impresoras">
        </form>
        </li>
        <li <% if(pageName.equals("gendevs")){%>class="activeMenu" <%}%>>             
        <form method="post" action="/ServidorSIAR/Controller"> <!--?operacion=adadfasd&-->
            <input type="hidden" name="action" value="list_generaldevices">
            <input type="hidden" name="pageNumber" value="0">
            <input type="submit" class="button menuButton font" value="Otros dispositivos">
        </form>
        </li>
        <li <% if(pageName.equals("listips")){%>class="activeMenu" <%}%>>             
        <form method="post" action="/ServidorSIAR/Controller"> <!--?operacion=adadfasd&-->
            <input type="hidden" name="action" value="list_ips">
            <input type="hidden" name="pageNumber" value="0">
            <input type="submit" class="button menuButton font" value="Listar IPs">
        </form>
        </li>
        <li <% if(pageName.equals("listdowndevices")){%>class="activeMenu" <%}%>>             
        <form method="post" action="/ServidorSIAR/Controller"> <!--?operacion=adadfasd&-->
            <input type="hidden" name="action" value="list_down_devices">
            <input type="hidden" name="pageNumber" value="0">
            <input type="submit" class="button menuButton font" value="Eliminar dispositivos">
        </form>
        </li>
        
        <li class="myDivider"></li>
        
        
        
        <%/* ************** FILTRO ******************** */%>
        <% String state = (String) request.getSession().getAttribute("filter_state"); %>
        <% String location = (String) request.getSession().getAttribute("filter_location"); %>
        <% String type = (String)request.getSession().getAttribute("filter_type"); %>
        
        <form method="post" role="form" id="menufilter" action="/ServidorSIAR/Controller"> 
        <input type="hidden" name="action" value="search_devices">
        <input type="hidden" name="pageNumber" value="0">
        <div class="form-group">
        <label>Filtrar listado </label>
        <li>
            <jsp:include page="SelectLocationFullPath.jsp">
            <jsp:param name="selected" value="" /> 
            <jsp:param name="state" value="" />
            </jsp:include> 
        </li>
        </div>
        <div class="form-group">
        <li>
          <select name="devtype" class="form-control" onchange="this.form.submit()">
            <option value="">Tipo...</option>
            <option value="pc" <%if(type!=null && type.equals("pc")){%> selected <%}%>>Ordenadores</option>
            <option value="printer" <%if(type!=null && type.equals("printer")){%> selected <%}%>>Impresoras</option>
            <option value="gendev" <%if(type!=null && type.equals("gendev")){%> selected <%}%>>Otros dispositivos</option>
          </select>
        </li>
        </div>
        <div class="form-group">
        <li>
          <select name="ipstate" class="form-control" onchange="this.form.submit()">
            <option value="">Estado de IPs...</option>
            <option value="up" <%if(state!=null && state.equals("up")){%> selected <%}%>>Ips Ocupadas</option>
            <option value="down" <%if(state!=null && state.equals("down")){%> selected<%}%>>Ips libres</option>
          </select>
        </li>
        </div>
        </form>
        
        <form method="post" class="form-horizontal" action="/ServidorSIAR/Controller"> 
        <input type="hidden" name="action" value="list_ips">
        <input type="hidden" name="pageNumber" value="0">
        <input type="submit" class="button menuButton font" value="Reiniciar filtro">
        </form>
    </ul>
</div>