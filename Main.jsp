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
	<%@page import="siar.users.User" %>
</head>
<BODY>
    <div id="wrap">
    
        <%@ include file="Header.html" %>      <div class="container"> 
            <% //request.getSession().setAttribute("INDEX", "0"); %>
            <div class="row">
              <div class="col-sm-3">
                <form method="post" action="/ServidorSIAR/Controller">
                    <input type="hidden" name="action" value="go_to_inventory">
                    <input type="hidden" name="pageNumber" value="0">
                     <button type="submit" id="inventory" class="btn btn-primary btn-sm">
                     INVENTARIO
                    </button>
                </form>
              </div>
              <div class="col-sm-3">
                <form method="post" action="/ServidorSIAR/Controller">
                    <input type="hidden" name="action" value="list_notifications">
                    <input type="hidden" name="pageNumber" value="0">                    
                    <button type="submit" id="events" class="btn btn-primary btn-sm">
                     INCIDENCIAS
                    </button>
                </form>
              </div>
              <div class="col-sm-3">
              	<form method="post" action="/ServidorSIAR/Controller">
                    <input type="hidden" name="action" value="list_usersAD">
                    <input type="hidden" name="pageNumber" value="0">
                    <button type="submit" id="userAD" class="btn btn-primary btn-sm">
                     ACTIVE DIRECTORY
                    </button>
                </form>  
              </div>
              <div class="col-sm-3">
              	<form method="post" action="/ServidorSIAR/Controller">
                    <input type="hidden" name="action" value="configuration">
                    <input type="hidden" name="pageNumber" value="0">
                    <button type="submit" id="configuration" class="btn btn-primary btn-sm">
                     CONFIGURACIÓN
                    </button>
                </form>
              </div>
            </div>
        </div>    
        <%@ include file="Footer.html" %>     
    </div>

</BODY>
</HTML>