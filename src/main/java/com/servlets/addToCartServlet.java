package com.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.UserDao;


@WebServlet("/addToCartServlet")
public class addToCartServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String email=session.getAttribute("email").toString();
		String product_id = request.getParameter("id");
		
		//System.out.println(product_id+" is the id to be added");
		
		int quantity = 1;
		int productPrice = 0;
		int productTotal = 0;
		int cartTotal = 0;
		
		int flag=0;
		
		try
		{
			String selectQuery = "select * from product where id = '"+product_id+"';";
			
			Connection con = UserDao.getConn();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			
			while(rs.next())
			{
				productPrice = rs.getInt("price");
				//System.out.println("product price="+productPrice);
				productTotal = productPrice;
				
			}
			
			String selectCartQuery = "select * from cart where product_id = '"+product_id+"'and email= '"+email+"'and address is NULL ;";
			
		//	Statement st1 = con.createStatement();
			ResultSet rsCart = st.executeQuery(selectCartQuery);
			
			
			
			
			
			while(rsCart.next())
			{
				flag=1;
				
				cartTotal = rsCart.getInt("total");
				cartTotal = cartTotal + productTotal;
				quantity = rsCart.getInt("quantity");
				quantity = quantity + 1;
				
			}
			if(flag==1)
			{
				String updateQuery = "update cart set total='"+cartTotal+"' , quantity='"+quantity+"'  where product_id='"+product_id+"' and email='"+email+"'and address is NULL ;";
				st.executeUpdate(updateQuery);
				response.sendRedirect("home.jsp?msg=increased");
			}
			if(flag==0)
			{
				String insertQuery = "insert into cart(email,product_id,quantity,price,total) values(?,?,?,?,?) ;";
				PreparedStatement ps = con.prepareStatement(insertQuery);
				
				ps.setString(1, email);
				ps.setString(2, product_id);
				ps.setInt(3, quantity);
				ps.setInt(4, productPrice);
				ps.setInt(5, productTotal);
				
				ps.executeUpdate();
				response.sendRedirect("home.jsp?msg=added");
			}
		}
		catch(Exception e)
		{
			response.sendRedirect("home.jsp?msg=invalid");
			System.out.println(e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
	
//	}
}
