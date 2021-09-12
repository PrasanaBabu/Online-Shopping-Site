<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="project.UserDao"%>
<%@include file="adminHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Messages Received <i class='fas fa-comment-alt'></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Email</th>
            <th scope="col">Subject</th>
            <th scope="col">Body</th>
          </tr>
        </thead>
        <tbody>
       <%
       try
		{
    	    String selectMesasgeQuery = "select * from messageUs;";
    	    Connection con = UserDao.getConn();
    	    Statement st = con.createStatement();
    	    ResultSet rs = st.executeQuery(selectMesasgeQuery);
    	    
    	    while(rs.next())
    	    {
    	    
    	%>	
		
          <tr>
            <td><%=rs.getString("id") %></td>
            <td><%=rs.getString("email") %></td>
            <td><%=rs.getString("subject") %></td>
            <td><%=rs.getString("body") %></td>
          </tr>
          <%
         }
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
       %>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>