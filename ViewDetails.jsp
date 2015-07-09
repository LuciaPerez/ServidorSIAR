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
    <%@page import="siar.hardware.FileSystemRoot" %>    
    <%@page import="siar.users.User" %>   
</head>
<BODY>
	<div id="wrap"> 	
        <%@ include file="Header.html" %>      <div class="container">
            <jsp:include page="Menu.jsp">
            <jsp:param name="page" value="pcs"/>
            </jsp:include>
            <div class="col-sm-10">
                <jsp:include page="Tabs.jsp">
                <jsp:param name="tab" value="pcdetails"/>
                </jsp:include>  
					<%
					    ArrayList ln = (ArrayList)request.getSession().getAttribute("LIST_COMPUTERS");
                        int id = Integer.parseInt((String)request.getSession().getAttribute("IDPC"));

						Computer c = (Computer)request.getSession().getAttribute("COMPUTER_SELECTED");
						UserAD u = (UserAD)c.getUserAD();
						ArrayList fileSystem = (ArrayList)request.getSession().getAttribute("FILESYSTEM");
					%>
                        <h1 id="tableTitleTabs" class="font my-title tableHeader"> <% out.println(c.getHostname()); %> </h1>                   
                    	<table class="font table table-striped">
                         
                            <tr class="biggerTable">
                                <th colspan="1"> IP </th>
                                <td colspan="1"> <% out.println(c.getIp()); %> </td>   
                                <th colspan="1"> MAC </th>
                                <td colspan="2"> <% out.println(c.getMac()); %> </td>  
                                <th colspan="1"> Número de serie </th>
                                <td colspan="1"> <% out.println(c.getSerialno()); %> </td>
                            </tr>
                            <tr class="biggerTable">                        
                                <th colspan="1"> Fabricante </th>
                                <td colspan="1"> <% out.println(c.getManufacturer()); %> </td>
                                <th colspan="1"> Modelo </th>
                                <td colspan="4"> <% out.println(c.getModel()); %> </td>
                            </tr>  
                            <tr class="biggerTable">                        
                                <th colspan="1"> Procesador </th>
                                <td colspan="1"> <% out.println(c.getProcid()); %> </td>
                                <th colspan="1"> Arquitectura procesador </th>
                                <td colspan="1"><% out.println(c.getProcarch()); %> </td>
                                <th colspan="2"> Nº procesadores </td>
                                <td colspan="1"><% out.println(c.getNproc()); %> </td>
                            </tr>  
                            <tr class="biggerTable">                        
                                <th colspan="1"> Sistema Operativo </th>
                                <td colspan="2"> <% out.println(c.getOsname()); %> ( Versión <% out.println(c.getOsversion()); %>) </td>
                                <th colspan="1"> Arquitectura </td>
                                <td colspan="1"> <% out.println(c.getOsarch()); %> </td>
                                <th colspan="1"> Usuario AD </td>
                                <td colspan="1"> 
                                <form method="post" action="/ServidorSIAR/Controller">
                                    <input type="hidden" name="action" value="userad_details">
                                    <input type="hidden" name="pageNumber" value="0">
                                    <input type="submit" id="usersAD" class="button submit" value="<% out.println(u.getUserName()); %>">
                                </form>    
                                </td>
                            </tr>  
                            
                            <%
							int size = fileSystem.size();
							int index=0;
							while(index<size){
								FileSystemRoot fs = (FileSystemRoot)fileSystem.get(index);
							%>
								<tr>                        
									<th colspan="1"> Unidad de disco </th>
									<td colspan="1"> <% out.println(fs.getRoot()); %> </td>
									<th colspan="1"> Espacio total </th>
									<td colspan="2"> <% out.println(String.valueOf(fs.getTotal())); %> GB</td>
									<th colspan="1"> Espacio libre </th>
									<td colspan="1"> <% out.println(String.valueOf(fs.getFree())); %> GB</td>
								</tr>  								
                            <%    
								index++;	
							}
							%>
                        <form method="post" action="/ServidorSIAR/Controller"> 
                        <input type="hidden" name="action" value="update_device">
                        <input type="hidden" name="dev-type" value="computer">
                        <tr>
                            <th colspan="1"> Modificar Descripción </th>
                            <td colspan="6"> <input type="text" name="description" id="description" value="<% out.print(c.getDescription()); %>" </td>						
                        </tr>
                        <tr>
                            <td colspan="7" id="submitTd">
                            <button type="submit" id="saveButton" class="btn btn-primary btn-sm">
                             Guardar
                            </button>
                            </td>
                        </tr>
                        </form>  
                    	</table>
                    <%						
							/*} //end if
							i++;
						} //end while de búsqueda*/
					%> 
    </div>    
     </div>             <%@ include file="Footer.html" %>     </div>
	</div>
</BODY>
</HTML>