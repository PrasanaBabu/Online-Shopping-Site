<%@page import="java.sql.*"%> 
<%@page import="project.UserDao"%>
<%@include file="changeDetailsHeader.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Add Or Change Address</title>
</head>
<body>
<%
	String msg= request.getParameter("msg");
	if("done".equals(msg))
	{
%>
<h3 class="alert">Address Successfully Updated !</h3>
<%	} %>

<%
	if("error".equals(msg))
	{
%> 
<h3 class="alert">Some thing Went Wrong! Try Again!</h3>
<%	} %>
<% 
try
{
	
	String selectUserQuery = "select * from users;";
	Connection con = UserDao.getConn();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery(selectUserQuery);
	while(rs.next())
	{
%>
<form action= "addChangeAddressServlet" method= "post">
<h3>Enter Address</h3>
 <input class="input-style" type ="text" value="<%=rs.getString("address") %>" name= "address" placeholder="Enter Address here" required>
 <hr>
 <h3>Enter city</h3>
 <input class="input-style" type ="text" value="<%=rs.getString("city") %>" name= "city" placeholder="Enter city here" required>
<hr>
<h3>Enter State</h3>
<input class="input-style" type ="text" value="<%=rs.getString("state") %>" name= "state" placeholder="Enter state here" required>
<hr>
<h3>Enter country</h3>
<input class="input-style" type ="text" value="<%=rs.getString("country") %>" name= "country" placeholder="Enter country here" required>
<hr>
 <button class= "button" type="submit">Change Address <i class='far fa-arrow-alt-circle-right'></i></button>
<%
	}
}
catch(Exception e)
{
	System.out.println(e);
}
%>
</form>
</body>
<br><br><br>
</html>