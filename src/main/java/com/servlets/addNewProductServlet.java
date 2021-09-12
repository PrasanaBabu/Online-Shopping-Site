package com.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.UserDao;

@WebServlet("/addNewProductServlet")
public class addNewProductServlet extends HttpServlet {
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("inside addnewproductservlet");
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String price = request.getParameter("price");
		String category = request.getParameter("category");
		String active = request.getParameter("active");

		try {
			String insertQuery = "insert into product values(?,?,?,?,?);";
			Connection con = UserDao.getConn();

			PreparedStatement ps = con.prepareStatement(insertQuery);
			ps.setString(1, id);
			ps.setString(2, name);
			ps.setString(3, category);
			ps.setString(4, price);
			ps.setString(5, active);

			ps.executeUpdate();
			response.sendRedirect("/Online_Shopping/admin/addNewProduct.jsp?msg=done");
			System.out.println("inserted new product");
			
			
		} catch (Exception e) {
			response.sendRedirect("/Online_Shopping/admin/addNewProduct.jsp?msg=error");
		}
	}

}
