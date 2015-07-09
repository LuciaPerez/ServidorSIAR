<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es" lang="es">
<HTML>
<head>
	<meta  http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
    <%@page pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList" %>
    <%@page import="siar.notification.category.EventCategory" %>
</head>

<%
ArrayList categories = (ArrayList)request.getSession().getAttribute("CATEGORIES");
String selectedCat = (String) request.getParameter("selected");
String state = (String) request.getParameter("state");
String oldFullPathCat = "--Sin padre--";
int selIndexCat=0;
%>
<div class="ui-widget">
<select name="category" id="combobox" class="form-control" <% if(state.equals("Cerrada")){%> disabled <%}%>>
<%
while(selIndexCat < categories.size()){
    EventCategory ec = (EventCategory)categories.get(selIndexCat);
    if(ec.getState()==1){
        if(ec.getFullPath().contains(oldFullPathCat)){
        %>
          <option value="<% out.print(Integer.toString(ec.getId())); %>" <% if(ec.getFullPath().equals(selectedCat)){%>selected<%}%>><% out.print(ec.getFullPath()); %> </option>
        <%
        }else{
            oldFullPathCat=ec.getFullPath();
        %>
          </optgroup>
          <optgroup label="<% out.print(oldFullPathCat); %>">
          <option value="<% out.print(Integer.toString(ec.getId())); %>" <% if(ec.getFullPath().equals(selectedCat)){%>selected<%}%>><% out.print(ec.getFullPath()); %> </option>
          
        <%		
        }
    }
    
    selIndexCat++;
}
%>
 <optgroup label="Sin padre">	
    <option value=""> --Sin padre--</option>
 </optgroup>
</select> 
</div>