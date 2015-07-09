
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
    <%@page import="siar.activedirectory.application.Application" %>
</head>
<BODY>
	<div id="wrap"> 	
		<%@ include file="Header.html" %>      
        <div class="container">
 
        <form method="post" action="/ServidorSIAR/Controller"> 
            <input type="hidden" name="action" value="list_usersAD">
            <input type="hidden" name="pageNumber" value="<% out.print(request.getSession().getAttribute("PAGE_NUMBER")); %>">
            <button type="submit" class="pull-right btn btn-default btn-sm">
              <i class="glyphicon glyphicon-circle-arrow-left"></i> Volver al listado
            </button>
        </form>

        <jsp:include page="TabsUserAD.jsp">
        <jsp:param name="tab" value="listapps"/>
        </jsp:include>     
            
            <% UserAD a = (UserAD)request.getSession().getAttribute("USERAD_SELECTED");  %>
            <% ArrayList listAssignedApps = a.getApps(); %>  
            <%!
            public boolean isAssigned(ArrayList list, Application app){
                int index = 0;
                int size = list.size();
                boolean res = false;
                while(index<size){
                    Application a = (Application)list.get(index);
                    if(a.getId() == app.getId()){
                        res = true;
                        break;
                    }
                    index++;
                }
                
                return res;
            }
            %>
             
            
            <h1 id="tableTitleTabs" class="font my-title"> <% out.print(a.getName()); %> (<% out.print(a.getUserName()); %>) </h1>
            <form method="post" action="/ServidorSIAR/Controller"> 
            <input type="hidden" name="action" value="match_userAD_app">
            <input type="hidden" name="idPc" value="<%out.print((String)request.getSession().getAttribute("IDPC"));%>">                  
            <table class="font table table-striped"> 
              <thead> 
                <tr>
                    <th>  </th>
                    <th> Aplicaciones asignadas </th>   
                    <th> Usuario </th>   
                </tr>  
              </thead>
                <%
                int j=0;
                int len=listAssignedApps.size();
                while(j<len){
                    Application assignedApp = (Application)listAssignedApps.get(j);
                %>    
              <tbody> 
                <tr class="biggerTable" id="<%out.print(Integer.toString(assignedApp.getId()));%>">
                    <td class="tdIconTable"> 
                    <span class="delete glyphicon glyphicon-trash"></span>
                    </td>
                    <td> <% out.print(assignedApp.getName()); %> </td>   
                    <td> <% out.print(assignedApp.getUser()); %> </td>   
                </tr> 
                <%
                    j++;
                }
                %>   
              </tbody>
              <thead>
                <tr>
                    <th>  </th>
                    <th> Aplicaciones de usuario </th>   
                    <th> Usuario para entrar en cada aplicación </th>   
                </tr>  
              </thead>
                <% 
                    ArrayList ln = (ArrayList)request.getSession().getAttribute("APPS");
                    int i=0;
                    len=ln.size();
                    while(i<len){
                        Application app = (Application)ln.get(i);
                        if(isAssigned(listAssignedApps,app)==false){  
                        
                %>
              <tbody>
                <tr class="biggerTable"> 
                    <input type="hidden" name="ids" value="<% out.print(app.getId()); %>"/>
                    <td class="tdIconTable"> <input type="checkbox" name="<% out.print(app.getId()); %>" /> </td>
                    <td> <% out.println(app.getName()); %> </td> 
                    <td> <input type="text" name="loginApp" class="loginApps"/> </td> 
                </tr>
                <%
                        }
                        i++;
                    }
                %>   
                <input type="hidden" name="delete" value=""> 
                 <tr>
                    <td colspan="7" id="submitTd">
                    <button type="submit" id="saveButton" class="btn btn-primary btn-sm">
                     Guardar
                    </button>
                    </td>
                </tr>
              </tbody>           
            </table>
                
                
            </form>

     
         </div>             <%@ include file="Footer.html" %>     </div>
    </div>
</BODY>
</HTML>