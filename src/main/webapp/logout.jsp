<%@page import="javax.websocket.SendResult"%>
<%
session.invalidate();
response.sendRedirect("login.jsp");
%>