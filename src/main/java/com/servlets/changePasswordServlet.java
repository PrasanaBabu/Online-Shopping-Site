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


@WebServlet("/changePasswordServlet")
public class changePasswordServlet extends HttpServlet {
	
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String email=session.getAttribute("email").toString();
		
		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");
		String confirmPassword = request.getParameter("confirmPassword");
		
		String selectUserQuery = "select * from users where email='"+email+"' and password='"+oldPassword+"' ;";
	
		try
		{
			
			Connection con = UserDao.getConn();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectUserQuery);
			
			int flag=0;
			
			while(rs.next())
			{
				flag=1;
				
				if(newPassword.equals(confirmPassword))
				{
					String updatePassQuery= "update users set password='"+newPassword+"' where email= '"+email+"' ;";
					
					st.executeUpdate(updatePassQuery);
					response.sendRedirect("changePassword.jsp?msg=done");
				}
				else
				{
					response.sendRedirect("changePassword.jsp?msg=confirmpassWrong");
					
				}
			}
			
			if(flag==0)
			{
				response.sendRedirect("changePassword.jsp?msg=oldpassWrong");
			}
			
			
		}
		catch(Exception e)
		{
			System.out.println(e);
			response.sendRedirect("changePassword.jsp?msg=error");
			
		}
		
	}

}
