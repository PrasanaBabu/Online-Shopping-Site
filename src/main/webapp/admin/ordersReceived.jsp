<%@include file="adminHeader.jsp" %>
<!-- <%@include file="../footer.jsp" %> -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="project.UserDao"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<link rel="stylesheet" href="../css/ordersReceived-style.css">
<title>Home</title>
<style>
.th-style
{ width: 25%;}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Orders Received <i class="fas fa-archive"></i></div>

<%
	String msg= request.getParameter("msg");
	if("cancel".equals(msg))
	{
%>
<h3 class="alert">Order Cancel Successfully!</h3>
<%	} %>

<%
	if("delivered".equals(msg))
	{
%> 
<h3 class="alert">Successfully Delivered!</h3>
<%	} %>

<%
	if("error".equals(msg))
	{
%> 
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<%	} %>

<table id="customers">
          <tr>
          <th>Mobile Number</th>
            <th scope="col">Product Name</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <th>Address</th>
            <th>City</th>
            <th>State</th>
            <th>Country</th>
            <th scope="col">Order Date</th>
             <th scope="col">Expected Delivery Date</th>
             <th scope="col">Payment Method</th>
              <th scope="col">T-ID</th>
              <th scope="col">Status</th>
              <th scope="col">Cancel order <i class='fas fa-window-close'></i></th>
              <th scope="col">Order Delivered <i class='fas fa-dolly'></i></i></th>
          </tr>
        <%
        int sno=0;
        try
		{
        	String selectMesasgeQuery = "select * from cart inner join product where cart.product_id=product.id and cart.orderDate is not NULL and cart.status='processing';";
    	    Connection con = UserDao.getConn();
    	    Statement st = con.createStatement();
    	    ResultSet rs = st.executeQuery(selectMesasgeQuery);
		
    	    while(rs.next())
    	    {
    	 %>   	
    	 
       
          <tr>
          <td><%=rs.getString("mobileNumber") %></td>
            <td><%=rs.getString("name") %></td>
            <td><%=rs.getString("quantity") %></td>
            <td><i class="fa fa-inr"></i><%=rs.getString("total") %>  </td>
                <td><%=rs.getString("address") %></td>
               <td><%=rs.getString("city") %></td>
                <td><%=rs.getString("state") %></td>
                 <td><%=rs.getString("country") %></td>
             <td><%=rs.getString("orderDate") %></td>
              <td><%=rs.getString("deliveryDate") %></td>
               <td><%=rs.getString("paymentMethod") %></td>
               <td><%=rs.getString("transactionId") %></td>
               <td><%=rs.getString("status") %></td>
               <td><a href="../cancelOrderServlet?id=<%=rs.getString("id") %>&email=<%=rs.getString("email") %>">Cancel <i class='fas fa-window-close'></i></a></td>
                <td><a href="../deliveredOrderServlet?id=<%=rs.getString("id") %>&email=<%=rs.getString("email") %>">Delivered <i class='fas fa-dolly'></i></i></a></td>
            </tr>
         <%   }
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
        %>
        </table>
      <br>
      <br>
      <br>

</body>
</html>