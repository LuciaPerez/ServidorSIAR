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
    <%@page import="java.io.File" %>
    <%@page import="siar.notification.Event" %>   
    <%@page import="siar.notification.type.EventType" %>
    <%@page import="siar.notification.location.EventLocation" %>
    <%@page import="siar.notification.category.EventCategory" %>
    <%@page import="siar.notification.Answer" %>    
    <%@page import="siar.users.User" %>   
</head>
<BODY>
    <!--http://devdocs.io/-->
	<div id="wrap"> 	
        <%@ include file="Header.html" %>      
        <div class="container">
		<% 
            User u = (User)request.getSession().getAttribute("LOGGED");
            ArrayList ln = (ArrayList)request.getSession().getAttribute("LIST_NOTIFICATIONS");
            int i=0;
            int len=ln.size();
            int notif = 0;
            while(notif==0){
                Event e = (Event)ln.get(i);
				EventType et = (EventType) e.getType();
				EventCategory ec = (EventCategory) e.getCategory();
				EventLocation el = (EventLocation) e.getLocation();
				
                String id = (String)request.getParameter("userIdentif");
                if(id.equals(e.getUserIdentifier())){
                    request.getSession().setAttribute("NOTIFICATION_SELECTED",e);
                    notif=1;
        %>
               
                <h2 id="tableTitle" class="font my-title"> <% out.println(e.getUserIdentifier()+" "+e.getTitle()); %> 
                <a href="javascript:history.back()"> <span class="pull-right glyphicon glyphicon-circle-arrow-left" title="Atrás"></span> </a>
                </h2>
                <table class="font table table-striped">
                <form method="post" action="/ServidorSIAR/Controller"> 
                <input type="hidden" name="idEvent" value="<%out.print(Integer.toString(e.getId()));%>">
                <input type="hidden" name="userIdentif" value="<%out.print(e.getUserIdentifier());%>">
                <input type="hidden" name="action" value="edit_notification">     
                <input type="hidden" name="eventDate" value="<% out.print(e.getDate()); %>"> <!-- Para que al hacer la notificación no varíe la fecha de creación -->              
                    <tr>
                        <th> Momento de creación </th>
                        <td> <% out.println(e.getDate()); %> </td>   
                        <th colspan="1"> Persona que notifica </th>
                        <td colspan="1"> <% out.println(e.getEmail()); %> </td>
                        <th colspan="1"> Estado </th>
                        <td colspan="1"> <% out.println(e.getState()); %> </td>
                    </tr>
                    <tr> 
                        <th  colspan="1"> Registrador </th>
                        <td colspan="1"> <% out.println(e.getidUserName()); %> </td>
                        <th> Tipo </th>
                        <td colspan="1"> <% out.print(et.getType()); %> </td> 
                        <th> Categoría </th>
                        <td colspan="1"> <% out.print(ec.getFullPath()); %> </td>
                    </tr>  
                    <tr>                        
                        <th colspan="1"> Localización </th>
                        <td colspan="1"> <% out.print(el.getFullPath()); %> </td>
                        <th colspan="1"> Archivos adjuntos </th>
                        <td colspan="3"><% 
                            if(e.getAttachedDirectory() > 0){
                                File[] f = e.getFiles();
                                String projectPath = "/ServidorSIAR/MailDocuments/"+e.getAttachedDirectory()+"/";
								%>
                                <ul id="my-list">
                                <%
                                for(int index=0; index<f.length; index++){
                                %>
                                	<li><button id="<%out.print(projectPath+f[index].getName());%>" type="button" class="btn btn-link file"><%out.println(f[index].getName());%></button></li>
                                    
                                <%
                                }
								%>
                                </ul>
                                <%
                            }else{
                                out.println("Sin archivos adjuntos");
                            }
                        %></td>
                    </tr> 
                    <tr> 
                        <th> Descripción </th>
                        <td colspan="5"> <% out.println(e.getDescription()); %> </td>
                    </tr>  


<!-- ----------------------- RESPUESTAS DE ESTA INCIDENCIA --------------------------- -->
                <%
                    ArrayList la = (ArrayList)request.getSession().getAttribute("LIST_ANSWERS");
                    int j=0;
                    int size=la.size();
                %>
                     <tr> 
                        <td colspan="6" class="count my-tb-center"> 
							<%if(size>0){%>
                                Esta incidencia tiene
                                <span>
                                    <% if(size==1){ out.print(Integer.toString(size)); %> respuesta.
                                    <% }else{ out.print(Integer.toString(size));%> respuestas. <%}%>
                                </span> 
                                <span id="displayAnswers" class="pull-right glyphicon glyphicon-eye-open"></span>
                            <%}else{%>
                                Esta incidencia no tiene <span class="my-tb-center">ninguna</span> respuesta.
                                <span id="displayAnswers" class="pull-right glyphicon glyphicon-eye-close"></span>
                            <%}%>
                        </td>
                    </tr>                     
                <%
                    while(j<size){
                        Answer a = (Answer)la.get(j);
                %>
                    <tr <%if (j!=size-1){%>class="answer"<%}%> id="<%out.print(Integer.toString(a.getId()));%>"> 
                        <td class="tableHeader"> 
                            <p> <% out.println(a.getiUserName()); %> </p>
                            <p> <% out.println(a.getDate()); %> </p>
                        </td>
                        <td colspan="5"> 
                            <p> <% out.println(a.getAnswer()); %> </p>                                
                        </td>
                    </tr>
                    <input type="hidden" name="answerId" value="<% out.print(Integer.toString(a.getId())); %>"> 
                    <input type="hidden" name="delete" value="">                             
                <%
                        j++;
                    }//end while answers
                %>
                                                                           
                    
                    <tr>
                        <td id="submitTd" colspan="6">
                        <button type="submit" id="saveButton" class="btn btn-primary btn-sm"> Editar </button>
                        </td>
                    </tr>
        

                    </form>
                    
                    <tr></tr><tr></tr>                              
                    </table>                               
                    
                                                                    
        <%		} //end if
                i++;
            } //end while de búsqueda
        %> 
   
     </div>             <%@ include file="Footer.html" %>     </div>
	</div>
</BODY>
</HTML>