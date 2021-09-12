package com.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.UserDao;

@WebServlet("/addChangeAddressServlet")
public class addChangeAddressServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String email=session.getAttribute("email").toString();
		
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String country = request.getParameter("country");
		
		
		String selectUserQuery = "select * from users where email='"+email+"';";
	
		try
		{
			
			Connection con = UserDao.getConn();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectUserQuery);
			
			
			
			rs.next();
				
			
			
			
			String updatePassQuery= "update users set  address='"+address+"' , country='"+country+"' , state='"+state+"' , city='"+city+"' where email= '"+email+"' ;";
				
			st.executeUpdate(updatePassQuery);
			response.sendRedirect("addChangeAddress.jsp?msg=done");
			
			
		}
		catch(Exception e)
		{
			System.out.println(e);
			response.sendRedirect("addChangeAddressjsp?msg=error");
			
		}
		
	}
		
	}


