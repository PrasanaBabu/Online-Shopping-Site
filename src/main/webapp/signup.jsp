<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Signup</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
  	<form action= "signupActionServlet" method="post">
  	<input type= "text" name= "name" placeholder="Enter your name" required>
  	<input type= "email" name= "email" placeholder="Enter your email" required>
  	<input type= "number" name= "mobileNumber" placeholder="Enter your phone number" required>
  	<select name= "securityQuestion">
  		<option value= "In what city were you born?">In what city were you born?</option>
  		<option value= "What is the name of your favorite pet?">What is the name of your favorite pet?</option>
  		<option value= "What was your favorite food as a child?">What was your favorite food as a child?</option>
  		<option value= "What was the make of your first car?">What was the make of your first car?	</option>
  	</select>
  	<input type= "text" name= "answer" placeholder="Enter your answer" required>
    <input type= "password" name= "password" placeholder="Enter your password" required>
    <input type= "submit" value="Signup">
    </form>
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>
<%
	String msg =request.getParameter("msg");
	if("valid".equals(msg))
	{
%>
<h1>Successfully Registered</h1>

<%  } %>

<%
	if("invalid".equals(msg))
	{
%>
		<h1>Some thing Went Wrong! Try Again !</h1>

<%  } %> 


    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>

</body>
</html>