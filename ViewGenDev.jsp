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
    <%@page import="siar.hardware.GeneralDevice" %>    
</head>
<BODY>
	<div id="wrap"> 	
        <%@ include file="Header.html" %>      <div class="container">
            <jsp:include page="Menu.jsp">
            <jsp:param name="page" value="gendevs"/>
            </jsp:include>
            <div class="col-sm-10">
 
			<%
                GeneralDevice gd = (GeneralDevice)request.getSession().getAttribute("GENDEV_SELECTED");
            %>
                <h1 id="tableTitleTabs" class="font tableHeader"> Dispositivo </h1>                   
                <table class="font table table-striped">
                 
                    <tr class="biggerTable">
                        <th colspan="1"> IP </th>
                        <td colspan="1"> <% out.println(gd.getIp()); %> </td>   
                        <th colspan="1"> MAC </th>
                        <td colspan="1"> <% out.println(gd.getMac()); %> </td>  
                    </tr>
                    <tr class="biggerTable">                        
                        <th colspan="1"> Fabricante </th>
                        <td colspan="1"> <% out.println(gd.getManufacturer()); %> </td>
                        <th colspan="1"> Descripción </th>
                        <td colspan="1"> <% out.println(gd.getDescription()); %> </td>
                    </tr>  
                    <form method="post" role="form" action="/ServidorSIAR/Controller"> 
                    <input type="hidden" name="action" value="update_device">
                    <input type="hidden" name="dev-type" value="gendev">
					<tr>
                    	<th colspan="1"> Modificar Descripción </th>
                        <td colspan="6"> 
                        <input type="text" name="description" class="form-control" id="description" value="<% out.print(gd.getDescription()); %>" </td>
                    </tr>
                    <tr>
                        <td colspan="4" id="submitTd">
                        <button type="submit" id="saveButton" class="btn btn-primary btn-sm">
                         Guardar
                        </button>
                        </td>
                    </tr>
                    </form>
                </table>

    </div>    
     </div>             
	 <%@ include file="Footer.html" %>     
     </div>
	</div>
</BODY>
</HTML>