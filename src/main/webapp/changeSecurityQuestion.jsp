<%@page import="java.sql.*"%> 
<%@page import="project.UserDao"%>
<%@include file="changeDetailsHeader.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Security Question</title>
</head>
<body>
<%
	String msg= request.getParameter("msg");
	if("done".equals(msg))
	{
%>
<h3 class="alert">Your security Question successfully changed !</h3>
<%	} %>

<%
	if("passWrong".equals(msg))
	{
%> 
<h3 class="alert">Your Password is wrong!</h3>
<%	} %>

<form action="changeSecurityQuestionServlet" method="post">
<h3>Select Your New Securtiy Question</h3>
  <select class="input-style" name= "securityQuestion">
  		<option value= "In what city were you born?">In what city were you born?</option>
  		<option value= "What is the name of your favorite pet?">What is the name of your favorite pet?</option>
  		<option value= "What was your favorite food as a child?">What was your favorite food as a child?</option>
  		<option value= "What was the make of your first car?">What was the make of your first car?	</option>
  	</select>
  
  
 <hr>
 <h3>Enter Your New Answer</h3>
 <input class="input-style" type= "text" name= "answer" placeholder="Enter your new answer" required>
 
<hr>
<h3>Enter Your Password (For Security)</h3>
<input class="input-style" type= "password" name= "password" placeholder="Enter your password" required>


<hr>
 <button class="button" type="submit">Change Security Question <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>