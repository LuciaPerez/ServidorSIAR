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
    <%@page import="siar.notification.type.EventType" %>
    <%@page import="siar.notification.location.EventLocation" %>
    <%@page import="siar.notification.category.EventCategory" %>
</head>
<BODY>
    <div id="wrap"> 	
		<%@ include file="Header.html" %>      
        <div class="container">
            <h2 id="tableTitle" class="font my-title"> Crear incidencia nueva 
            <a href="javascript:history.back()"> <span class="pull-right glyphicon glyphicon-circle-arrow-left" title="Atrás"></span> </a>
            </h2>
            <table class="font table table-striped">
            <form method="post" action="/ServidorSIAR/Controller"> 
            <input type="hidden" name="action" value="create_event"> 
            <input type="hidden" name="pageNumber" value="0">
             <tr>
                <th> Título </th>
                <td colspan="5">
                <textarea name="title" class="form-control" rows="1" placeholder="Título">
                </textarea>
                </td>
            </tr>  
            <tr> 
                <th> Persona que notifica </th>
                <td colspan="1">
                    <select name="author" class="select form-control" >
                        <!--<option>-- Elige un usuario --</option>-->
                    <%
                    ArrayList authors = (ArrayList)request.getSession().getAttribute("AUTHORS");
                    int i=0;
                    while(i<authors.size()){
                        UserAD a = (UserAD)authors.get(i);
                    %>
                        <option value="<% out.print(Integer.toString(a.getId())); %>"><% out.print(a.getName()); %></option>
                    <%
                        i++;
                    }
                    %>
                    </select>
                </td> 
                <th> Localización </th>
                <td colspan="3">
                    <jsp:include page="SelectLocation.jsp">
                    <jsp:param name="selected" value="" /> 
                    <jsp:param name="state" value="" />
                    </jsp:include>                                        
                </td> 
            </tr>    

            <tr>
                <th colspan="1"> Tipo </th>
                <td colspan="1">
                 <select name="type" class="form-control">
                    <%
                    if(request.getSession().getAttribute("FOLDER")==null)request.getSession().setAttribute("FOLDER","0");
                    ArrayList types = (ArrayList)request.getSession().getAttribute("TYPES");
                    i=0;
                    while(i<types.size()){
                        EventType et = (EventType)types.get(i);
                    %>
                      <option value="<% out.print(Integer.toString(et.getId())); %>" ><% out.print(et.getType()); %></option>
                    <%
                        i++;
                    }
                    %>
                </select>                       
                </td> 
                <th colspan="1"> Categoría </th>
                <td colspan="1">
                    <jsp:include page="SelectCategory.jsp">
                    <jsp:param name="selected" value="" /> 
                    <jsp:param name="state" value="" />
                    </jsp:include>     
                </td> 
                <th> Archivos adjuntos </th>
                <td colspan="1"> 
                    <%
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
            </tr>           
            
            <tr>
                <th> Descripción </th>
                <td colspan="5">
                <textarea name="description" class="form-control" rows="5" id="comment" placeholder="Escribe la descripción de la incidencia...">
                </textarea>
                </td>
            </tr>  
            <tr>
                <td id="submitTd" colspan="6">
                    <button type="submit" id="saveButton" class="btn btn-primary btn-sm">
                     Guardar
                    </button>
                    <div class="checkbox pull-right"><label><input class="checkbox" type="checkbox" name="close" value="Cerrada">¿Cerrar incidencia?</label></div>
                </td>
                </form>
            </tr><tr></tr>               
            </table>

    
    </div>   
             
	 <%@ include file="Footer.html" %>    
      </div>
    
</BODY>
</HTML>