package com.servlets;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.UserDao;

@WebServlet("/forgotPasswordServlet")
public class forgotPasswordServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String mobileNumber = request.getParameter("mobileNumber");
		String securityQuestion = request.getParameter("securityQuestion");
		String answer = request.getParameter("answer");
		String newPassword = request.getParameter("newPassword");
		int flag = 0;

		try {
			String selectQuery = "select * from users where email='" + email + "' and mobileNumber= '" + mobileNumber
					+ "' and securityQuestion='" + securityQuestion + "' and answer ='" + answer + "';";

			Connection con = UserDao.getConn();

			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);

			while (rs.next()) {
				String updateQuery = "update users set password='" + newPassword + "' where email='" + email
						+ "' and mobileNumber='" + mobileNumber + "';";
				flag = 1;
				st.executeUpdate(updateQuery);
				response.sendRedirect("forgotPassword.jsp?msg=success");
			}
			if (flag == 0)
				response.sendRedirect("forgotPassword.jsp?msg=fail");
		} catch (Exception e) {
			response.sendRedirect("forgotPassword.jsp?msg=error");
			System.out.println(e);
		}
	}

}
