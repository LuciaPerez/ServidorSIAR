
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
    <%@page import="siar.hardware.Device" %>
    <%@page import="siar.notification.location.EventLocation" %>
</head>
<BODY>
	<div id="wrap"> 	
		<%@ include file="Header.html" %>      <div class="container">
            <jsp:include page="Menu.jsp">
            <jsp:param name="page" value="listips"/>
            </jsp:include>
              <div class="col-sm-10">
                      
                    <h2 class="font my-title">Listado de IPs</h2>
                    
                    <table class="font table table-striped"> 
                      <thead>
                        <tr class="tableHeader"> 
                        <th> IP </th>
                        <th> Estado </th>    
                        <th> Localización </th>    
                        <th> Última actualización </th>     
                        </tr>  
                      </thead>                	        
                        <% 
                            ArrayList ln = (ArrayList)request.getSession().getAttribute("LIST_IPS");
                            int i=0;
                            int len=ln.size();
                            while(i<len){
                                Device ip = (Device)ln.get(i);
								EventLocation el = ip.getLocation();
                        %>
                      <tbody>
                      	<%
						String cls = "";
						String icon = "";
						String action = "";
						
						if(ip.getState().equals("up")){
							cls="bg-success";
							
							if(ip.getType().equals("pc")){
								icon = "<img class=\"my-icon\" src=\"images/computer.png\"> ";
								action = "computer_details";
							}else{
								if(ip.getType().equals("printer")){
									icon = "<span class=\"glyphicon glyphicon-print\"></span> ";
									action = "printer_details";
								}else{
									icon = "<img class=\"my-icon\" src=\"images/router.png\"> ";
									action = "gendev_details";
								}
							}
						}else{
							cls="bg-danger";
						} 

						%>
                        <tr class="clickableRow"> 
                        <form method="post" name="<% out.print(ip.getId()); %>" action="/ServidorSIAR/Controller">
                        <input type="hidden" name="action" value="<%out.print(action);%>">
                        <input type="hidden" name="idDevice" value="<%out.print(Integer.toString(ip.getId()));%>">
                            <td class="<%out.println(ip.getId());%>">  <% out.println(icon+ip.getIp()); %> </td> 
                            <td class="<%out.println(ip.getId());%>"> <% out.println(ip.getState()); %> </td>
                            <td class="<%out.println(ip.getId());%>"> <% out.println(el.getFullPath()); %> </td>
                            <td class="<%out.println(ip.getId());%>"> <% out.println(ip.getLastUpdate()); %> </td>
                        </form>

                        </tr>
                        <%
                                i++;
                            }
                        %> 
                      </tbody>             
                    </table>
                    
                <!-- Cálculo do número de páxina e o rango que hai que listar en función deste -->    
                <%  String s = request.getParameter("pageNumber");
					int npp = (Integer)request.getSession().getAttribute("NOTIF_PER_PAGE");
					int count = (Integer)request.getSession().getAttribute("NOTIF_COUNT");
					int max_p = 0;
						if((count%npp) > 0) {
							max_p = (count/npp)+1;
						}else{
							max_p = (count/npp);
						}
				 %>
                 
				<% for(i=0; i<max_p; i++){  
                    int pageNumber = i+1;
                    int range = (pageNumber-1)*npp;
                    int oldPageNumber = (Integer.parseInt(s)/npp)+1;
                %>
                <form method="post" action="/ServidorSIAR/Controller"  id="formPage"> 
                <input type="hidden" name="action" value="list_ips">
                <input type="hidden" name="pageNumber" value="<% out.print(Integer.toString(range)); %>">
            
                      <ul class="pagination <% if(oldPageNumber == pageNumber){%>active<%}%>">
                        <li><input type="submit" value="<% out.print(Integer.toString(pageNumber)); %>" /></li>
                      </ul>              
                </form>     
                <%} %>

        </div>
         </div>             <%@ include file="Footer.html" %>     </div>
    </div>
</BODY>
</HTML>