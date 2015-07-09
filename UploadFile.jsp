<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html>
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
</head>
<BODY>
    
	<div id="wrap"> 	

        <h1 id="tableTitle" class="font my-title">Subir ficheros adjuntos</h1>
            
        <form method="post" role="form" action="/ServidorSIAR/Controller?action=upload_file" enctype="multipart/form-data"> 
        <%
		//Unha vez introducido un dato, envíase un parámetro para cerrar a ventana e recargar o listado:
		String param = request.getParameter("close");
		if(param!=null){ 
		%>
		<script> 
			 opener.location.reload();
			 window.close();
			 //pruebas(); 
		</script>
		<%}%>
        
        <input type="hidden" name="action" value="upload_file"> 
        
        <div class="form-group">
            <input type="file" name="fichero"/></br> 
        </div>
        <button type="submit" id="saveButton" class="btn btn-primary btn-sm">
         Subir fichero
        </button>
        </form>
    
    </div>  
        
</BODY>
</HTML>        

