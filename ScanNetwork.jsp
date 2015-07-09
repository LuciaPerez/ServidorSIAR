
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
    <%@page import="java.util.HashMap" %>
    <%@page import="siar.activedirectory.UserAD" %>
    <%@page import="siar.hardware.Computer" %>
</head>
<BODY>
	<div id="wrap"> 	
		<%@ include file="Header.html" %>      
        <div class="container">

        <jsp:include page="Menu.jsp">
        <jsp:param name="page" value="news"/>
        </jsp:include>
        <div class="col-sm-10">
            <h1 id="tableTitle" class="font my-title">Escanear red</h1>
            <form method="post" action="/ServidorSIAR/Controller" id="my-scan-form"> 
            <div class="form-group">
            	<input type="radio" name="scan" value="all" /> Escanear toda la red
                Indica la red: <input type="text" name="ipInterval" id="network" value="" placeholder="1xx.xx.xx.xx/mask" disabled>
            </div>
            <div class="form-group"> 
            	<input type="radio" name="scan" value="notAll" /> Por rango
                Intervalo de IPs: <input type="text" name="ipInterval" id="rangeips" value="" placeholder="1xx.xx.xx.aa-bb" disabled> 
            </div>
                <input type="hidden" name="action" value="scan_network">
                <input type="submit" class="btn btn-primary btn-sm" id="scanbutton" value="Escanear la red" disabled>
            </form>
			
            <% 
				ArrayList alertSpace = (ArrayList)request.getSession().getAttribute("ALERTS-FREESPACE");
				int i=0;
				if(alertSpace.size()!=0){
			%>
            	<h2 class="font"><span class="glyphicon glyphicon-warning-sign"></span> Alertas por espacio en disco </h2>
            	<table class="font table table-striped">
                <thead>
                 <tr> 
                    <th> Unidad </th>
                    <th> Espacio total </th>       
                    <th> Espacio libre </th>
                    <th> Nombre del host </th>
                    <th> IP </th>
                    <th> Localización </th>
                </tr>
                </thead>
                <tbody>
            <%		
					while(i<alertSpace.size()){
						HashMap alert = (HashMap)alertSpace.get(i);
			%>
            	<tr class="clickableRow"  title="Ver detalles">
                <form method="post" name="<% out.print(alert.get("IDCOMPUTER")); %>" action="/ServidorSIAR/Controller">
                <input type="hidden" name="action" value="computer_details">
                <input type="hidden" name="idPc" value="<%out.print(alert.get("IDCOMPUTER"));%>">
                <input type="hidden" name="idDevice" value="<%out.print(alert.get("IDDEVICE"));%>">
                	<td class="<%out.print(alert.get("IDCOMPUTER"));%>"> <%out.print(alert.get("ROOT"));%> </td>
                	<td class="<%out.print(alert.get("IDCOMPUTER"));%>"> <%out.print(alert.get("TOTALSPACE")+" GB");%> </td>
                	<td class="<%out.print(alert.get("IDCOMPUTER")+" text-danger");%>"> <%out.print(alert.get("FREESPACE")+" GB");%> </td>
                	<td class="<%out.print(alert.get("IDCOMPUTER"));%>"> <%out.print(alert.get("HOSTNAME"));%> </td>
                	<td class="<%out.print(alert.get("IDCOMPUTER"));%>"> <%out.print(alert.get("IP"));%> </td>
                	<td class="<%out.print(alert.get("IDCOMPUTER"));%>"> <%out.print(alert.get("LOCATION"));%> </td>
             	</form>
                </tr>
            			
            <%	
						i++;
					}
				}
			%>
            	</tbody>
                </table>
        </div>
    </div>
    <%@ include file="Footer.html" %>     
    </div>
</BODY>
</HTML>