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
        	<h1 class="font my-title"> Edición de Localizaciones <a href="Configuration.jsp"><span class="pull-right glyphicon glyphicon-circle-arrow-left" title="Atrás"></span> </a></h1>
            <button type="button" class="createLocation pull-right btn btn-default btn-sm">
            	<span class="glyphicon glyphicon-plus"></span> Añadir 
            </button>
            
            <form method="post" role="form" action="/ServidorSIAR/Controller"> 
            <input type="hidden" name="action" value="update_locations">
           	<table class="font replayNotification  table table-condensed my-tb-center">
            <thead>
            	<tr>
                	<th class="checkboxcolumn"> Activar/Desactivar </th>
                	<th class="tableHeader"> Modificar dato </th>
                	<th class="fullpathcolumn"> Ruta completa </th>
                	<th class="tableHeader"> Red a la que pertenece </th>
                	<th class="tableHeader"> Máscara </th>
                	<th class="tableHeader"> Patrón de nombrado de dispositivos </th>
                </tr>
            </thead>    
			<%
            ArrayList locations = (ArrayList)request.getSession().getAttribute("LOCATIONS");
            int i=0;
            while(i<locations.size()){
                EventLocation el = (EventLocation)locations.get(i);
            %>
            <tbody>
            	<input type="hidden" name="ids" value="<% out.print(el.getId()); %>">
            	<tr>
            	<td <% if(el.getState()==0){ %> class="danger" title="Elemento deshabilitado" <%}%>>
                <input type="checkbox" name="<% out.print(el.getId()); %>"  value="<% out.print(el.getState()); %>">
                </td>
                <td <% if(el.getState()==0){ %> class="danger" title="Elemento deshabilitado" <%}%>>
                <input type="text" class="font form-group my-input" name="data" id="<% out.print(el.getId()); %>"  value="<% out.print(el.getName()); %>" />
				</td>
                <td <% if(el.getState()==0){ %> class="danger" title="Elemento deshabilitado" <%}%>>
                <input type="text" name="fullPath" id="<% out.print(el.getState()); %>" class="form-group my-input" value="<% out.print(el.getFullPath()); %>" readOnly="true" />
                </td>
                <td <% if(el.getState()==0){ %> class="danger" title="Elemento deshabilitado" <%}%>>
                <input type="text" name="network" id="<% out.print(el.getState()); %>" class="form-group my-input" value="<% out.print(el.getNetwork()); %>"  />
                </td>
                <td <% if(el.getState()==0){ %> class="danger" title="Elemento deshabilitado" <%}%>>
                <input type="text" name="mask" id="<% out.print(el.getState()); %>" class="form-group my-input" value="<% out.print(el.getMask()); %>"  />
                </td>
                <td <% if(el.getState()==0){ %> class="danger" title="Elemento deshabilitado" <%}%>>
                <input type="text" name="pattern" id="<% out.print(el.getState()); %>" class="form-group my-input" value="<% out.print(el.getDevPattern()); %>"  />
                </td>
                </tr>
            <%
                i++;
            }
            %>
     			</tr>
                <tr>
                    <td colspan="6" id="submitTd">
                    <button type="submit" id="saveButton" class="btn btn-primary btn-sm">
                     Actualizar cambios
                    </button>
                    </td>
                </tr>
            </tbody>
            </table>
            </form>
            
       
     </div>             
	 <%@ include file="Footer.html" %>     
     </div>
    </div>
</BODY>
</HTML>