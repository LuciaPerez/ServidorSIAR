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
    <%@page import="siar.notification.Event" %>
    <%@page import="siar.notification.type.EventType" %>
    <%@page import="siar.notification.location.EventLocation" %>
    <%@page import="siar.notification.category.EventCategory" %>

</head>
<BODY>

    <div id="wrap">
	
		<%@ include file="Header.html" %>      <div class="container">
            <h2 class="font my-title">Incidencias / Peticiones 
            <form method="post" action="/ServidorSIAR/Controller"> 
                <input type="hidden" name="action" value="search_data">
                <button type="submit" id="createButton" class="pull-right btn btn-default btn-sm">
                  <i class="glyphicon glyphicon-edit"></i> Nueva
                </button>
            </form>            

            <button type="button" class="pull-right search btn btn-default btn-sm">
            	<span class="glyphicon glyphicon-search"></span> Buscar 
            </button>         
            </h2> 
            <%
                String s = request.getParameter("pageNumber");
            %>
            <table class="font table table-striped">
              <thead>
                 <tr> 
                    <th> Código </th>
                    <th> Estado </th>       
                    <th> Título </th>
                    <th> Momento de creación </th>
                    <th> Tipo </th>
                    <th> Categoría </th>
                    <th> Localización </th>
                </tr>
              </thead>
              <tbody>
                <% 
                    ArrayList ln = (ArrayList)request.getSession().getAttribute("LIST_NOTIFICATIONS");
                    int i=0;
                    int len=ln.size();
                    while(i<len){
                        Event e = (Event)ln.get(i);
						EventType et = (EventType) e.getType();
						EventCategory ec = (EventCategory) e.getCategory();
						EventLocation el = (EventLocation) e.getLocation();
                %>
                <tr class="clickableRow"  title="Ver en detalle" > 
                <form method="post" name="<% out.print(e.getUserIdentifier()); %>" action="/ServidorSIAR/Controller">
                <input type="hidden" name="action" value="view_notification">
                <input type="hidden" name="idEvent" value="<%out.print(Integer.toString(e.getId()));%>">
                <input type="hidden" name="userIdentif" value="<%out.print(e.getUserIdentifier());%>">
                    <td class=<% out.print(e.getUserIdentifier()); %>> <% out.println(e.getUserIdentifier()); %> </td> 
                    <td class=<% out.print(e.getUserIdentifier()); %>> <% out.println(e.getState()); %> </td> 
                    <td class=<% out.print(e.getUserIdentifier()); %> > <% out.println(e.getTitle()); %> </td> 
                    <td class=<% out.print(e.getUserIdentifier()); %>> <% out.println(e.getDate()); %> </td> 
                    <td class=<% out.print(e.getUserIdentifier()); %>> <% out.println(et.getType()); %> </td> 
                    <td class=<% out.print(e.getUserIdentifier()); %>> <% out.println(ec.getName()); %> </td> 
                    <td class=<% out.print(e.getUserIdentifier()); %>> <% out.println(el.getName()); %> </td>
                </form>
                </tr>
                
                <%
                        i++;
                    }
                %>                  
              </tbody>
            </table>
            
            <!-- Alerta para informar se a comprobación automática está activada -->
            <%
				boolean is_running = (Boolean)request.getServletContext().getAttribute("RUNNING_TIMER");
				if(is_running){
				%>
				<p class="my-info text-primary pull-right">
				  La comprobación automática de incidencias está activada.
				</p>
                <%
				}else{
				%>	
				<p class="my-info text-primary pull-right">
				  La comprobación automática de incidencias <strong>no</strong> está activada.
				</p>
                <%
				}
			%>

            
            <%  int npp = (Integer)request.getSession().getAttribute("NOTIF_PER_PAGE");
                int count = (Integer)request.getSession().getAttribute("NOTIF_COUNT");
                int max_p = 0;
                    if((count%npp) > 0) {
                        max_p = (count/npp)+1;
                    }else{
                        max_p = (count/npp);
                    }
                
             %>
             
             <!-- Cálculo do número de páxina e o rango que hai que listar en función deste -->
			<% for(i=0; i<max_p; i++){  
                int pageNumber = i+1;
                int range = (pageNumber-1)*npp;
                int oldPageNumber = (Integer.parseInt(s)/npp)+1;
            %>
            <form method="post" action="/ServidorSIAR/Controller"  id="formPage"> 
            <input type="hidden" name="action" value="list_notifications">
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