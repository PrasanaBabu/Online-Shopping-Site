<%@page import="java.sql.*"%>
<%@page import="project.UserDao"%>
<%@include file="header.jsp" %>
<!-- <%@include file="../footer.jsp" %> -->

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
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
<%
	String msg= request.getParameter("msg");
	if("added".equals(msg))
	{
%>
<h3 class="alert">Product added successfully!</h3>
<%	} %>

<%
	if("increased".equals(msg))
	{
%> 
<h3 class="alert">Product already exist in you cart! Quantity  increased!</h3>
<%  } %>
<!--  
<h3 class="alert">Password change successfully!</h3>
-->
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>
		<%
			try
			{
				String selectQuery = "select * from product where active = 'Yes';";
				Connection con = UserDao.getConn();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(selectQuery);
				
				while(rs.next())
				{
					int id = rs.getInt("id");
					//System.out.println(id+" is the id");
					//request.setAttribute("id",id);
			
		%>
          <tr>
            <td><%=rs.getInt("id") %></td>
            <td><%=rs.getString("name") %></td>
            <td><%=rs.getString("category") %></td>
            <td><i class="fa fa-inr"></i><%=rs.getString("price") %></td>
            <td><a href="addToCartServlet?id=<%=id%>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
          </tr>
		<%		}
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