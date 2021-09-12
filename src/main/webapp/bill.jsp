<%@page import="java.sql.*"%> 
<%@page import="project.UserDao"%>
<html>
<head>
<link rel="stylesheet" href="css/bill.css">
<title>Bill</title>
</head>
<body>
<%
	String email = session.getAttribute("email").toString();
	int total=0,sno=0;
	try
	{
		String selectQuery = "select sum(total) as total from cart where email='"+email+"' and status= 'bill' ;";
		Connection con = UserDao.getConn();
		Statement st = con.createStatement();
		ResultSet rsTotal = st.executeQuery(selectQuery);
		
		while(rsTotal.next())
		{
			total=rsTotal.getInt("total");
		
		}
		String selectUserQuery = "select * from users inner join cart where cart.email='"+email+"' and cart.status='bill';";
		ResultSet rsUser = st.executeQuery(selectUserQuery);
		while(rsUser.next())
		{
%>
<h3>Online shopping Bill (BTech Days)</h3>
<hr>
<div class="left-div"><h3>Name:  <%=rsUser.getString("name") %></h3></div>
<div class="right-div-right"><h3>Email: <%=rsUser.getString("email") %> </h3></div>
<div class="right-div"><h3>Mobile Number:  <%=rsUser.getString("mobileNumber") %></h3></div>  

<div class="left-div"><h3>Order Date: <%=rsUser.getString("orderDate")%> </h3></div>
<div class="right-div-right"><h3>Payment Method: <%=rsUser.getString("paymentMethod") %> </h3></div>
<div class="right-div"><h3>Expected Delivery: <%=rsUser.getString("deliveryDate") %> </h3></div> 

<div class="left-div"><h3>Transaction Id:<%=rsUser.getString("transactionId") %>  </h3></div>
<div class="right-div-right"><h3>City: <%=rsUser.getString("city") %> </h3></div> 
<div class="right-div"><h3>Address: <%=rsUser.getString("address") %> </h3></div> 

<div class="left-div"><h3>State: <%=rsUser.getString("state") %> </h3></div>
<div class="right-div-right"><h3>Country: <%=rsUser.getString("country") %> </h3></div>  
<%		break;} %>
<hr>


	
	<br>
	
<table id="customers">
<h3>Product Details</h3>
  <tr>
    <th>S.No</th>
    <th>Product Name</th>
    <th>category</th>
    <th>Price</th>
    <th>Quantity</th>
     <th>Sub Total</th>
  </tr>
  <%
  	String selectCartQuery = "select * from cart inner join product where cart.product_id=product.id and cart.email='"+email+"' and cart.status='bill' ;";
  	ResultSet rsCart = st.executeQuery(selectCartQuery);
  	while(rsCart.next())
  	{
  		sno+=1;	
  	
  %>
  <tr>
    <td><%out.println(sno); %></td>
    <td><%=rsCart.getString("name")%></td>
    <td><%=rsCart.getString("category")%></td>
    <td><%=rsCart.getString("price")%></td>
    <td><%=rsCart.getString("quantity")%></td>
     <td><%=rsCart.getString("total")%></td>
  </tr>
  <tr>
<%} %>
</table>
<h3>Total: <%=total %> </h3>
<a href="continueShoppingServlet"><button class="button left-button">Continue Shopping</button></a>
<a onclick="window.print();"><button class="button right-button">Print</button></a>
<br><br><br><br>
<%
  	
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
%>
</body>
</html>