package com.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.UserDao;

@WebServlet("/continueShoppingServlet")
public class continueShoppingServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		HttpSession session = request.getSession();
		
		String email=session.getAttribute("email").toString();
		
		String status = "processing";
		try
		{
			String updateCartQuery = "update cart set status=? where email=? and status='bill';";
			Connection con = UserDao.getConn();
			PreparedStatement ps = con.prepareStatement(updateCartQuery);
			
			ps.setString(1, status);
			ps.setString(2, email);
			ps.executeUpdate();
			
			response.sendRedirect("home.jsp");
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}


}
