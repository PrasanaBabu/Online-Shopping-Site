<%@page import="java.sql.*"%>
<%@page import="project.UserDao"%>
<%@include file="header.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
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
			int flag=0;
			String searchItem = request.getParameter("search");
			try
			{
				String selectQuery = "select * from product where name like '%"+searchItem+"%' or category like '%"+searchItem+"%' and active = 'Yes';";
				Connection con = UserDao.getConn();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(selectQuery);
				
				while(rs.next())
				{
					flag=1;
					int id = rs.getInt("id");
			
		%>
          <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(4)%> </td>
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
     <%
     	if(flag==0)
     	{
     %> 	
	<h1 style="color:white; text-align: center;">Nothing to show</h1>
	<%  } %>
      <br>
      <br>
      <br>
      

</body>
</html>
