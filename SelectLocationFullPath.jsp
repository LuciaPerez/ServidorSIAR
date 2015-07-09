<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es" lang="es">
<HTML>
<head>
	<meta  http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
    <%@page pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList" %>
    <%@page import="siar.notification.location.EventLocation" %>
</head>


<%
// Menú desplegable para ver as localizacións que hai actualmente introducidos 
ArrayList locations = (ArrayList)request.getSession().getAttribute("LOCATIONS");
String selected = (String) request.getSession().getAttribute("filter_location");
String state = (String) request.getParameter("state");
String oldFullPath = "--Sin padre--";
int selIndex=0;
%>

<select name="location" onchange="this.form.submit()" class="form-control">
<option value="">Localización...</option>
<%
while(selIndex<locations.size()){
    EventLocation el = (EventLocation)locations.get(selIndex);
    if(el.getState()==1){
        if(el.getFullPath().contains(oldFullPath)){
        %>
          <option value="<% out.print(el.getFullPath()); %>" <% if(selected!=null && el.getFullPath().equals(selected)){%>selected<%}%>><% out.print(el.getFullPath()); %> </option>
        <%
        }else{
            oldFullPath=el.getFullPath();
        %>
          </optgroup>
          <optgroup label="<% out.print(oldFullPath); %>">
          <option value="<% out.print(el.getFullPath()); %>" <% if(selected!=null && el.getFullPath().equals(selected)){%>selected<%}%>><% out.print(el.getFullPath()); %> </option>
          
        <%		
        }
    }
    
    selIndex++;
}
%>
 <optgroup label="Sin padre">	
    <option value=""> --Sin padre--</option>
 </optgroup>
</select> 