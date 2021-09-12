<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>ForgotPassword</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
  	<form action="forgotPasswordServlet" method="post">
  		
  		<input type= "email" name= "email" placeholder = "Enter email" required>
  		<input type= "number" name ="mobileNumber" placeholder ="Enter mobile number" required>
  		<select name= "securityQuestion">
  		<option value= "In what city were you born?">In what city were you born?</option>
  		<option value= "What is the name of your favorite pet?">What is the name of your favorite pet?</option>
  		<option value= "What was your favorite food as a child?">What was your favorite food as a child?</option>
  		<option value= "What was the make of your first car?">What was the make of your first car?	</option>
  	</select>
  	<input type= "text" name= "answer" placeholder="Enter your answer" required>
  	<input type= "password" name= "newPassword" placeholder="Enter your new password" required>
    
    <input type= "submit" value="Change Password">
  		
  	</form>
     
      <h2><a href="">Login</a></h2>
  </div>
  <div class='whyforgotPassword'>
  
<%
  	String msg = request.getParameter("msg");
  if("success".equals(msg))
  {
%>   
<h1>Password Changed Successfully!</h1>
<%} %>

<%
  	
  if("fail".equals(msg) || "error".equals(msg))
  {
%>
<h1>Some thing Went Wrong! Try Again !</h1>
<%} %>

    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>
</body>
</html>