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
	<%@page import="siar.users.User" %>
    <%@page import="java.util.ArrayList" %>
    <%@page import="siar.hardware.Computer" %>    
    <%@page import="siar.activedirectory.UserAD" %>
</head>
<BODY>
    <div id="wrap"> 	
	
        <%@ include file="Header.html" %>      
        <div class="container">
        <a href="javascript:history.back()"> <span class="pull-right glyphicon glyphicon-circle-arrow-left" title="Atrás" title="Atrás"></span> </a>
		<%
            UserAD a = (UserAD)request.getSession().getAttribute("USERAD_SELECTED");  
        %>
        <h3> Datos de conexión al Active Directory </h3>    
           <form method="post" class="form-horizontal" action="/ServidorSIAR/Controller"> 
            <input type="hidden" name="action" value="reset_pwd_userAD">
            <input type="hidden" name="cn" value="<% out.println(a.getCn()); %>">
            <input type="hidden" name="idUserAD" value="<%out.print(Integer.toString(a.getId()));%>">
            <div class="form-group">
              <label class="control-label col-sm-2" for="">Servidor:</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" name="server" placeholder="Insertar servidor">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="">Usuario:</label>
              <div class="col-sm-10">          
                <input type="text" class="form-control"name="user" placeholder="Insertar usuario">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="">Dominio:</label>
              <div class="col-sm-10">
                <input type="text" class="form-control"  name="domain" placeholder="Insertar dominio">
              </div>
            </div>
            <div class="form-group">
              <label class="control-label col-sm-2" for="">Contraseña:</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" name="pwd" placeholder="Insertar contraseña">
              </div>
            </div>
            
            <h3> Restauración de contraseña </h3>  
            <div class="form-group">
              <label class="control-label col-sm-2" for="">Contraseña nueva:</label>
              <div class="col-sm-10">
                <input type="text" class="font tableHeader" class="form-control" name="newpassword" placeholder="<% if(!a.getResetpwd().equals("null")){out.println(a.getResetpwd()); }%>" } />
              </div>
            </div>
            
            <div class="form-group">
              <label class="control-label col-sm-2" for="">Puerto SSL:</label>
              <div class="col-sm-10">
                <input type="text" class="font tableHeader" class="form-control" name="portssl" placeholder="Típicamente 636" />
              </div>
            </div>            
            
            <div class="form-group">
              <label class="control-label col-sm-2" for="">Distinguished Name:</label>
              <div class="col-sm-10">
                <p> <% out.println(a.getCn()); %> </p>
              </div>
            </div>
            <div class="form-group">        
              <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="pull-right btn btn-primary btn-sm">
                  Actualizar
                </button>
              </div>
            </div>
    	</form>
    </div>

</BODY>
</HTML>