package com.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.UserDao;

/**
 * Servlet implementation class deliveredOrderServlet
 */
@WebServlet("/deliveredOrderServlet")
public class deliveredOrderServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
	//	String email=session.getAttribute("email").toString();
		String email=request.getParameter("email");
		String id=request.getParameter("id");
		String status = "delivered";
		
		try
		{
			String updateCartQury = "update cart set status='"+status+"' where product_id='"+id+"' and email ='"+email+"' and address is not NULL;";
			Connection con = UserDao.getConn();
			
			Statement st = con.createStatement();
			st.executeUpdate(updateCartQury);
			response.sendRedirect("/Online_Shopping/admin/ordersReceived.jsp?msg=delivered");
		}
		catch(Exception e)
		{
			System.out.println(e);
			response.sendRedirect("/Online_Shopping/admin/ordersReceived.jsp?msg=error");
		}
		
	}

}
