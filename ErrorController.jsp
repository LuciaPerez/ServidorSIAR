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
</head>
<BODY>
    <div id="wrap"> 	
        <%@ include file="Header.html" %>      <div class="container"> 
        <p> <% out.print(request.getParameter("message")); %> <a href="javascript:history.back()"> <span class="pull-right glyphicon glyphicon-circle-arrow-left" title="Atrás"></span> </a></p>
         </div>             <%@ include file="Footer.html" %>     </div>
    </div>

</BODY>
</HTML>