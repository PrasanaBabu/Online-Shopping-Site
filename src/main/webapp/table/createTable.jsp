<%@ page import="project.UserDao" %>
<%@ page import="java.sql.*" %>
<%
	try
	{
		
		Connection con = UserDao.getConn();
		
		Statement st = con.createStatement();
		
		String createUserQuery = "create table users(name varchar(100),email varchar(100)primary key,mobileNumber bigint,securityQuestion varchar(200),answer varchar(200),password varchar(100),address varchar(100),city varchar(100),state varchar(100),country varchar(100));";
		String createProductQuery = "create table product(id int ,name varchar(500),category varchar(200),price int,active varchar(10));";
		String createCartQuery = "create table cart(email varchar(100),product_id int,quantity int,price int,total int,address varchar(100),city varchar(100),state varchar(100),country varchar(100),mobileNumber bigint,orderDate varchar(100),deliveryDate varchar(100),paymentMethod varchar(100),transactionId varchar(100),status varchar(10));";
		String createMessagesQuery= "create table messageUs (id int AUTO_INCREMENT,email varchar(100),subject varchar(199) ,body varchar(500),PRIMARY KEY(id));";
		
		//System.out.println(createUserQuery);
		//st.execute(createUserQuery);
		
		//System.out.println(createProductQuery);
		//st.execute(createProductQuery);
		
		//System.out.println(createCartQuery);
		//st.execute(createCartQuery);
		
		System.out.println(createMessagesQuery);
		st.execute(createMessagesQuery);
		
		System.out.println("Table created");
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
%>
