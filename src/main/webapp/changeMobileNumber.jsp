<%@page import="java.sql.*"%> 
<%@page import="project.UserDao"%>
<%@include file="changeDetailsHeader.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>
<%
	String msg= request.getParameter("msg");
	if("done".equals(msg))
	{
%>
<h3 class="alert">Your Mobile Number successfully changed!</h3>
<%	} %>


<%
	if("passWrong".equals(msg))
	{
%> 
<h3 class="alert">Your Password is wrong!</h3>
<%	} %>

<form action= "changeMobileNumberServlet" method="post">
 <h3>Enter Your New Mobile Number</h3>
 	<input class="input-style" type= "number" name= "mobileNumber" placeholder="Enter your new Mobile Number" required>
 <hr>
<h3>Enter Password (For Security)</h3>
	<input class="input-style" type= "password" name= "password" placeholder="Enter your password" required>
<hr>
 <button type="submit" class="button">Change Mobile Number <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>