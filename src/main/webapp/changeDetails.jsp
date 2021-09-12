<%@page import="java.sql.*"%> 
<%@page import="project.UserDao"%>
<%@include file="changeDetailsHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<title>Change Details</title>
<style>
hr
{width:70%;}</style>
</head>
<body>
<%
	//String email1 = session.getAttribute("email").toString(); already in header 
	try{
		
		String selectUserQuery = "select * from users where email='"+email+"';";
		Connection con = UserDao.getConn();
		Statement st = con.createStatement();
		
		ResultSet rsUser = st.executeQuery(selectUserQuery);
		while(rsUser.next())
		{
			
		

%>
<h3>Name:<%=rsUser.getString("name") %> </h3>
<hr>
 <h3>Email:<%=rsUser.getString("email") %> </h3>
 <hr>
 <h3>Mobile Number:<%=rsUser.getString("mobileNumber") %> </h3>
 <hr>
<h3>Security Question:<%=rsUser.getString("securityQuestion") %> </h3>
<hr>
      <br>
      <br>
      <br>
<%		}
	}
	catch(Exception e)
	{
		System.out.println(e);
	}	
%>
</body>
</html>