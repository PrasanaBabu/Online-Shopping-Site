<%@page import="java.sql.*"%> 
<%@page import="project.UserDao"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>
<%
	String msg= request.getParameter("msg");
	if("minQuantity".equals(msg))
	{
%>
<h3 class="alert">There is only one Quantity! So click on remove!</h3>
<%	} %>

<%
	if("doneInc".equals(msg))
	{
%> 
<h3 class="alert">Quantity  Increased Successfully!</h3>
<%	} %>

<%
	if("doneDec".equals(msg))
	{
%> 
<h3 class="alert">Quantity  Decreased Successfully!</h3>
<%	} %>

<%
	if("removed".equals(msg))
	{
%> 
<h3 class="alert">Product Successfully Removed!</h3>
<%	} %>

<table>
<thead>
		<%
			int total=0,sno=0;
			try
			{
				String selectQuery = "select sum(total) as total from cart where email='"+email+"' and address is NULL;";
				Connection con = UserDao.getConn();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(selectQuery);
				
				while(rs.next())
				{
					total=rs.getInt("total");
				}
			
			
			
		%>
          <tr>
            <th scope="col" style="background-color: yellow;">Total:  <i class="fa fa-inr"><%out.println(total); %></i> </th>
            <%if(total>0){ %><th scope="col"><a href="addressPaymentForOrder.jsp">Proceed to order</a></th> <%}%>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
      	<%
      		selectQuery = "select * from product inner join cart on product.id=cart.product_id and cart.email='"+email+"' and cart.address is NULL;";
      		
      		ResultSet rsJoined = st.executeQuery(selectQuery);
      		while(rsJoined.next())
      		{
      			//int subTotal = rsJoined.getInt("price") * rsJoined.getInt("quantity");
      		
      	%>
          <tr>
			<%sno+=1; %>
           <td><%out.println(sno); %></td>
            <td><%=rsJoined.getString("name") %></td>
            <td><%=rsJoined.getString("category") %></td>
            <td><i class="fa fa-inr"></i><%=rsJoined.getString("price") %> </td>
            <td><a href="incDecQuantityServlet?id=<%=rsJoined.getString("id")%>&quantity=inc"><i class='fas fa-plus-circle'></i></a> <%=rsJoined.getString("quantity") %> <a href="incDecQuantityServlet?id=<%=rsJoined.getString("id")%>&quantity=dec"><i class='fas fa-minus-circle'></i></a></td>
            <td><i class="fa fa-inr"></i><%=rsJoined.getString("total") %> </td>
            <td><a href="removeFromCartServlet?id=<%=rsJoined.getString("id")%>">Remove <i class='fas fa-trash-alt'></i></a></td>
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
