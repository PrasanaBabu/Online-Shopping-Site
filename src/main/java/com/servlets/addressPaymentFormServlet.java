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

@WebServlet("/addressPaymentFormServlet")
public class addressPaymentFormServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		String email=session.getAttribute("email").toString();
		String address= request.getParameter("address");
		String city= request.getParameter("city");
		String state= request.getParameter("state");
		String country= request.getParameter("country");
		String mobileNumber= request.getParameter("mobileNumber");
		String paymentMethod= request.getParameter("paymentMethod");
		String transactionId = request.getParameter("transactionId");
		
		String status = "bill";
		
		try
		{
			Connection con =UserDao.getConn();
			String updateUserQuery = "update users set address=?,city=?,state=?,country=?,mobileNumber=? where email=?;";
			PreparedStatement ps = con.prepareStatement(updateUserQuery);
			
			ps.setString(1, address);
			ps.setString(2, city);
			ps.setString(3, state);
			ps.setString(4, country);
			ps.setString(5, mobileNumber);
			ps.setString(6, email);
			
			ps.executeUpdate();
			
			String updateCartQuery = "update cart set address=?,city=?,state=?,country=?,mobileNumber=?,orderDate=now(),deliveryDate=DATE_ADD(orderDate,INTERVAL 7 DAY),paymentMethod=?,transactionId=?,status=? where email=? and address is NULL;";
		
			PreparedStatement psCart = con.prepareStatement(updateCartQuery);
			
			psCart.setString(1, address);
			psCart.setString(2, city);
			psCart.setString(3, state);
			psCart.setString(4, country);
			psCart.setString(5, mobileNumber);
			psCart.setString(6, paymentMethod);
			psCart.setString(7, transactionId);
			psCart.setString(8, status);
			psCart.setString(9, email);
			
			psCart.executeUpdate();
			
			response.sendRedirect("bill.jsp");
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
	}

}
