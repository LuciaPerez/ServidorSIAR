
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
    <%@page import="siar.activedirectory.UserAD" %>
    <%@page import="siar.hardware.Computer" %>
    <%@page import="siar.notification.location.EventLocation" %>
</head>
<BODY>
	<div id="wrap"> 	
		<%@ include file="Header.html" %>      <div class="container">
            <jsp:include page="Menu.jsp">
            <jsp:param name="page" value="pcs"/>
            </jsp:include>
            <div class="col-sm-10">
                    <h2 class="font my-title">Listado de ordenadores</h2>
                    
                    <table class="font table table-striped">
                      <thead>
                         <tr class="tableHeader"> 
                            <th> IP </th>
                            <th> Hostname </th>       
                            <th> Modelo </th>
                            <th> Fabricante </th>
                            <th> Sistema operativo </th>
                            <th> Estado </th>
                            <th> Nombre usuario </th>
                            <th> Usuario </th>
                            <th> Localización </th>
                        </tr>  
                      </thead>        
                        <% 
                            ArrayList ln = (ArrayList)request.getSession().getAttribute("LIST_COMPUTERS");
                            int i=0;
                            int len=ln.size();
                            while(i<len){
                                Computer c = (Computer)ln.get(i);
								UserAD a = c.getUserAD();
								EventLocation el = c.getLocation();
                        %>
                      <tbody>
                        <tr class="clickableRow"  title="Ver detalles"> 
                        <form method="post" name="<% out.print(c.getIdComputer()); %>" action="/ServidorSIAR/Controller">
                        <input type="hidden" name="action" value="computer_details">
                        <input type="hidden" name="idPc" value="<%out.print(Integer.toString(c.getIdComputer()));%>">
                        <input type="hidden" name="idDevice" value="<%out.print(Integer.toString(c.getId()));%>">
                            <td class=<% out.print(c.getIdComputer()); %>> <% out.println(c.getIp()); %> </td> 
                            <td class=<% out.print(c.getIdComputer()); %>> <% out.println(c.getHostname()); %> </td> 
                            <td class=<% out.print(c.getIdComputer()); %>> <% out.println(c.getModel()); %> </td> 
                            <td class=<% out.print(c.getIdComputer()); %>> <% out.println(c.getManufacturer()); %> </td> 
                            <td class=<% out.print(c.getIdComputer()); %>> <% out.println(c.getOsname()); %> </td> 
                            <td class=<% out.print(c.getIdComputer()); %>> <% out.println(c.getState()); %> </td> 
                            <td class=<% out.print(c.getIdComputer()); %>> <% out.println(a.getName()); %> </td> 
                            <td class=<% out.print(c.getIdComputer()); %>> <% out.println(a.getUserName()); %> </td> 
                            <td class=<% out.print(c.getIdComputer()); %>> <% out.println(el.getFullPath()); %> </td> 
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
                <input type="hidden" name="action" value="list_computer">
                <input type="hidden" name="pageNumber" value="<% out.print(Integer.toString(range)); %>">
            
                      <ul class="pagination <% if(oldPageNumber == pageNumber){%>active<%}%>">
                        <li><input type="submit" value="<% out.print(Integer.toString(pageNumber)); %>" /></li>
                      </ul>              
                </form>     
                <%} %> 
                </div>    
        </div>
       <%@ include file="Footer.html" %>    
    </div>
</BODY>
</HTML>