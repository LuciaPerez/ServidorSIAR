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
    <%@page import="siar.hardware.Computer" %>    
    <%@page import="siar.activedirectory.UserAD" %>
    <%@page import="siar.users.User" %>   
</head>
<BODY>
	<div id="wrap">
	
        <%@ include file="Header.html" %>      
        <div class="container">
        <a href="javascript:history.back()"> <span class="pull-right glyphicon glyphicon-circle-arrow-left" title="Atrás" title="Atrás"></span> </a>
		<%
            UserAD a = (UserAD)request.getSession().getAttribute("USERAD_SELECTED");  
        %>
        <a href="/ServidorSIAR/ResetPwdAD.jsp" class="btn btn-warning btn-sm">
          Restaurar contraseña
        </a>
        <h1 id="tableTitleTabs" class="font my-title"> Edición dos datos do usuario </h1>                   	
        <form method="post" role="form" action="/ServidorSIAR/Controller"> 
        <input type="hidden" name="action" value="save_changes_userAD">
        <input type="hidden" name="idUserAD" value="<%out.print(Integer.toString(a.getId()));%>">
            <table class="font table table-striped">
                <tr>
                    <th> Nombre de Usuario </th>
                    <td colspan="1"> <% out.println(a.getUserName()); %> </td>   
                    <th colspan="1"> Nombre completo </th>
                    <td colspan="1"> <% out.println(a.getName()); %> </td>
                </tr> 
                
                 <tr class="biggerTable">
                    <th> Descripción </th>
                    <td colspan="1"> <% out.println(a.getDescription()); %> </td>   
                    <th colspan="1"> Último acceso </th>
                    <td colspan="1"> <% out.println(a.getLastlogon()); %> </td>
                </tr>   
                
                 <tr class="biggerTable">
                    <th colspan="1"> E-mail empresa </th>
                    <td colspan="1">
                     <% out.println(a.getEmail().replaceAll(";","\r\n")); %> 
                     </td>   
                    <th colspan="1"> E-mail marca </th>
                    <td colspan="1"> 
                    <input type="text" class="font tableHeader form-control inputad" name="emailMarca" value="<% if(!a.getEmailMarca().equals("null")){ out.println(a.getEmailMarca()); }%>" /> <p class="instruction"> Introduzca los e-mails separados por ';' </p> 
                    </td>
                </tr>  
                
                 <tr class="biggerTable">
                    <th colspan="1"> Estado </th>
                    <td colspan="3"> <% out.println(a.getState()); %> </td>  
                 </tr>   
                <tr>
                    <td id="submitTd" colspan="6">
                        <button type="submit" id="saveButton" class="btn btn-primary btn-sm">
                         Guardar
                        </button>
                    </td>
                </tr> 
            </table>
            </form>
 
    </div>    
    <%@ include file="Footer.html" %>
	</div>
</BODY>
</HTML>