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


@WebServlet("/changeMobileNumberServlet")
public class changeMobileNumberServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String email=session.getAttribute("email").toString();
		
		String password = request.getParameter("password");
		String newMobileNumber = request.getParameter("mobileNumber");
		
		
		String selectUserQuery = "select * from users where email='"+email+"' and password='"+password+"' ;";
	
		try
		{
			
			Connection con = UserDao.getConn();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectUserQuery);
			
			int flag=0;
			
			while(rs.next())
				flag=1;
			
			if(flag==0)
			{
				response.sendRedirect("changeMobileNumber.jsp?msg=passWrong");
			}
			else 
			{
				String updateNumberQuery= "update users set mobileNumber='"+newMobileNumber+"' where email= '"+email+"' ;";
				
				st.executeUpdate(updateNumberQuery);
				response.sendRedirect("changeMobileNumber.jsp?msg=done");
			}
			
		}
		catch(Exception e)
		{
			System.out.println(e);
			response.sendRedirect("changeMobileNumber.jsp?msg=error");
			
		}
	}

}
