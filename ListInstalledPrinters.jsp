
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
    <%@page import="siar.hardware.InstalledPrinter" %>
</head>
<BODY>
	<div id="wrap"> 	
		<%@ include file="Header.html" %>      <div class="container">
        
            <jsp:include page="Menu.jsp">
            <jsp:param name="page" value="pcs"/>
            </jsp:include>
              <div class="col-sm-10">
                <jsp:include page="Tabs.jsp">
                <jsp:param name="tab" value="listinstalledprinters"/>
                </jsp:include>  
                <h1 id="tableTitle" class="my-title font">Listado de impresoras instaladas</h1>
                
                <table class="font table table-striped">
                  <tbody>     
				<% 
                    ArrayList ln = (ArrayList)request.getSession().getAttribute("LIST_INSTALLEDPRINTERS");
					String type="";
                    int i=0;
                    int len=ln.size();
                    while(i<len){
                        InstalledPrinter ipr = (InstalledPrinter)ln.get(i);
                        if(!type.equals(ipr.getType())){
                            
                %>
                	<tr class="bg-installedprinter"> <th colspan="4"><% if(ipr.getType().equals("localPrinter")){out.println("Impresoras mapeadas");}else{out.println("Impresoras de red");}  type = ipr.getType(); %></th> </tr>
                    <tr>
                    	<th> Nombre </th>
                    	<th> Puerto </th>
                    	<th> Driver </th>
                    	<th> UNC </th>
                    </tr>
                    
                <%
						}
				%>
                    <tr> 
                        <td> <% out.println(ipr.getName()); %> </td> 
                        <td> <% out.println(ipr.getPort()); %> </td> 
                        <td> <% out.println(ipr.getDriver()); %> </td> 
                        <td> <% if(ipr.getUnc().equals("null")){out.print("-");}else{out.println(ipr.getUnc());} %> </td> 
                    </tr>
                <%
						
						i++;
					}
                %>      
                  </tbody>        
                </table>
 
        </div>
         </div>             <%@ include file="Footer.html" %>     </div>
    </div>
</BODY>
</HTML>