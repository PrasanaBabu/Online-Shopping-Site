package com.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.UserDao;

@WebServlet("/editProductServlet")
public class editProductServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id= request.getParameter("id");
		String name= request.getParameter("name");
		String category= request.getParameter("category");
		String price= request.getParameter("price");
		String active= request.getParameter("active");
		
		try
		{
			String updateQuery = "update product set name = ? , category =? ,price = ? , active= ? where id=?;" ;
			Connection con = UserDao.getConn();
			PreparedStatement ps = con.prepareStatement(updateQuery);
			
			ps.setString(1, name);
			ps.setString(2, category);
			ps.setString(3, price);
			ps.setString(4, active);
			ps.setString(5, id);
			
			ps.executeUpdate();
			
			
			if(active.equals("No"))
			{
				String deleteQuery = "delete from cart where product_id=? and address is NULL;";
				ps=con.prepareStatement(deleteQuery);
				ps.setString(1, id);
				ps.executeUpdate();
				
			}
			
			response.sendRedirect("/Online_Shopping/admin/allProductEditProduct.jsp?msg=done");
			
			
		}
		catch(Exception e)
		{
			System.out.println(e);
			response.sendRedirect("/Online_Shopping/admin/allProductEditProduct.jsp?msg=error");
		}
	}

}
