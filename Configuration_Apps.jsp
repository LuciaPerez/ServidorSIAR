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
    <%@page import="siar.activedirectory.application.Application" %>
</head>
<BODY>
	<div id="wrap"> 	
	<%@ include file="Header.html" %>      
    <div class="container">

        	<h2 class="font my-title"> Edición de Aplicaciones de Usuario 
            <a href="Configuration.jsp"><span class="glyphicon glyphicon-circle-arrow-left pull-right" title="Atrás"></span></a>
            </h2>
            <button type="button" class="createApp pull-right btn btn-default btn-sm">
                <span class="glyphicon glyphicon-plus"></span> Añadir 
            </button> 
            
            <form method="post" role="form" action="/ServidorSIAR/Controller">
            <input type="hidden" name="action" value="update_apps">
           	<table class="font replayNotification table table-condensed my-tb-center">
            	<tr>
                	<td class="checkboxcolumn"> Activar/Desactivar </td>
                	<td class="tableHeader"> Modificar dato  </td>
                </tr>
                
			<%
            ArrayList apps = (ArrayList)request.getSession().getAttribute("APPS");
            int i=0;
            while(i<apps.size()){
                Application ap = (Application)apps.get(i);
            %>
            	<input type="hidden" name="ids" value="<% out.print(ap.getId()); %>">
            	<tr>
            	<td <% if(ap.getState()==0){ %> class="danger" title="Elemento deshabilitado" <%}%>><input type="checkbox" name="<% out.print(ap.getId()); %>"  value="<% out.print(ap.getState()); %>"></td>
                <td <% if(ap.getState()==0){ %> class="danger" title="Elemento deshabilitado" <%}%>><input type="text" class="font form-group my-input" name="data" id="<% out.println(ap.getId()); %>"  value="<% out.println(ap.getName()); %>" />
				</td>
                </tr>
            <%
                i++;
            }
            %>
     			</tr>
                <tr>
                	<td colspan="2" id="submitTd">
                    <button type="submit" id="saveButton" class="btn btn-default btn-sm">
                     Actualizar cambioss
                    </button>
                    </td>
                </tr>
            </table>
            </form>

     </div>             <%@ include file="Footer.html" %>     </div>
    </div>
</BODY>
</HTML>