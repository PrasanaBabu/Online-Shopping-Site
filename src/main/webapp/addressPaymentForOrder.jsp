<%@page import="java.sql.*"%> 
<%@page import="project.UserDao"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>

<script>
if(window.history.forward(1)!= null)
		window.history.forward(1);
</script>

</head>
<body>
<br>
<table>
<thead>
	<%
		String email = session.getAttribute("email").toString();
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
          <th scope="col"><a href="myCart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><%out.println(total); %> </th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
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
            <td><i class="fa fa-inr"></i> <%=rsJoined.getString("price") %></td>
            <td> <%=rsJoined.getString("quantity") %></td>
            <td><i class="fa fa-inr"></i><%=rsJoined.getString("total") %></td>
            </tr>
         	<%}
      		String selectAddressQuery = "select * from users where email= '"+email+"';";
         	rs = st.executeQuery(selectAddressQuery);
         	while(rs.next())
         	{
         		
         	
         	%>
        </tbody>
      </table>
      
<hr style="width: 100%">
<form action= "addressPaymentFormServlet" method="post">
		
 
 <div class="left-div">
 <h3>Enter Address</h3>
	<input class= "input-style" type= "text" name= "address" value="<%=rs.getString("address")%>" placeholder= "Enter address">
 </div>

<div class="right-div">
<h3>Enter city</h3>
	<input class= "input-style" type= "text" name= "city" value="<%=rs.getString("city")%>" placeholder= "Enter city">
</div> 

<div class="left-div">
<h3>Enter State</h3>
	<input class= "input-style" type= "text" name= "state" value="<%=rs.getString("state")%>" placeholder= "Enter state">
</div>

<div class="right-div">
<h3>Enter country</h3>
	<input class= "input-style" type= "text" name= "country" value="<%=rs.getString("country")%>" placeholder= "Enter country">
</div>
<h3 style="color: red">*If there is no address its mean that you did not set you address!</h3>
<h3 style="color: red">*This address will also updated to your profile</h3>
<hr style="width: 100%">
<div class="left-div">
<h3>Select way of Payment</h3>
 <select class = "input-style" name= "paymentMethod">
 	<option value= "Cash on Delivery">Cash on Delivery</option>
 	<option value ="Online Payment">Online Payment </option>
 </select>
</div>



<div class="right-div">
<h3>Pay online to this id : kurvilla@pay.com</h3>
	<input class= "input-style" type= "text" name= "transactionId" placeholder ="Enter transaction ID">
<h3 style="color: red">*If you select online Payment then enter you transaction ID here otherwise leave this blank</h3>
</div>
<hr style="width: 100%">

<div class="left-div">
<h3>Mobile Number</h3>
	<input class= "input-style" type= "text" name= "mobileNumber" value="<%=rs.getString("mobileNumber") %>" placeholder ="Enter mobile number" required>
<h3 style="color: red">*This mobile number will also updated to your profile</h3>
</div>
<div class="right-div">
<h3 style="color: red">*If you enter wrong transaction id then your order will we can cancel!</h3>
<button class = "button" type= "submit">Proceed To Generate Bill<i class='far fa-arrow-alt-circle-right'></i></button>

<h3 style="color: red">*Fill form correctly</h3>
</div>
</form>
<%
         	}	
      		
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	%>

      <br>
      <br>
      <br>

</body>
</html>
