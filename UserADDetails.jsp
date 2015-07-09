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
        <form method="post" action="/ServidorSIAR/Controller"> 
            <input type="hidden" name="action" value="list_usersAD">
                <input type="hidden" name="pageNumber" value="<% out.print(request.getSession().getAttribute("PAGE_NUMBER")); %>">
            <button type="submit" class="pull-right btn btn-default btn-sm">
              <i class="glyphicon glyphicon-circle-arrow-left"></i> Volver al listado
            </button>
        </form>
        <jsp:include page="TabsUserAD.jsp">
        <jsp:param name="tab" value="useraddetails"/>
        </jsp:include> 
		<%
            UserAD a = (UserAD)request.getSession().getAttribute("USERAD_SELECTED");  
        %>
        
            <h1 id="tableTitleTabs" class="font my-title"> Información detallada del usuario </h1>                   
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
                    <th> E-mail empresa </th>
                    <td colspan="1"> <% out.println(a.getEmail().replaceAll(";","\r\n")); %> </td>   
                    <th colspan="1"> E-mail marca </th>
                    <td colspan="1"> <%  if(!a.getEmailMarca().equals("null")){ out.println(a.getEmailMarca().replaceAll(";","\r\n")); } %> </td>
                </tr>       
                
      			<tr>
                <td colspan="4" id="submitTd">           
                 <form method="post" action="/ServidorSIAR/Controller"> <!--?operacion=adadfasd&-->
                    <input type="hidden" name="action" value="edit_userAD">
                    <button type="submit" id="saveButton" class="btn btn-primary btn-sm">
                     Editar
                    </button>
                </form>
                </td>
                </tr>
            </table>

  
   
    </div>    
    <%@ include file="Footer.html" %> 
	</div>
</BODY>
</HTML>