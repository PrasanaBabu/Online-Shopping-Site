<%@page import="java.sql.*"%> 
<%@page import="project.UserDao"%>
<%@include file="changeDetailsHeader.jsp" %>

<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Password </title>
</head>
<body>
<%
	String msg= request.getParameter("msg");
	if("confirmpassWrong".equals(msg))
	{
%>
<h3 class="alert">New password and Confirm password does not match!</h3>
<%	} %>

<%
	if("oldpassWrong".equals(msg))
	{
%> 
<h3 class="alert">Your old Password is wrong!</h3>
<%	} %>

<%
	if("done".equals(msg))
	{
%> 
<h3 class="alert">Password change successfully!</h3>
<%	} %>

<%
	if("error".equals(msg))
	{
%> 
<h3 class="alert">Some thing went wrong! Try again!</h3>
<%	} %>

<form action="changePasswordServlet" method="post">
<h3>Enter Old Password</h3>
 <input class="input-style" type="password" name="oldPassword" required>
  <hr>
 <h3>Enter New Password</h3>
 <input class="input-style" type="password" name="newPassword" required>
 <hr>
<h3>Enter Confirm Password</h3>
<input class="input-style" type="password" name="confirmPassword" required>
<hr>
 <button class="button" type= "submit" >Change Password <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>