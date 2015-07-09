
<%
	session.setAttribute("userid", null);
	session.invalidate();
	response.sendRedirect("/ServidorSIAR/Login.jsp");
%>
