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
    <%@page import="java.io.File" %>
    <%@page import="siar.activedirectory.UserAD" %>
    <%@page import="siar.notification.Event" %>   
    <%@page import="siar.notification.Answer" %>    
    <%@page import="siar.users.User" %>   
    <%@page import="siar.notification.type.EventType" %>
    <%@page import="siar.notification.location.EventLocation" %>
    <%@page import="siar.notification.category.EventCategory" %>
</head>
<BODY>
    <!--http://devdocs.io/-->
	<div id="wrap"> 	
        <%@ include file="Header.html" %>      <div class="container">
		<% 
            User u = (User)request.getSession().getAttribute("LOGGED");

            Event e = (Event)request.getSession().getAttribute("NOTIFICATION_SELECTED");
			EventType etyp = (EventType) e.getType();
			EventCategory ecat = (EventCategory) e.getCategory();
			EventLocation eloc = (EventLocation) e.getLocation();
            if(request.getSession().getAttribute("FOLDER")==null || request.getSession().getAttribute("FOLDER").equals("0"))request.getSession().setAttribute("FOLDER",Integer.toString(e.getAttachedDirectory()));
            String id = (String)request.getParameter("userIdentif");
        %>
                
            <form method="post" action="/ServidorSIAR/Controller"> 
            <input type="hidden" name="action" value="update_notification">     
            <input type="hidden" name="pageNumber" value="0">
            <input type="hidden" name="eventDate" value="<% out.print(e.getDate()); %>"> <!-- Para que al hacer la notificación no varíe la fecha de creación -->                  
            <%if(e.getidUserName().equals("No determinado")){%>
                <input type="hidden" name="user" value="<%out.print(Integer.toString(u.getId()));%>">
            <% }else{ %>
                <input type="hidden" name="user" value="<%out.print(Integer.toString(e.getidUser()));%>">	
            <%}%>            
            <h2 id="tableTitle" class="font my-title">
                <% out.println(e.getUserIdentifier()); %>
                <input type="text" name="title" class="form-control" id="my-form-control" value="<% out.print(e.getTitle()); %>"  <% if(e.getState().equals("Cerrada")){%> disabled class="text-muted closedNotif"  <%}%>/>
                <a href="javascript:history.back()"> <span class="pull-right glyphicon glyphicon-circle-arrow-left" title="Atrás"></span> </a>
            </h2>
            <table class="font table table-striped">
                <tr>
                    <th> Momento de creación </th>
                    <td> <% out.println(e.getDate()); %> </td>   
                    <th colspan="1"> Persona que notifica </th>
                    <td colspan="1"> <% //out.println(e.getEmail()); %> 
                    <select name="author" class="form-control" <% if(e.getState().equals("Cerrada")){%> disabled <%}%> >
                
                    <%
                    ArrayList authors = (ArrayList)request.getSession().getAttribute("AUTHORS");
                    int i=0;
                    while(i<authors.size()){
                        UserAD a = (UserAD)authors.get(i);
                    %>
                        <option value="<% out.print(Integer.toString(a.getId())); %>" <% if(a.getEmail().equals(e.getEmail())){%>selected<%}%>><% out.print(a.getName()); %></option>
                    <%
                        i++;
                    }
                    %>
                    </select>                    
                    </td>
                    <th colspan="1"> Estado </th>
                    <td colspan="1"> <% out.println(e.getState()); %> </td>
                </tr>
                <tr> 
                    <th colspan="1"> Registrador </th>
                    <td colspan="1"> <% out.println(e.getidUserName()); %> </td>
                    <th> Tipo </th>
                    <td colspan="1">  
                        <select name="type" class="select form-control"  <% if(e.getState().equals("Cerrada")){%> disabled <%}%>>
                        <%
                        ArrayList types = (ArrayList)request.getSession().getAttribute("TYPES");
                        int z=0;
                        while(z<types.size()){
                             EventType et = (EventType)types.get(z);
                        %>
                          <option value="<% out.print(Integer.toString(et.getId())); %>" <% if(et.getType().equals(etyp.getType())){%>selected<%}%>>
                            <% out.print(et.getType()); %>
                          </option>
                        <%
                            z++;
                        }
                        %>
                        </select>
                    </td>
                    <th> Categoría </th>
                    <td colspan="1">  
                    <jsp:include page="SelectCategory.jsp">
                    <jsp:param name="selected" value="<%=ecat.getFullPath()%>" />
                    <jsp:param name="state" value="<%=e.getState()%>" />
                    </jsp:include>   
                    </td>
                </tr>  
                <tr>                        
                    <th colspan="1"> Localización</th>
                    <td colspan="1"> 
                    <jsp:include page="SelectLocation.jsp">
                    <jsp:param name="selected" value="<%=eloc.getFullPath()%>" /> 
                    <jsp:param name="state" value="<%=e.getState()%>" />
                    </jsp:include>                             
                    </td>
                    
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
						<li><button id="<%out.print(projectPath+f[index].getName());%>" type="button" class="btn btn-link file"><%out.println(f[index].getName());%></button>
                        <span title="Eliminar" class="deleteFile glyphicon glyphicon-trash"></span></li>
							
						<%
						}
						%>
                        </ul>
                        <%
					}
                    ArrayList al = (ArrayList)request.getSession(true).getAttribute("FILES");
					
					int f=0;
					if(al != null){
						while(f<al.size()){
                    %>
                    		<p> <% out.print(al.get(f)); %> </p>
                    <%
							f++;
						}
					}
					%>
                    <div class="upload">        
                    <button type="button" class="btn btn-default btn-sm">
                          <span class="glyphicon glyphicon-cloud-upload"></span> Subir 
                    </button>
                    </div>
                    </td>
                <input type="hidden" name="deleteFile" value="">  
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
                        <%if(a.getiUserName().equals(u.getName())){%><span title="Eliminar" class="delete glyphicon glyphicon-trash pull-right"></span><%} %>
                        
                    </td>
                </tr>
                <input type="hidden" name="answerId" value="<% out.print(Integer.toString(a.getId())); %>"> 
                <input type="hidden" name="delete" value="">  
                        
            <%
                    j++;
                }//end while answers
            
            %>
                                                                       
                
                <% if(!e.getState().equals("Cerrada")){ //Se non está pechada permítese a introdución dunha resposta %>
                <tr>
                    <td class="tableHeader"> Nueva Respuesta </td>
                    <td colspan="5">
                        <p>
                        <textarea class="form-control" name="inputAnswer" rows="10" cols="40" placeholder="Escribe tu respuesta..."></textarea></p>
                    </td>
                </tr><tr>
                    <td id="submitTd" colspan="6">
                        <button type="submit" id="saveButton" class="btn btn-primary btn-sm">
                         Guardar
                        </button>
                        <div class="checkbox pull-right"><label><input class="checkbox" type="checkbox" name="close" value="Cerrada">¿Cerrar incidencia?</label></div>
                    </td>
                </tr>
                <%}else{%>
                <tr>
                    <td id="submitTd" colspan="6">
                        <button type="submit" id="saveButton" class="btn btn-primary btn-sm">
                         Guardar
                        </button>
                        <div class="checkbox pull-right"><label><input class="checkbox" type="checkbox" name="close" value="En curso">¿Abrir incidencia?</label></div>
                    </td> 
                </tr>   
                <%}%>
                <tr></tr><tr></tr>                              
                </table>                              
            </form>

     </div>             <%@ include file="Footer.html" %>     </div>  
	</div>
</BODY>
</HTML>