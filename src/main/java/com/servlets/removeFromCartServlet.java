package com.servlets;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.UserDao;

@WebServlet("/removeFromCartServlet")
public class removeFromCartServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		
		String email=session.getAttribute("email").toString();
		String product_id = request.getParameter("id");
		
		//String incDec = request.getParameter("");
	
		int quantity = 0;
		int productPrice = 0;
		int productTotal = 0;
		int cartTotal = 0;
		
		try
		{
			String deleteQuery = "delete from cart where product_id = '"+product_id+"'and email= '"+email+"'and address is NULL ;";
			Connection con = UserDao.getConn();
			Statement st = con.createStatement();
			st.executeUpdate(deleteQuery);
			
			response.sendRedirect("myCart.jsp?msg=removed");
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
	}

	

}
