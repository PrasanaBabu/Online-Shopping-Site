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

@WebServlet("/signupActionServlet")
public class signupActionServlet extends HttpServlet {

	private String INSERTQUERY = "insert into users values(?,?,?,?,?,?,?,?,?,?)";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String mobileNumber = request.getParameter("mobileNumber");
		String securityQuestion = request.getParameter("securityQuestion");
		String answer = request.getParameter("answer");
		String password = request.getParameter("password");
		String address = "";
		String city = "";
		String state = "";
		String country = "";

		try {

			Connection con = UserDao.getConn();

			PreparedStatement preparedStatement = con.prepareStatement(INSERTQUERY);

			preparedStatement.setString(1, name);
			preparedStatement.setString(2, email);
			preparedStatement.setString(3, mobileNumber);
			preparedStatement.setString(4, securityQuestion);
			preparedStatement.setString(5, answer);
			preparedStatement.setString(6, password);
			preparedStatement.setString(7, address);
			preparedStatement.setString(8, city);
			preparedStatement.setString(9, state);
			preparedStatement.setString(10, country);

			preparedStatement.executeUpdate();

			response.sendRedirect("signup.jsp?msg=valid");

		} catch (Exception e) {
			System.out.println(e);
			response.sendRedirect("signup.jsp?msg=invalid");

		}
	}

}
