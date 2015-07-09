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
    <%@page import="java.util.Set" %>
    <%@page import="siar.activedirectory.UserAD" %>
    <%@page import="siar.hardware.Computer" %>
    <%@page import="siar.hardware.Printer" %>
    <%@page import="siar.hardware.GeneralDevice" %>
    <%@page import="siar.hardware.Device" %>
    <%@page import="siar.utilities.Utilities" %>
</head>
<BODY>
	<div id="wrap"> 	
    
		<%@ include file="Header.html" %>      
        <div class="container">

        <jsp:include page="Menu.jsp">
        <jsp:param name="page" value="news"/>
        </jsp:include>
        <div class="col-sm-10">
         <h1 id="tableTitle" class="font">Novedades
         <a href="javascript:history.back()"> <span class="pull-right glyphicon glyphicon-circle-arrow-left" title="Atrás"></span> </a>
         </h1>
         <% HashMap devices = (HashMap)request.getSession().getAttribute("NEWS"); %>
         <% if(devices!=null){ 
				Set <Device> keys = devices.keySet();
				String classNameNew="";
				String classNameOld="";
				
		 %>
         		<p> Se muestran los resultados <span class="text-success">recién obtenidos</span> y, en caso de producirse algún conflicto, también se muestran los <span class="text-primary">ya almacenados</span> </p>
                <form method="post" action="/ServidorSIAR/Controller">
                <table class="font table table-striped">
                    <thead>
                     <tr class="tableHeader"> 
                        <th> IP </th>
                        <th> MAC </th>   
                        <th> Tipo de dispositivo </th>     
                        <th> Estado </th>  
                        <th> Otro </th> 
                        <th> Mantener antiguo </th> 
                    </tr>  
                    </thead>
                    <tbody>
          
          <%
		  		for(Device dev : keys){
					ArrayList devsWithSameIp = (ArrayList)devices.get(dev);
					Device newDev = (Device)devsWithSameIp.get(0);
					if(newDev.getMac() == null){ newDev.setMac("null"); }
					for(int i=1; i<devsWithSameIp.size(); i++){
						Device oldDev = (Device)devsWithSameIp.get(i); 
						if(oldDev==null){ 
							classNameNew = "bg-success my-border"; 
						}else{  
							if((oldDev.getIp().equals(newDev.getIp()) && !oldDev.getMac().equals(newDev.getMac())) || (!oldDev.getIp().equals(newDev.getIp()) && oldDev.getMac().equals(newDev.getMac()))){ //(oldDev.getMac().equals("null") && newDev.getMac().equals("null"))
								classNameNew = "bg-danger text-success my-border"; 
								classNameOld = "bg-danger text-primary"; 
							}
						}
						
						if(oldDev!=null){
							
							if((oldDev.getIp().equals(newDev.getIp()) && !oldDev.getMac().equals(newDev.getMac())) || (!oldDev.getIp().equals(newDev.getIp()) && oldDev.getMac().equals(newDev.getMac()))){ %>          
							<tr> 
								<td class="<%out.print(classNameOld);%>"> <% out.print(oldDev.getIp()); %> </td>
								<td class="<%out.print(classNameOld);%>"> <% if(!oldDev.getMac().equals("null")){out.print(oldDev.getMac());}else{out.print("-");} %> </td>
								<td class="<%out.print(classNameOld);%>"> <% if(!oldDev.getType().equals("null")){out.print(oldDev.getType());}else{out.print("-");} %> </td>
								<td class="<%out.print(classNameOld);%>"> <% out.print(oldDev.getState()); %> </td>
								
			<%				
								if(oldDev.getType()!=null){
									if(oldDev.getType().equals("printer")){
										Printer aux2 = (Printer)oldDev; 
										%><td class="<%out.print(classNameOld);%>"> <% out.print(aux2.getName()); %> </td> <%
									}
									if(oldDev.getType().equals("pc")){
										Computer aux2 = (Computer)oldDev; 
										%><td class="<%out.print(classNameOld);%>"> <% out.print(aux2.getManufacturer()); %> </td> <%
									}
									if(oldDev.getType().equals("gendev")){
										GeneralDevice aux2 = (GeneralDevice)oldDev; 
										%><td class="<%out.print(classNameOld);%>"> <% out.print(aux2.getManufacturer()); %> </td> <%
									}  
								}else{
									%><td class="<%out.print(classNameOld);%>"> - </td><%
								}
								%><td class="<%out.print(classNameOld);%>"> </td><%
							}
						}
					}//fin for
			%>                      
                        
                   </tr>  
                   <tr> 
                        <td class="<%out.print(classNameNew);%>"> <% out.println(newDev.getIp());%> </td>
                        <td class="<%out.print(classNameNew);%>"> <% if(!newDev.getMac().equals("null")){out.println(newDev.getMac());}else{out.print("-");} %> </td>
                        <td class="<%out.print(classNameNew);%>"> <% out.println(newDev.getType()); %> </td>
                        <td class="<%out.print(classNameNew);%>"> <% out.println(newDev.getState()); %> </td>
                        
		  <%			
						if(newDev.getType()!=null){
							if(newDev.getType().equals("printer")){
								Printer aux = (Printer)newDev; 
								%><td class="<%out.print(classNameNew);%>"> <% out.println(aux.getName()); %> </td> <%
							}
							if(newDev.getType().equals("pc")){
								Computer aux = (Computer)newDev; 
								%><td class="<%out.print(classNameNew);%>"> <% out.println(aux.getManufacturer()); %> </td> <%
							}
							if(newDev.getType().equals("gendev")){
								GeneralDevice aux = (GeneralDevice)newDev; 
								%><td class="<%out.print(classNameNew);%>"> <% out.println(aux.getManufacturer()); %> </td> <%
							}  
						}else{
							%> <td class="<%out.print(classNameNew);%>"> - </td> <%	
						}
			%>                      
                        
                        <td class="<%out.print(classNameNew);%>"><input type="checkbox" name="dontSave"  value="<% out.print(newDev.getIp()+","+newDev.getMac()); %>"></td>
                     </tr> 
                     

                     
          <%
				classNameNew = "";
				classNameOld = "";	
					
		  		}//fin for
		  %>              
                     <tr>
                        <td id="submitTd" colspan="6">
                            <input type="hidden" name="action" value="save_inventory">
            				<input type="hidden" name="pageNumber" value="0">
                            <button type="submit" id="inventory" class="btn btn-primary btn-sm">
                             Guardar en la base de datos
                            </button>
                        </td>
                    </tr> 
          
                    </tbody>
                </table>
         <% 
				
		 	} //fin if
		 %>
         

        </form>
        </div>
    </div>
     
     <%@ include file="Footer.html" %>     
     </div>
</BODY>
</HTML>