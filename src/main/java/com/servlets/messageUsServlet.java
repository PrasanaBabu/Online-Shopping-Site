package com.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.UserDao;

@WebServlet("/messageUsServlet")
public class messageUsServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String email=session.getAttribute("email").toString();
		
		String subject = request.getParameter("subject");
		String body = request.getParameter("body");
		
		try
		{
			String insertMessageQuery = "insert into messageUs(email,subject,body) values (?,?,?);";
			Connection con = UserDao.getConn();
			PreparedStatement ps = con.prepareStatement(insertMessageQuery);
			
			ps.setString(1, email);
			ps.setString(2, subject);
			ps.setString(3, body);
			
			ps.executeUpdate();
			
			response.sendRedirect("messageUs.jsp?msg=done");
			
			
		}
		catch(Exception e)
		{
			System.out.println(e);
			response.sendRedirect("messageUs.jsp?msg=error");
		}
	}

}
