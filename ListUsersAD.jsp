
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
</head>
<BODY>
	<div id="wrap">
	
		<%@ include file="Header.html" %>      
        <div class="container">
                  
            <h2 class="font my-title">Listado de usuarios Active Directory</h2>

			<button type="button" class="connectActiveDirectory pull-right btn btn-primary btn-sm">
            	<span class="glyphicon glyphicon-refresh"></span> Actualizar desde Active Directory 
            </button> 

            <table class="font table table-striped">  
             <thead>
                <tr class="tableHeader"> 
                <th> Nombre </th>
                <th> Email </th>
                <th> Nombre de usuario </th>       
                </tr>    
             </thead>              	        
                <% 
                    ArrayList ln = (ArrayList)request.getSession().getAttribute("AUTHORS");
                    int i=0;
                    int len=ln.size();
                    while(i<len){
                        UserAD u = (UserAD)ln.get(i);
                %>
              <tbody>
                <tr class="clickableRow"> 
                <form method="post" name="<% out.print(u.getId()); %>" action="/ServidorSIAR/Controller">
                <input type="hidden" name="action" value="userad_details_list">
                <input type="hidden" name="idUserad" value="<%out.print(Integer.toString(u.getId()));%>"> 
                    <td class="<%out.print(u.getId());%>"> <% out.println(u.getName()); %> </td> 
                    <td class="<%out.print(u.getId());%>"> <% out.println(u.getEmail()); %> </td>
                    <td class="<%out.print(u.getId());%>"> <% out.println(u.getUserName()); %> </td>
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
                <input type="hidden" name="action" value="list_usersAD">
                <input type="hidden" name="pageNumber" value="<% out.print(Integer.toString(range)); %>">
            
                      <ul class="pagination <% if(oldPageNumber == pageNumber){%>active<%}%>">
                        <li><input type="submit" value="<% out.print(Integer.toString(pageNumber)); %>" /></li>
                      </ul>              
                </form>     
                <%} %>

		</div>
        <%@ include file="Footer.html" %>
    </div>
</BODY>
</HTML>